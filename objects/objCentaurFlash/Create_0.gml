if !global.frozen {
    alarm[0] = (23 / room_speed) * room_speed;
    global.frozen = true;
	with prtPlayer canPause = false;
    playSFX(sfxCentaurFlash);
}

backShader = -1
backShaderReset = -1;
frontShader = -1;
frontShaderReset = -1;

defaultDamage = 4;
defaultBossDamage = 0;
reflectible = false;
allowHitSound = false;

