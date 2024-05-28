door = false;

global.frozen = true;
global.switchingSections = true;

with prtEnemy beenOutsideView = true;
with prtPlayerProjectile if destroyOnScroll instance_destroy();
with objMegamanExplosion instance_destroy();

with prtRush instance_destroy();
with objRushJet instance_destroy();

with prtPlayer {
    if onRushJet {
        onRushJet = false;
        canWalk = true;
    }
}

initScaleX = 0;

with prtEnemyProjectile instance_destroy();
deactivateUnimportantObjects();

if instance_exists(prtPlayer)
{
    //Basically copy the player's appearance, so that the object can return to its original behaviour when done switching sections
    with prtPlayer visible = false;
    sprite_index = prtPlayer.sprite_index;
    image_index = prtPlayer.image_index;
    imgSpd = prtPlayer.image_speed;
    image_speed = imgSpd;
    image_xscale = prtPlayer.image_xscale;
	initScaleX = -prtPlayer.image_xscale;
	
    alarm[0] = 1;
}
else
{
    instance_destroy();
    global.frozen = false;
}



//Variables that can be modified to make switching sections faster/slower
screenSpeedHor = 4; //The speed that the screen will move at if travelling horizontally
playerSpeedHor = 0.4; //The speed that Mega Man will move at if travelling horizontally
screenSpeedVert = 4; //Same as above but if travelling vertically
playerSpeedVert = 0.4; //Same as above but if travelling vertically

playerSpeedHorDoor = 0.7; //The speed that Mega Man will move at if travelling horizontally through a door
playerSpeedVertDoor = 0.9; //The speed that Mega Man will move at if travelling vertically through a door


//Variables that cannot be modified
climbTimer = 0;
canProgressDoor = false;
canStep = false;
plt = -1;

if !(cfgContinueChargeAnimWhileLocked || cfgChargeWhileLocked) && !cfgFadeOutChargedSound
	stopSFX(global.weapons[global.currentWeapon].chargedSFX);

