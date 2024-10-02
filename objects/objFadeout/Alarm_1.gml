if room == rmSaveGame {
	with objSaveGame {
		setPlayer(currentChar);
	}
}

if type == "restart" {
    room_restart();
}
else if type == "room" {
    room_goto(myRoom);
}
global.weapon = global.defaultWeapon.newID;

