useShader = false;
var _shaded = false;
if hitWhite && alarm[11] > -1 && healthpoints > 0 {
    shader_set(shBossHit);
    useShader = true;
	_shaded = true;
}

event_inherited();

if useShader || _shaded {
    shader_reset();
}

