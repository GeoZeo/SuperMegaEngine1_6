event_inherited();

if !global.frozen {
    radius = 0;
    activating = true;
    global.frozen = true;
    playSFX(sfxCentaurFlash);
}

destroyOnSwitch = false;
destroyOnPause = false;
destroyOnScroll = false;
doesNotCount = true;
defaultDamage = 1;  //While Time Slow doesn't inflict damage, only
defaultBossDamage = 0;  //vulnerable (damage > 0) bosses are affected
reflectible = false;

