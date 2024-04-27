event_inherited();
delay = 32;
delay_frames = room_speed * delay;
alarm[2] = delay_frames;

with objText {
    instance_destroy();
}
stopAllSFX();
playMusicNoLoop(bgmOpening2);

txt2 = instance_create(24, 165, objText);
txt2.allow_fast_forward = false;
txt2.allow_jump_to_end = false;
txt2.allow_manual_page_turn = false;
txt2.page_delay = room_speed * 8;
txt2.delay = 0;
txt2.text = @"The Mega Man fandom will never let it go.
>By joining forces and with the power of open source, a new game creation tool was born.
>Now, you can make the Mega Man game of your dreams!
>Unearth those old Robot Master sketches and let's get to work!";


