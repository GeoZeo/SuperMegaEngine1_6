/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

with objEddie {
    if insideView() {
        playSFX(sfxError);
        other.count++;
		other.cancelQuit = true;
        return false;
    }
}

if instance_exists(prtPlayer) {
    show_debug_message("Calling Eddie.");
    var eddie = instance_create(prtPlayer.x + prtPlayer.image_xscale * 32, global.viewY, objEddie);
    eddie.called = true;
    playSFX(sfxMenuSelect);
    
    return true;
}
else {
    playSFX(sfxError);
    count++;
	cancelQuit = true;
    return false;
}

