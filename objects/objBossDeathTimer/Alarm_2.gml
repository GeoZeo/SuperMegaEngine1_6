/// @description  Go to next room

var ID = instance_create(x, y, objFadeout);
ID.type = "room";
    
if (global.weaponID > -1 and !global.weaponID.unlocked) || (global.utilityID > -1 and !global.utilityID.unlocked) {
    ID.myRoom = rmWeaponGet;
    global.passPlayVictory = false;
}
else if !global.fortressStarted {
    ID.myRoom = rmPass;
    global.passPlayVictory = true;
}
else if global.fortressLevels[global.currentFortressLevel] == room {
    global.fortressLevelDone[global.currentFortressLevel] = true;
    global.currentFortressLevel++;
    if global.currentFortressLevel >= global.numFortressLevels {
        //Ending
        ID.myRoom = rmCredits;
    }
    else {
        ID.myRoom = rmFortress;
    }
}

global.passContinueRoom = room;



