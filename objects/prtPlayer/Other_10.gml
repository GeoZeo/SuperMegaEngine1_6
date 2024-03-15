/// @description  Change colors depending on the special weapon
//Primary is the helmet color (dark blue), secondary is the shirt color (cyan)
global.primaryCol = weapons[global.weapon].primaryCol;
global.secondaryCol = weapons[global.weapon].secondaryCol;

global.outlineCol = c_black;

if canStep {  //global.keyPausePressed was unknown at the first frame because of event order
    if !global.keyPausePressed {  //The pause menu also resets the colors as to not show charging colors in the Mega Man sprite at the bottom right
                                        //However, we do not want to reset the charge after pausing
        chargeTimer = 0;
        initChargeTimer = 0;
    }
}

