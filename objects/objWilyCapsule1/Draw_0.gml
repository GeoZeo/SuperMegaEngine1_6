useShader = false;
if (hitWhite && !drawBoss) {
    shader_set(shBossHit);
    useShader = true;
}
if isFlash {
	shader_set(shStageSelectFlash);
    useShader = true;
}
if !hitSpark {
    drawHitSpark = false;
}

if drawBoss {
    drawSelf();
}
    
if drawHitSpark {
    draw_sprite_ext(sprHitspark, 0, sprite_get_xcenter(), sprite_get_ycenter(), 1, 1, 0, c_white, 1);
}

if useShader {
    shader_reset();
}

