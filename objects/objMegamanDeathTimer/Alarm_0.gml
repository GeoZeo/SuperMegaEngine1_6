global._lives -= 1;

var ID = instance_create(x, y, objFadeout);

global.lastRoom = room;

if global._lives >= 0 {
    ID.type = "restart";
    global.levelStart = false;
}
else {
    ID.type = "room";
    ID.myRoom = rmPass;
    global.passPlayVictory = false;
    global.passContinueRoom = room;
}
    
instance_destroy();

