event_inherited();

if global.screws < global.maxScrews {
    
    global.screws += itemAmount;
    
    if global.screws > global.maxScrews {
        global.screws = global.maxScrews;
    }
    
    playSFX(sfxBoltCollect);
}

