with other {
    if (!reflectProjectiles
    && !(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter() && other.xspeed > 0)
    && !(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter() && other.xspeed < 0))
    or !other.reflectible {

        if canHit {  
            playerGetHit(other.contactDamage);
        }
    }
    else {
        event_user(1);  //Reflection
    }
}

