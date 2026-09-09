event_inherited();
delay = 46;
delay_frames = room_speed * delay;
alarm[1] = delay_frames;
canPlayMusic = true;

txt = instance_create(24, 165, objText);
txt.allow_fast_forward = false;
txt.allow_jump_to_end = false;
txt.allow_manual_page_turn = false;
txt.page_delay = room_speed * 8;
txt.delay_normal = 0;
//txt.arrow_delay = 30;
txt.text = @"The Mega Man series has been around since 1987, bringing joy to fans all over the world.
>Its formidable gameplay formula, combined with challenging level design, remains unparalleled.
>But Capcom has abandoned Mega Man. It's been years since the last original game.
>The fans are eager for a new game, but there seems to be little hope that Capcom will ever listen.
>Are we doomed? Should we play Rockman Xover? Or maybe some random FPS instead?
>Never!";
//txt.text = @"The Mega Man series has been around since 1987, bringing joy to fans all over the world.
//>Its formidable gameplay formula, combined with challenging level design, remains unparalleled.
//>However, the series has been dormant as of late. It's been years since the last original game.
//>The fans are eager for a new game, but it seems as though Mega Man 11 was but a fleeting miracle.
//>Are we doomed? Are we to move on and play something else, or worse, go outside and touch some grass?
//>Never!!";
//txt.nameList = @"Narrator>Narrator>Narrator>Narrator>Mega Man>Narrator";


