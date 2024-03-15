blackAlphaTimer += 1;

if blackAlphaTimer >= blackAlphaTimerMax {
    blackAlpha -= blackAlphaDecrease;
    blackAlphaTimer = 0;

    if (blackAlpha <= 0 || blackAlpha >= 1) && canAlarm {
        if !reverse {
            alarm[1] = 4;
            canAlarm = false;
        }
        else {
            blackAlphaDecrease *= -1;
            reverse = false;
        }
    }
}

