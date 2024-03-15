/// @description Reflection
if other.reflectible {
    with other {
        var ID = instance_create(x, y, objReflectedProjectile);
        ID.sprite_index = sprite_index;
        ID.image_index = 0;
        ID.image_speed = 0;
        ID.image_xscale = image_xscale;
        ID.dir = sign(xspeed);
            
        instance_destroy();
    }
    
    playSFX(sfxReflect);
}

