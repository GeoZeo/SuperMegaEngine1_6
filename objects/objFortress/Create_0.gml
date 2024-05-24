time_to_flash1 = room_speed * 7 + 12;
flash1_duration = 12;
time_to_flash2 = room_speed + 12;
flash2_duration = 12;
time_to_tint = 1;
time_to_map = 24;
time_to_start = 60;

alarm[0] = time_to_flash1;
playMusicNoLoop(bgmFortress);

global.checkpoint = false;
global.levelStart = true;

//Code to run the first time the fortress is loaded
if !global.fortressStarted {
    global.fortressLevels[0] = rmFortressStage;
    global.fortressLevels[1] = rmBossRush;
    global.fortressLevels[2] = rmFinalStage;
    
    global.numFortressLevels = array_length_1d(global.fortressLevels);
    global.currentFortressLevel = 0;
    
    for (var i = 0; i < global.numFortressLevels; i++) {
        global.fortressLevelDone[i] = false;
    }
}

alarm[11] = 1;


global.fortressStarted = true;

