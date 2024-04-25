event_inherited();
delay = 46;
delay_frames = room_speed * delay;
alarm[1] = delay_frames;
playMusicDefault(bgmOpening);

txt = instance_create(24, 165, objText);
txt.allow_fast_forward = false;
txt.allow_jump_to_end = false;
txt.allow_manual_page_turn = false;
txt.page_delay = room_speed * 8;
txt.delay = 0;
txt.text = @"The Mega Man series has been around since 1987, bringing joy to fans in the whole world.
>Its formidable gameplay, combined with a challenging difficulty, remains unparalleled.
>But Capcom has abandoned Mega Man. It's been years since the last original game.
>The fans are eager for a new game, but there seems to be little hope that Capcom will ever listen.
>Are we doomed? Should we play Rockman Xover? Or maybe some random FPS instead?
>Never!";


