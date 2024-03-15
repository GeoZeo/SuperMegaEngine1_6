event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

count = 1;

if global.weaponID > -1 and global.weaponID.unlocked {

    playSFX(sfxMenuSelect);
        
    var ID = instance_create(x, y, objFadeout);
    ID.type = "room";
    ID.myRoom = rmPass;
    global.passPlayVictory = true;
    global.passContinueRoom = room;
    
    return true;

}
else {
    playSFX(sfxError);
}

