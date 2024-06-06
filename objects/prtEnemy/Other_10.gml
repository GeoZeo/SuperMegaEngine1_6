if sprite_index > -1 and !dead and other.reflectible {
	if !(other.object_index == objReflectedProjectile && other.id_of_origin != prtPlayer) {
	    with other {
	        var ID = instance_create(x, y, objReflectedProjectile);
			ID.id_of_origin = prtPlayer;
	        ID.sprite_index = sprite_index;
	        ID.image_index = 0;//image_index;
	        ID.image_speed = 0;//image_speed;
	        ID.image_xscale = image_xscale;
	        ID.dir = sign(xspeed);
            
	        instance_destroy();
	    }
	}
	else {
		with other {
			xspeed = -xspeed;
			yspeed = -yspeed;
			
			if xspeed != 0
				image_xscale = -image_xscale;
			if yspeed != 0
				image_yscale = -image_yscale;
		}
	}
    
    playSFX(sfxReflect);
}

