event_inherited();

if !global.frozen && cfgShotSplash {
    waterBelow = instance_position(x - sprite_xoffset, y + sprite_height, objWater);
    if waterBelow > -1 {
        instance_create(x - sprite_xoffset, waterBelow.y, objSplash);
        playSFX(sfxSplash);
    }    
}

