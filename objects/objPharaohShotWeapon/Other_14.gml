/// @description  onReleaseCharge
event_inherited();

var _chargeShotsDeflected = 0;
with objDeflectedProjectile
{
	if id_of_origin == prtPlayer 
	&& sprite_get_name(sprite_index) == "sprPharaohShotCharged"
		_chargeShotsDeflected++;
}

if instance_exists(objPharaohShotCharging) {
    if (prtPlayer.canMove || prtPlayer.climbing || prtPlayer.locked) {
		if !instance_exists(objSectionSwitcher) && (!prtPlayer.locked or room == rmWeaponGet) {
	        initChargeTimer = 0;
	        chargeTimer = 0;
			event_user(1);
		}
        if (!instance_exists(objSectionSwitcher) and !prtPlayer.locked) || cfgChargeWhileLocked || room == rmWeaponGet
			with objPharaohShotCharging instance_destroy();
    }

}
else if instance_number(objPharaohShotCharged) == 1 && _chargeShotsDeflected <= 0 && !objPharaohShotCharged.thrown {
	if (prtPlayer.canMove || prtPlayer.climbing || prtPlayer.locked) {
		if !instance_exists(objSectionSwitcher) && (!prtPlayer.locked or room == rmWeaponGet) {
			
			initChargeTimer = 0;
	        chargeTimer = 0;
			
			with objPharaohShotCharged {
				
				x = other.box + prtPlayer.image_xscale * 10;
				y = other.yy;
				new_x = x;
				new_y = y;
				
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
                
	        playSFX(sfxPharaohShotCharged);
	        prtPlayer.isThrow = true;
	        prtPlayer.shootTimer = 0;
			
			ammo -= chargeConsumption;
		    if ammo <= 0
		        ammo = 0;
		}
		else if (instance_exists(objSectionSwitcher) or prtPlayer.locked) && cfgChargeWhileLocked && room != rmWeaponGet {
			initChargeTimer = 0;
	        chargeTimer = 0;
			with objPharaohShotCharged instance_destroy();
		}
	}
}
else {
    initChargeTimer = 0;
    chargeTimer = 0;
	
	if _chargeShotsDeflected > 0
		with objPharaohShotCharged instance_destroy();
}

