/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

if global.eddieInstance != -1 {
    playSFX(sfxError);
    count++;
	cancelQuit = true;
	show_debug_message("Could not call Eddie.");
    return false;
}

if instance_exists(prtPlayer) {
    show_debug_message("Calling Eddie.");
	
    var tpY, airIncrease, eddie;
    tpY = 0;
    if prtPlayer.ground
        airIncrease = 0;
    else
        airIncrease = 12; //When in the air, the upwards range is reduced because Eddie could otherwise spawn above ceilings
		
	var upperSpawnCap = 64;
	var lowerSpawnCap = 48;
	var upperPriority = true;
	var newSystem = true;
    
    ///Spawn position calculation system
	if newSystem {
		///NEW SYSTEM: functions more like Rush in Mega Man Maker. Allows Eddie to automatically spawn up to 4 tiles above or 3 tiles below MM where a spot is available.
		eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, prtPlayer.y + airIncrease, objEddie);
		eddie.shouldLand = false;
		with eddie {
		
			var _initY = y;
			var _bottomY = -1000000;
			var _topY = -1000000;
		
			var _mask = mask_index;
			mask_index = sprRushTeleportMask;
			checkGround();
			mask_index = _mask;
			if collision_rectangle_free(x-5, bbox_top, x+5, bbox_bottom, false, true, true) && ground
			{
				shouldLand = true; ///If there's already a spot available directly in front of MM, we don't need to do anything else.
			}
		
			if !shouldLand {
			
				y = _initY;
			
				while tpY <= lowerSpawnCap && y < global.viewY + global.viewHeight && _bottomY == -1000000 {
					_mask = mask_index;
					mask_index = sprRushTeleportMask;
					checkGround();
					mask_index = _mask;
					if collision_rectangle_free(x-5, bbox_top, x+5, bbox_bottom, false, true, true) && ground
					{
						_bottomY = y;
					}
					else {
						y++;
						tpY++;
					}
				}
			
				y = _initY;
				tpY = 0;
			
				while tpY <= upperSpawnCap && y >= global.viewY && _topY == -1000000 {
					_mask = mask_index;
					mask_index = sprRushTeleportMask;
					checkGround();
					mask_index = _mask;
					if collision_rectangle_free(x-5, bbox_top, x+5, bbox_bottom, false, true, true) && ground
					{
						_topY = y;
					}
					else {
						y--;
						tpY++;
					}
				}
			
				y = _initY;
			
				///Whichever available spot between the closest upper spot and the closest lower spot is the closest to Rush's original position, we spawn him there.
				if _bottomY != -1000000 && ((_bottomY - y < y - _topY or (_bottomY - y == y - _topY and !upperPriority)) or _topY == -1000000) {
					shouldLand = true;
					y = _bottomY;
				}
				else if _topY != -1000000 && ((y - _topY < _bottomY - y or (y - _topY == _bottomY - y and upperPriority)) or _bottomY == -1000000) {
					shouldLand = true;
					y = _topY;
				}
				///Currently, in the event that the two distances are equal, upper spots will be prioritised since worst-case scenario, we'll be travelling further up than down.
			}
		}
	}
	else {
		///OLD SYSTEM: functions more like Rush in MM9 and 10. Eddie will not land if there isn't a spot available directly in front of MM.
		while !(!position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objSolid) && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objBossDoorH) && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformSolid)
	    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objTopSolid) && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
	    && (position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid)
	    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough)))
	    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
		&& !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
	    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
	    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
	    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
	    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoor)
	    && tpY <= 12+52 {
	        tpY++;
	    }
    
	    if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid)
		|| position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH)
	    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid)
	    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid)
	    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough) {
	        if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.y-16, objEddie);
	            eddie.shouldLand = true;
	        }
			else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.y-16, objEddie);
	            eddie.shouldLand = true;
	        }
	        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.bbox_top-16, objEddie);
	            eddie.shouldLand = true;
	        }
	        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.y-16, objEddie);
	            eddie.shouldLand = true;
	        }
	        else {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.bbox_top-16, objEddie);
	            eddie.shouldLand = true;
	        }
	    }
	    else if !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objSolid)
		&& !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objBossDoorH)
	    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformSolid)
	    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objTopSolid)
	    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
	    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objBossDoor)
	    && (position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid)
	    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough)) {
	        if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.y-16, objEddie);
	            eddie.shouldLand = true;
	        }
			else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.y-16, objEddie);
	            eddie.shouldLand = true;
	        }
	        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.bbox_top-16, objEddie);
	            eddie.shouldLand = true;
	        }
	        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.y-16, objEddie);
	            eddie.shouldLand = true;
	        }
	        else {
	            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough);
	            eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, solidID.bbox_top-16, objEddie);
	            eddie.shouldLand = true;
	        }
	    }
	    else {
	        eddie = instance_create(prtPlayer.x+prtPlayer.image_xscale*32, sprite_get_ycenter_object(prtPlayer), objEddie);
	        eddie.shouldLand = false;
	    }
	}
	with eddie
	{
		global.eddieInstance = id;
		called = true;
		itemsLeft = itemsCalled;
	}
    playSFX(sfxMenuSelect);
    
    return true;
}
else {
    playSFX(sfxError);
    count++;
	cancelQuit = true;
    return false;
}

