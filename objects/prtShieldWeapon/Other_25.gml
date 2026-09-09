/// @description  Event: onDestroy - called when the projectile is destroyed
// To be defined in child objects if necessary
event_inherited();

if xspeed == 0 //When it is not yet fired
{
	global.weapons[global.currentWeapon].ammo -= global.weapons[global.currentWeapon].consumptionContact;
	if global.weapons[global.currentWeapon].ammo <= 0
		global.weapons[global.currentWeapon].ammo = 0;
}

