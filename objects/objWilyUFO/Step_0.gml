if !(instance_exists(objFadeIn)) {

	switch state {
	    case states.MOVING:
			image_speed = 0.2;
	        if point_distance(x, y, room_width / 2, y) > 1 {
	            hspeed = 1;
	        }
	        else {
	            hspeed = 0;
	            state = states.OPENING;
	            image_index = 3;
	            stopSFX(sfxWilyUFO);
	        }    
	        if image_index > 2 {
	            image_index = 0;
	        }
	    break;
	    case states.OPENING:
	        if image_index > 6 {
	            state = states.EYEBROWS;
	        }
	    break;
	    case states.EYEBROWS:
	        image_speed = 0.1;
	        if image_index < 6 {
	            image_index = 6;
	            eyebrows_count++;
	            if eyebrows_count > 4 {
	                state = states.CLOSING;
	            }
	        }
	    break;
	    case states.CLOSING:
	        image_speed = -0.2;
	        if image_index < 2 {
	            state = states.BEGIN_LEAVING;
	            timer = 0;
				image_speed = 0.2;
	        }
	    break;
	    case states.BEGIN_LEAVING:
			if image_xscale == 1 
				image_speed = 0.2;
			else
				image_speed = 0;
				
			if image_index > 2 {
	            image_index = 0;
	        }
			
	        timer++;
	        if timer % 4 == 0 {
				image_index = 0;
	            image_xscale += 0.4;
	            image_yscale += 0.4;
	        }
	        if image_xscale >= 1.5 {
	            state = states.LEAVING;
				timer = 0;
				timer2 = 0;
	        }
	    break;
	    case states.LEAVING:
			timer++;
			if timer >= 8 {
				timer2++;
				if timer2 % 4 == 0 {
					image_xscale -= 0.2;
					image_yscale -= 0.2;
				} 
		        if image_xscale < 0.2 {
		            state = states.END;
		            visible = false;
		            var ID = instance_create(0, 0, objFadeout);
		            ID.type = "room";
		            ID.myRoom = rmFortress;              
		        }
			}
	    break;             
	}
}
else {
	hspeed = 0;
	image_speed = 0;
}

