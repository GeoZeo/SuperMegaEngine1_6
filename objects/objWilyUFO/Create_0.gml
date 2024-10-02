enum states {MOVING, OPENING, EYEBROWS, CLOSING, BEGIN_LEAVING, LEAVING, END};
state = states.MOVING;
image_speed = 0.2;
eyebrows_count = 0;
playNoMusic();
loopSFX(sfxWilyUFO);
var fadein = instance_create(0,0, objFadeIn);
fadein.deactivate = false;

