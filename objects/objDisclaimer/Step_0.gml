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
if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed || proceedTimer >= proceedTimerMax {
    textAlphaIncrease = false;
}

