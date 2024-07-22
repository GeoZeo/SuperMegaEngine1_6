//Handles the boss's death
//Also transforms into the Mega Man that automatically moves to the center of the screen

myBoss = instance_nearest(x, y, prtBoss);
control = instance_nearest(x, y, objBossControl);
bossID = myBoss.bossID;
noBoss = false;

bossRush = control.bossRush;

//If there is a teleporter in the room (boss rush), just destroy the death timer
instance_activate_object(objTeleport);
with objTeleport {
	
    if insideView() && other.bossRush {
        on = true;
		if other.control.itemToSpawn > -1 {
			if other.control.bossSpawnItem {
				var inst = instance_create(other.x - 8, other.y - 8, other.control.itemToSpawn);
				inst.alarm[0] = room_speed * 9999;
			}
			else {
				var inst = instance_create(other.control.itemX, other.control.itemY, other.control.itemToSpawn);
			}
		}
        global.bossRushDefeated[other.bossID] = true;
        if numRushBossesDefeated() == 8 {
			instance_activate_object(objBossDoor);
			with objBossDoor {
				if rushExit
					canOpen = true;
			}
			instance_activate_object(objBossDoorH);
			with objBossDoorH {
				if rushExit
					canOpen = true;
			}
			
			with objTeleport {
				if rushExit
					on = true;
			}
        }
        with other instance_destroy();
        with objBossControl {
            drawHealthBar = false;
        }
        exit;
    }
}

if bossRush {
	if control.bossSpawnItem && control.itemToSpawn > -1 {
		var inst = instance_create(x - 8, y - 8, control.itemToSpawn);
        inst.alarm[0] = 105 * 2;
		inst.teleport = true;
		inst.toX = control.toX;
		inst.toY = control.toY;
	}
	else {
		var myTeleport = instance_create(mask_get_xcenter_object(prtPlayer), mask_get_ycenter_object(prtPlayer), objTeleport);
		with myTeleport {
			image_xscale = 1/16;
			image_yscale = 1/16;
			var _control = other.control;
			toX = _control.toX;
			toY = _control.toY;
			drawLED = false;
			on = false;
			alarm[2] = 180;
		}
		
		if control.itemToSpawn > -1
			var inst = instance_create(control.itemX, control.itemY, control.itemToSpawn);
	}
	global.bossRushDefeated[other.bossID] = true;
    if numRushBossesDefeated() == 8 {
        instance_activate_object(objBossDoor);
		with objBossDoor {
			if rushExit
				canOpen = true;
		}
		instance_activate_object(objBossDoorH);
		with objBossDoorH {
			if rushExit
				canOpen = true;
		}
			
		with objTeleport {
			if rushExit
				on = true;
		}
    }
    instance_destroy();
    with objBossControl {
        drawHealthBar = false;
    }
    exit;
}

//Same goes for if the level still doesn't end here otherwise
if !control.endLevel {
	var warp = true;
	instance_activate_object(objBossDoor);
	with objBossDoor
	{
		if insideView() && ((dir == 1 && prtPlayer.x > x) or (dir == -1 && prtPlayer.x <= x)) {
			canOpen = true;
			warp = false;
		}
	}
	instance_activate_object(objBossDoorH);
	with objBossDoorH
	{
		if insideView() && ((dir == 1 && prtPlayer.y > y) or (dir == -1 && prtPlayer.y <= y)) {
			canOpen = true;
			warp = false;
		}
	}
	instance_activate_object(objTeleport);
	with objTeleport
	{
		if insideView() {
			on = true;
			warp = false;
		}
	}
	
	var inst;
	if warp {
		if control.bossSpawnItem && control.itemToSpawn > -1 {
			inst = instance_create(x - 8, y - 8, control.itemToSpawn);
	        inst.alarm[0] = 105 * 2;
			inst.teleport = true;
			inst.toX = control.toX;
			inst.toY = control.toY;
			
			if (!is_string(control.endMusic) and control.endMusic > -1) || (is_string(control.endMusic) and control.endMusic != noone) {
						
				var myPlayer = instance_create(x, y, objMusicPlayer)
				with myPlayer
				{
					myBGM = other.control.endMusic;
					myVolume = other.control.endMusicVolume;
					myLoopStart = other.control.endMusicLoopPointStart;
					myLoopEnd = other.control.endMusicLoopPointEnd;
					destroyOnActivation = other.control.endMusicDestroyOnActivate;
							
					event_user(0);
				}
			}
			else if control.triggerNearestMusicPlayer {
				with instance_nearest(x, y, objMusicPlayer) event_user(0);
			}
		}
		else {
			var myTeleport = instance_create(mask_get_xcenter_object(prtPlayer), mask_get_ycenter_object(prtPlayer), objTeleport);
			with myTeleport {
				image_xscale = 1/16;
				image_yscale = 1/16;
				var _control = other.control;
				toX = _control.toX;
				toY = _control.toY;
				drawLED = false;
				on = false;
				alarm[2] = 180;
			}
		
			if control.itemToSpawn > -1
				inst = instance_create(control.itemX, control.itemY, control.itemToSpawn);
		}
	}
	else {
		
		if control.itemToSpawn > -1 {
			if control.bossSpawnItem {
				inst = instance_create(x - 8, y - 8, control.itemToSpawn);
				inst.alarm[0] = room_speed * 9999;
			}
			else {
				inst = instance_create(other.control.itemX, other.control.itemY, other.control.itemToSpawn);
			}
		}
		
		if (!is_string(control.endMusic) and control.endMusic > -1) || (is_string(control.endMusic) and control.endMusic != noone) {
						
			var myPlayer = instance_create(x, y, objMusicPlayer)
			with myPlayer
			{
				myBGM = other.control.endMusic;
				myVolume = other.control.endMusicVolume;
				myLoopStart = other.control.endMusicLoopPointStart;
				myLoopEnd = other.control.endMusicLoopPointEnd;
				destroyOnActivation = other.control.endMusicDestroyOnActivate;
							
				event_user(0);
			}
		}
		else if control.triggerNearestMusicPlayer {		
			with instance_nearest(x, y, objMusicPlayer) event_user(0);
		}
	}
	
	instance_destroy();
    with objBossControl {
        drawHealthBar = false;
    }
	exit;
}

if instance_exists(objMegamanDeathTimer)
	instance_destroy();

//Otherwise, normal behavior (weapon absorb, etc...)
if !noBoss
	alarm[0] = 240;

xspeed = 0;
yspeed = 0;
currentGrav = cfgGravity;
stepTime = cfgStepFrames;
stepTimer = 0;
isMM = false;
ground = true;
prevGround = ground;
canInitJump = true;
absorbing = false;
absorbAmount = 0;
startTeleportTimer = 0;
teleporting = false;
teleportTimer = 0;
teleportY = 0;
currentTeleportSpeed = 0;
update_rate = 1;

with prtPlayer canPause = false;
with prtPlayerProjectile instance_destroy();

