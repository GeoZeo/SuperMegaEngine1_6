/// @description randomDrop()
/// @param range - upper range of the item RNG, real
/// @param timer - timer to set before item disappears, real
/// @param xspeed - horizontal speed at which the item comes out when spawned, real
/// @param yspeed - vertical speed at which the item comes out when spawned, real
function randomDrop(argument0, argument1, argument2, argument3) {
	//Random drop rates (credit to Blyka)
	var _range = argument0;
	var _timer = argument1;
	var _xspeed = argument2;
	var _yspeed = argument3;

	randomize(); //Restart the RNG with a random seed
	random_set_seed(random_get_seed() + real(self));  //To avoid getting the same seed when enemies are destroyed at the same time

	var randitem;
	randitem = floor(random(_range));


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
	    nitem = instance_create(round(sprite_get_xcenter()) - 8, round(sprite_get_ycenter()) - 8, item);
	    nitem.alarm[0] = _timer;
		nitem.xspeed = _xspeed;
		nitem.yspeed = _yspeed;
		with nitem
		{
			if !place_free(x+xspeed, y+yspeed)
			{
				xspeed = 0;
				yspeed = 0;
			}
		}
	}



}