/// @description  Create Paths

var drawer;

currentObj = instance_find(objFortressPointStart, 0);

for (var i = 0; i < global.numFortressLevels; i++) {
    origin = currentObj;
    x = 0;
    y = 0;
    
    drawer[i] = instance_create(currentObj.x, currentObj.y, objMapDrawer);
    do {
        deltaX = 0;
        deltaY = 0;
        do {
            switch currentObj.dir {
                case "right": deltaX = 16; break;
                case "left": deltaX = -16; break;
                case "down": deltaY = 16; break;
                case "up": deltaY = -16; break;
            }
            oldX = x;
            oldY = y;
            x += deltaX;
            y += deltaY;
            
            if origin.x + x > room_width || origin.y + y > room_height || origin.x + x < 0 || origin.y + y < 0 {
                exit;
            }
        
            var line = makeLine(oldX, oldY, x, y);
            ds_list_add(drawer[i].lines, line);
            next = instance_position(origin.x + x, origin.y + y, objFortressSpot);
        } until (next > -1);
        currentObj = next;
    } until (currentObj.object_index == objFortressPoint);

    drawer[i].place_icon = currentObj.sprite_index;
    drawer[i].hidden = currentObj.hidden;
    if i != global.currentFortressLevel {
        drawer[i].draw_speed = 0;
    }
    if global.fortressLevelDone[i] {
        drawer[i].step = ds_list_size(drawer[i].lines);
    }
}

