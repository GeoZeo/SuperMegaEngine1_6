/// @description  Place room borders
function placeRoomBorders() {
	//Left and right
	for (v = 0; v < room_height; v += global.viewHeight) {
	    instance_create(0, v, objSectionBorderLeftScreen);
	    instance_create(room_width - 16, v, objSectionBorderRightScreen);
	}  

	//Top and bottom
	for (v = 0; v < room_width; v += global.viewWidth) {
	    instance_create(v, 0, objSectionBorderTopScreen);
	    instance_create(v, room_height - 16, objSectionBorderBottomScreen);
	}  



}
