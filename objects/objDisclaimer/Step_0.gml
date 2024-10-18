//Fading in/out
if textAlphaIncrease {
    if textAlpha < 1 {
        textAlphaTimer++;
        if textAlphaTimer >= textAlphaInterval {
            textAlphaTimer = 0;
            textAlpha += textAlphaIncreaseAmount;
        }
    }
    else {
        textAlphaTimer = 0;
    }
}
else {
    if textAlpha > 0 {
        textAlphaTimer++;
        if textAlphaTimer >= textAlphaInterval {
            textAlphaTimer = 0;
            textAlpha -= textAlphaIncreaseAmount;
        }
    }
    else {
        textAlphaTimer = 0;
        room_goto(rmOpening);
    }
}

//Proceed to the next screen ("phase")
proceedTimer++;
if ((global.keyPausePressed || global.keyJumpPressed) and (textAlpha >= 1 or skip_fade_in)) || proceedTimer >= proceedTimerMax {
    if textAlphaIncrease textAlpha = 1;
	textAlphaIncrease = false;
	if skip_fade_out && !(proceedTimer >= proceedTimerMax)
		room_goto(rmOpening);
}

