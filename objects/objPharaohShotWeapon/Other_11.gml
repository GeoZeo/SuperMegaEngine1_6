/// @description  onShoot
event_inherited();
if !ok return false;    //This line must be on every weapon

var _chargeShotsReflected = 0;
with objReflectedProjectile
{
	if id_of_origin == prtPlayer 
	&& sprite_get_name(sprite_index) == "sprPharaohShotCharged"
		_chargeShotsReflected++;
}

if !instance_exists(objPharaohShotCharged)
|| objPharaohShotCharged.thrown { //Small shot
	attackID = instance_create(box + prtPlayer.image_xscale * 4, yy, objPharaohShot);
    
	if global.keyUp && !global.keyDown
	    attackID.yspeed = -4.5;
	else if global.keyDown && !global.keyUp
	    attackID.yspeed = 4.5;
	else
	    attackID.yspeed = 0;
}
else if _chargeShotsReflected <= 0 {  //Big shot
	stopSFX(sfxPharaohShot);
	
	with objPharaohShotCharged {
				
		x = other.box + prtPlayer.image_xscale * 10;
		y = other.yy;
				
		dir = sign(prtPlayer.image_xscale);
		image_xscale = dir;
				
		xspeed = 4.5 * dir;
		if global.keyUp && !global.keyDown
			yspeed = -4.5;
		else if global.keyDown && !global.keyUp
			yspeed = 4.5;
		else
			yspeed = 0;
				
		thrown = true;
				
		reflectible = true;
		destroyOnScroll = true;
	}
                
    ammo = old_ammo;
	ammo -= chargeConsumption;
    if ammo <= 0
        ammo = 0;
	playSFX(sfxPharaohShotCharged);
}
else {
	with objPharaohShotCharged instance_destroy();
	
	ammo = old_ammo;
    if ammo <= 0
        ammo = 0;
}

with objPharaohShotCharging instance_destroy();

