/// @description  Go to next room

var ID = instance_create(x, y, objFadeout);
ID.type = "room";

if room == cfgInitialStage
	global.initialStageClear = true;

if (global.weaponID > -1 and !(ds_list_find_index(global.weaponID.exceptCharacters, global.character) > -1 and ds_list_find_index(global.weaponID.exceptCharacters, global.character) < ds_list_size(global.weaponID.exceptCharacters)) and !global.weaponID.unlocked)
|| (global.utilityID > -1 and !(ds_list_find_index(global.utilityID.exceptCharacters, global.character) > -1 and ds_list_find_index(global.utilityID.exceptCharacters, global.character) < ds_list_size(global.utilityID.exceptCharacters)) and !global.utilityID.unlocked) {
    ID.myRoom = rmWeaponGet;
    global.passPlayVictory = true;
}
else if !global.fortressStarted {
    ID.myRoom = rmPass;
    global.passPlayVictory = false;
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



