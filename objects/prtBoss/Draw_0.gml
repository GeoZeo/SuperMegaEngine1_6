event_inherited();

if drawBoss {
    drawSelf();
}
    
if drawHitSpark {
    draw_sprite_ext(sprHitspark, 0, sprite_get_xcenter(), sprite_get_ycenter(), 1, 1, 0, c_white, 1);
}

