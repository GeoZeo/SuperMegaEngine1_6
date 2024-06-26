if !global.frozen {
    image_speed = 1/6;
    
	if restartTimer {
		restartTimer = false;
		alarm[0] = 105 * 2;
		alarm[1] = 0;
		if (flash and !visible) visible = true;
		flash = false;
	}
	
    if flash {
        flashTimer++;
        if flashTimer >= 2 {
            visible = !visible;
            flashTimer = 0;
        }
    }
    
    if insideView() {
        checkGround();
        gravityCheckGroundExt(currentGrav);
        generalCollision();
        
        y += yspeed * update_rate;
        if ground {
            xspeed = 0;
        }
        x += xspeed * update_rate;
		
		//Water
		if checkWater
		{
			if place_meeting(x, y, objWater) && inWater == false
			{
			    inWater = true;
			
				if canSplash
				{
					playSFX(sfxSplash);
    
				    var currentWater;
				    currentWater = instance_place(x, y, objWater);
				    instance_create(x, currentWater.bbox_top+1, objSplash);
				}
			}
			
			if inWater == true
			    currentGrav = gravWater;
			else
			    currentGrav = grav;
				
			//Leaving the water
			if inWater == true
			{
			    var wtr;
			    wtr = instance_place(x, y-yspeed, objWater);
			    if wtr >= 0
			    {
			        if bbox_bottom <= wtr.bbox_top
			        {
			            if canSplash instance_create(x, wtr.bbox_top+1, objSplash);
			            inWater = false;
			            if canSplash playSFX(sfxSplash);
			        }
			    }
			}
		}
		else
		{
			inWater = false;
			currentGrav = grav;
		}
		
        if !insideView() {
            instance_destroy();
        }
    }
}
else {
    if alarm[0] != -1
        alarm[0]++;
    if alarm[1] != -1
        alarm[1]++;
    image_speed = 0;
}

