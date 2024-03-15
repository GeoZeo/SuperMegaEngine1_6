event_inherited();

if global.screws < global.maxScrews {
    
    global.screws += amount;
    
    if global.screws > global.maxScrews {
        global.screws = global.maxScrews;
    }
    
    playSFX(sfxBoltCollect);
}

