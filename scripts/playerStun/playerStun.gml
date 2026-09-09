/// @description playerStun(stunTime, bypassImmunityChecks, [knockbackSpeed])
function playerStun(argument0, argument1) {
	//Call it like this: with prtPlayer playerStun();
	//Stuns the player
	assert(argument0 >= 0, "playerStun: Stun time must be non-negative");
	assert(argument1 == 0 or argument1 == 1, "playerStun: Value for bypassing immunity checks must be boolean");
	
	var _isImmune = false; //Replace 'false' and add actual immunity checks as they come
    
	if !isHit && !isStun && (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) && (!_isImmune or argument1) {
		stunTimer = argument0 + extraStunFrames;
		isStun = true;
		isStep = false;
		stepTimer = 0;
		cancelStep = false;
		climbing = false;
		canGravity = true;
		isShoot = false;
		isThrow = false;
		onRushJet = false;
    
		if cfgLoseChargeOnStun {
		    weapons[global.currentWeapon].chargeTimer = 0;
		    weapons[global.currentWeapon].initChargeTimer = 0;
			weapons[global.currentWeapon].chargeAnimTimer = 0;
			with weapons[global.currentWeapon] stopSFX(chargeSFX);
			with weapons[global.currentWeapon] stopSFX(chargedSFX);
			prtPlayer.playChargeSound = true;
			prtPlayer.playChargedSound = true;
		    with prtPlayer event_user(0); //Reset the colors
		}
    
		if !locked {
		    canMove = false;
		    canSpriteChange = false;
		    isSlide = false;
			isDash = false;
			flying = false;
			rollbackMovement = false;
		    mask_index = mskMegamanSlide;
			
			//To make sure we don't get crushed if we're stunned while close to a wall
			var endLoop, attempts;
	        endLoop = false;
			attempts = 0;
			var orig_x = x;
	        while (place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)) && endLoop == false && attempts < abs(round((sprite_get_width(mask_index) * image_xscale) / 2))
	        {
	            if !place_meeting(x, y, objSolid) && place_meeting(x, y, prtMovingPlatformSolid)
	            {
	                if instance_place(x, y, prtMovingPlatformSolid).dead == true
	                    endLoop = true;
	            }
				
				var mySolid = instance_place(x, y, objSolid);
				if mySolid < 0
				{
					if instance_place(x, y, prtMovingPlatformSolid).dead == false
						mySolid = instance_place(x, y, prtMovingPlatformSolid);
				}
                
	            if mySolid >= 0
					x += sign(x - mySolid.x);
				attempts++;
	        }
			if (place_meeting(x, y, objSolid) || (place_meeting(x, y, prtMovingPlatformSolid) and !instance_place(x, y, prtMovingPlatformSolid).dead)) && !endLoop
			{
				var mySolid = instance_place(x, y, objSolid);
				if mySolid < 0
				{
					if instance_place(x, y, prtMovingPlatformSolid).dead == false
						mySolid = instance_place(x, y, prtMovingPlatformSolid);
				}
                
	            if mySolid >= 0
					x = orig_x;
			}
			
			if argument_count > 2
			{
				stunKnockbackSpeed = argument2 * -image_xscale;
				
				if stunKnockbackSpeed != 0
				{
					var _total_xspeed = global.xspeed + global.xforce;
					var _total_yspeed = global.yspeed + global.yforce;
					
					var _xc;
					if image_xscale < 0 { _xc = clamp(abs(_total_xspeed), 0.5, 1); }
					else { _xc = clamp(abs(_total_xspeed), 0.500005, 1); }
			
			        if (image_xscale >= 0 and !(bbox_left+_total_xspeed-_xc < sectionLeft or bbox_left+_total_xspeed-_xc < 0))
					|| (image_xscale < 0 and !(bbox_right+_total_xspeed+_xc > sectionRight or bbox_right+_total_xspeed+_xc > room_width))
					{
						if !place_meeting(x-(_xc * image_xscale), y, objSolid) && !place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid)
				            global.xspeed = stunKnockbackSpeed;
				        else if place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
				        {
				            if instance_place(x-(_xc * image_xscale), y, prtMovingPlatformSolid).dead == true
				                global.xspeed = stunKnockbackSpeed;
				        }
					}
				}
				else
				{
					if !place_meeting(x, y+1, objIce)
						global.xspeed = 0;
				}
			}
			else
			{
				if !place_meeting(x, y+1, objIce)
					global.xspeed = 0;
			}
			
			if global.yspeed < 0
				global.yspeed = 0;
        
		    sprite_index = spriteStun;
			image_speed = speedStun;
		}
	}
	
	
	
}
