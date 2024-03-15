/// @description  Place room borders
function placeRoomBorders() {
	//Left and right
	for (v = 0; v < room_height; v += __view_get( e__VW.HView, 0 )) {
	    instance_create(0, v, objSectionBorderLeftScreen);
	    instance_create(room_width - 16, v, objSectionBorderRightScreen);
	}  

	//Top and bottom
	for (v = 0; v < room_width; v += __view_get( e__VW.WView, 0 )) {
	    instance_create(v, 0, objSectionBorderTopScreen);
	    instance_create(v, room_height - 16, objSectionBorderBottomScreen);
	}  



}
