with other instance_destroy();
instance_destroy();

if other.xspeed == 0 //When it is not yet fired
{
    global.weapons[global.currentWeapon].ammo -= global.weapons[global.currentWeapon].consumptionContact;
    if global.weapons[global.currentWeapon].ammo <= 0
        global.weapons[global.currentWeapon].ammo = 0;
}

