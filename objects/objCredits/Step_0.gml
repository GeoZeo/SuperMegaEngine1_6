if y < scroll_threshold {
    vspeed = 0;
    if global.keyPausePressed {
        stopAllSFX();
        game_restart();
    }

    if megamanx < 230 {
        megamanx++;
        megamany -= 0.45;
    }
    else {
        megamansprite = global.spriteJump;
    }
    rushx++;
    rushy -= 0.45;
}
else if global.keyJump || global.keyShoot || global.keyPause {
    vspeed = -1;
}
else {
    vspeed = -0.2;
}

