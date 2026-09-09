/// @description Change the gravity

if canChange
{
	if changeGrav
	{
		global.grav = myGrav;
		with all
		{
			if variable_instance_exists(id, "grav") && variable_instance_exists(id, "currentGrav")
			{
				var _grav = grav;
				grav = global.grav;
				if currentGrav == _grav
				{
					currentGrav = grav;
				}
			}
		}
	}
	
	if changeGravWater
	{
		global.gravWater = myGravWater;
		with all
		{
			if variable_instance_exists(id, "gravWater") && variable_instance_exists(id, "currentGrav")
			{
				var _gravWater = gravWater;
				gravWater = global.gravWater;
				if currentGrav == _gravWater
				{
					currentGrav = gravWater;
				}
			}
		}
	}
			
	canChange = false;
			
	if destroyOnActivation
		instance_destroy();
}


