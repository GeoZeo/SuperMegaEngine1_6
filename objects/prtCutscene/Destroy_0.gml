var fadeout = instance_create(0,0, objFadeIn);
with fadeout {
    deactivate = false;
    blackAlpha = 0;
    blackAlphaDecrease = -0.2;
}

stopAllSFX();

show_debug_message("Cutscene ended.");

