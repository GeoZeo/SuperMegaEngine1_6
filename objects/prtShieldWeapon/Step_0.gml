event_inherited();

if !global.frozen {
        
    //Sticking to the player until fired or destroyed in any way
    if followPlayer {
        if instance_exists(prtPlayer) {
            x = sprite_get_xcenter_object(prtPlayer);
            y = sprite_get_ycenter_object(prtPlayer);
        }
        else {
            instance_destroy();
        }
    }
    
}

