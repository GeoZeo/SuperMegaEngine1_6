//Place this object at the topleft corner of the screen your boss is in!
//This handles the boss health bar, as well as locking the player and boss movement at the start

//Creation code:
//music = "Music\Boss.ogg" (just the file name of the music you're using for the boss)
//musicVolume = 0-1 (the volume of the music; optional)
//musicLoopPointStart = 0-1 (the starting loop point of the music; optional)
//musicLoopPointEnd = 0-1 (the ending of the loop of the music; if musicLoopPointStart is used, this one is required)
//healthBarPrimaryCol = [col] (the color of the left/right of the boss's health bar)
//healthBarSecondaryCol = [col] (the color of the middle of the boss's health bar)
//bossTime = 0-[time (in frames)] (the amount of time by which to delay the boss spawn)
//timerWarp = true/false (whether we spawn a health pickup that warps the player out of a boss rush arena, or we set a timer for the warp (only applicable if there is no teleporter already in room))
    
healthBarPrimaryCol = make_color_rgb(255, 160, 68); //Orange
    
healthBarSecondaryCol = c_white;
    
drawHealthBar = false;
canFillHealthBar = true;
fillingHealthBar = false;
healthBarTimer = 0;
healthBarTimerMax = 100;

bossTime = 0;
bossTimer = 0;

canInitDeactivation = true;

//Will defeating the boss end the level if we aren't in a boss rush room?
endLevel = true;

timerWarp = false;

//For warping the player elsewhere at the end of the fight if necessary
toX = -1;
toY = -1;
returnBGM = -1;

//Do we spawn an item in the teleporter room if we're doing a timer warp? If so, where?
spawnItem = true;
itemX = 0;
itemY = 0;

myBoss = -1;
bossID = -1;
bossPersistent = false;

global.bossHealth = 0;


musicVolume = -1;
musicLoopPointStart = -1;
musicLoopPointEnd = -1;

music = bgmBoss;
musicVolume = 0.7;

