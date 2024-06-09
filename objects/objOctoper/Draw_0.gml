useShader = false;
if hitWhite && alarm[11] > -1 && healthpoints > 0 {
    shader_set(shBossHit);
    useShader = true;
}

event_inherited();

if useShader {
    shader_reset();
}

