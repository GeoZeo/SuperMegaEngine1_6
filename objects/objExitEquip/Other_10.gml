/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

count = 1;

if global.weaponID > -1 and (global.weaponID.unlocked or (ds_list_find_index(global.weaponID.exceptCharacters, global.character) > -1 and ds_list_find_index(global.weaponID.exceptCharacters, global.character) < ds_list_size(global.weaponID.exceptCharacters))) {

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

