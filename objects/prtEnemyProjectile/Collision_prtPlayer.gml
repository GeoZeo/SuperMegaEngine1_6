with other {
    if ((!reflectProjectiles or other.pierceReflectors)
    && (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter() && other.xspeed > 0) or other.pierceReflectors)
    && (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter() && other.xspeed < 0) or other.pierceReflectors))
    or !other.reflectible {

        if canHit && other.playerCanTouch {  
            playerGetHit(other.contactDamage, false);
        }
    }
    else {
        event_user(1);  //Reflection
    }
}

