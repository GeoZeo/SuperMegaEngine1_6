//Handles the boss's death
//Also transforms into the Mega Man that automatically moves to the center of the screen

myBoss = instance_nearest(x, y, prtBoss);
control = instance_nearest(x, y, objBossControl);
bossID = myBoss.bossID;
noBoss = false;

bossRush = false;

//If there is a teleporter in the room (boss rush), just destroy the death timer
instance_activate_object(objTeleport);
with objTeleport {
	if boss > -1
		bossRush = true;
	
    if insideView() {
        on = true;
        var inst = instance_create(other.x - 8, other.y - 8, objLifeEnergyBig);
        inst.alarm[0] = room_speed * 9999;
        global.bossRushDefeated[other.bossID] = true;
        if numRushBossesDefeated() == 8 {
            instance_activate_object(objBossDoor);
            objBossDoor.canOpen = true;
        }
        with other instance_destroy();
        with objBossControl {
            drawHealthBar = false;
        }
        exit;
    }
}

if bossRush {
	if !control.timerWarp {
		var inst = instance_create(other.x - 8, other.y - 8, objLifeEnergyBig);
        inst.alarm[0] = 105 * 2;
		inst.teleport = true;
		inst.toX = control.toX;
		inst.toY = control.toY;
		inst.returnBGM = control.returnBGM;
	}
	else {
		alarm[3] = 240;
		var inst = instance_create(control.itemX, control.itemY, objLifeEnergyBig);
        inst.alarm[0] = room_speed * 9999;
	}
	global.bossRushDefeated[other.bossID] = true;
    if numRushBossesDefeated() == 8 {
        instance_activate_object(objBossDoor);
        objBossDoor.canOpen = true;
    }
    with other instance_destroy();
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
		if insideView()
			canOpen = true;
			warp = false;
	}
	instance_activate_object(objBossDoorH);
	with objBossDoorH
	{
		if insideView()
			canOpen = true;
			warp = false;
	}
	instance_activate_object(objTeleport);
	with objTeleport
	{
		if insideView()
			on = true;
			warp = false;
	}
	
	var inst = instance_create(x - 8, y - 8, objLifeEnergyBig);
	inst.alarm[0] = room_speed * 9999;
	
	with other instance_destroy();
    with objBossControl {
        drawHealthBar = false;
    }
	exit;
}

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
update_rate = 1;

with prtPlayer canPause = false;
with prtPlayerProjectile instance_destroy();

