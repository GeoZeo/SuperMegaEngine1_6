switch dir {
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
				
if !checkLine(drawerRef.lines, oldX, oldY, x, y) {
	var line = makeLine(oldX, oldY, x, y, fortressObj.currentKey); //[0] - starting x, [1] - starting y, [2] - ending x. [3] - ending y
	ds_list_add(drawerRef.lines, line);
}
next = instance_position(origin.x + x, origin.y + y, objFortressSpot);
if next > -1 && origin.x + x == next.x && origin.y + y == next.y {
	reachedSpot = true;
}

