if type == "restart" {
    room_restart();
}
else if type == "room" {
    room_goto(myRoom);
}
global.weapon = global.defaultWeapon.newID;

