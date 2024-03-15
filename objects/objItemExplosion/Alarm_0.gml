instance_destroy();

//Random drop rates (credit to Blyka)

randomize(); //Restart the RNG with a random seed
random_set_seed(random_get_seed() + real(self));  //To avoid getting the same seed when enemies are destroyed at the same time

var randitem;
randitem = floor(random(400));


var nitem, item = -1;

if (randitem < 4) 
{
    item = objLife;
}
else if (randitem < 45) 
{
    item = choose(objLifeEnergyBig, objWeaponEnergyBig);
}
else if (randitem < 100) 
{
    item = choose(objLifeEnergySmall, objWeaponEnergySmall);
}
else if (global.enableScrews && randitem < 155) 
{
    item = objScrewSmall;
}

if item >= 0 {
    nitem = instance_create(x - 8, y - 8, item);
    nitem.alarm[0] = 105 * 2;
	//nitem.yspeed = -2.125; - For if you want the item to "jump" out of the enemy like in MM2. For extra accuracy to MM2 specifically, move random drop code to the Create event, before the alarm line.
}

