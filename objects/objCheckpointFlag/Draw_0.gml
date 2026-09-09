var _viewX = global.viewX + global.shakeX;
var _viewY = global.viewY + global.shakeY;

if flagTimer != 0 {
	draw_sprite_ext(sprCheckpointFlag, ((flagTimer / 20) % 1 != 0) and (flagTimer % 20) <= 10, _viewX+16, (_viewY+global.viewHeight)-16-4, 1, 1, 0, c_white, 1);
	if !instance_exists(objPauseMenu) flagTimer--;
}
else {
	instance_destroy();
}

