if !global.frozen {
    if sprite_index == sprRush || sprite_index == sprRushCoil
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
    }
    else
    {
        yspeed = 0;
    }
    
    if sprite_index == sprRush
        image_speed = 7/60;
    
    if canCoil 
    && instance_exists(prtPlayer)
    && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top+1, prtPlayer, false, false) 
    && global.yspeed > 1 
    && !prtPlayer.climbing 
    && prtPlayer.bbox_bottom <= bbox_bottom - 8 + global.yspeed {
        global.yspeed = -7;
        prtPlayer.canMinJump = false;
        sprite_index = sprRushCoil;
        canCoil = false;
        alarm[0] = 60;
        
        global.weapons[global.currentWeapon].ammo -= global.weapons[global.currentWeapon].consumption;
        if global.weapons[global.currentWeapon].ammo <= 0
            global.weapons[global.currentWeapon].ammo = 0;
    }
    
    if collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false) && sprite_index == sprRush {
        event_perform(ev_alarm, 0);
    }
    
    y += yspeed;
}
else
{
    image_speed = 0;
    if alarm[0] != -1
        alarm[0] += 1;
}

