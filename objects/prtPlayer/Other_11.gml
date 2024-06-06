/// @description Reflection
if other.reflectible {
	if !other.destroyOnReflect {
		with other {
	        var ID = instance_create(x, y, objReflectedProjectile);
			ID.id_of_origin = id_of_origin;
			ID.projID = object_index;
	        ID.sprite_index = sprite_index;
	        ID.image_index = col;
	        ID.image_speed = 0;
			
			if xspeed == 0
				ID.image_xscale = image_xscale;
			else
				ID.image_xscale = -image_xscale;
			if yspeed == 0
				ID.image_yscale = image_yscale;
			else
				ID.image_yscale = -image_yscale;
				
			ID.dir = sign(xspeed);
	        ID.xspeed = -xspeed;
			ID.yspeed = -yspeed;
			ID.contactDamage = contactDamage;
            
	        instance_destroy();
	    }
	}
	else {
		with other {
			instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
			instance_destroy();
		}
		exit;
	}
    
    playSFX(sfxReflect);
}

