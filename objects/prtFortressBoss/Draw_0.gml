useShader = false;
if hitWhite && alarm[9] > 1 {
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

