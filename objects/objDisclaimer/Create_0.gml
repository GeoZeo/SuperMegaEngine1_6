//textAlpha = 0;
//textAlphaTimer = 0;
//textAlphaIncrease = true;
//textAlphaIncreaseAmount = 0.2;
//textAlphaInterval = 3;
proceedTimer = 0;
proceedTimerMax = 420;
can_skip = true;
skip_fade_in = true;
skip_fade_out = true;
fade_out_skip = true;

fadingOut = false;
skipNext = false;

drawBuildNum = true;

disclaimerText =
@"MEGA MAN AND ALL
RELATED CONTENT
(C) CAPCOM 2017##
SUPER MEGA ENGINE (FORMERLY OPEN MEGA ENGINE) IS A FORK OF
MEGA ENGINE 1.3 BY WRECKINGPROGRAMS.";
//>WARNING:

//THIS GAME CONTAINS FLASHING LIGHTS AND LOUD AUDIO.

//IF YOU SUFFER FROM PHOTOSENSITIVE EPILEPSY AND/OR SENSITIVE HEARING,
//PLEASE CONSULT YOUR DOCTOR AND/OR ANOTHER MEDICAL EXPERT BEFORE PLAYING.

//THANK YOU FOR YOUR UNDERSTANDING.";

phrases = split(disclaimerText, ">");
phrase = ds_queue_dequeue(phrases);

stopAllSFX();

