useShader = false;
if hitWhite && !drawBoss {
    shader_set(shBossHit);
    useShader = true;
}
if !hitSpark {
    drawHitSpark = false;
}

event_inherited();

if useShader {
    shader_reset();
}

