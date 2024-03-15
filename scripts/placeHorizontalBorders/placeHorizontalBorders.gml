/// @description  Place horizontal borders where necessary
function placeHorizontalBorders() {
	for (v = 0; v < room_height; v += 16) {
	    for (i = 0; i < room_width; i += 16) {
			if !instance_position(i, v, objSectionBorderTopScreen) {
				if (instance_position(i, v, objSectionArrowUp) || instance_position(i, v, objBossDoorH)) {
					instance_create(i, v, objSectionBorderTopScreen);
				}
			}
			if !instance_position(i, v - 16, objSectionBorderBottomScreen) {
				if (instance_position(i, v - 16, objSectionArrowDown) || instance_position(i, v - 16, objBossDoorH)) {
					instance_create(i, v - 16, objSectionBorderBottomScreen);
				}
			}
	    }
	}
	//for (v = 0; v < room_height; v += __view_get( e__VW.HView, 0 )) {
	//    for (i = 0; i < room_width; i += __view_get( e__VW.WView, 0 )) {
	//		//for (var j = 0; j < room_width; j += 16) {
	//		//	if !instance_position(i, v, objSectionBorderTopScreen) {
	//		//		if (instance_position(i + j, v, objSectionArrowUp) || instance_position(i + j, v, objBossDoorH)) {
	//		//			instance_create(i, v, objSectionBorderTopScreen);
	//		//		}
	//		//	}
	//		//	if !instance_position(i, v + __view_get( e__VW.HView, 0 ) - 16, objSectionBorderBottomScreen) {
	//		//		if (instance_position(i + j, v - 16, objSectionArrowDown) || instance_position(i + j, v - 16, objBossDoorH)) {
	//		//			instance_create(i, v + __view_get( e__VW.HView, 0 ) - 16, objSectionBorderBottomScreen);
	//		//		}
	//		//	}
	//		//}
	//		//if v > 0 && v < room_height - 1 {
	//        //    for (var j = 0; j < __view_get( e__VW.WView, 0 ); j += 16) {
	//        //        if instance_position(i + j, v, objLadder) {
	//        //            instance_create(i + j, v, objSectionArrowUp);
	//        //        }
	//        //        if instance_position(i + j, v - 16, objLadder) {
	//        //            instance_create(i + j, v - 16, objSectionArrowDown);
	//        //        }
	//        //    }            
	//        //}
	//    }
	//	//for (i = 0; i < room_width; i += __view_get( e__VW.WView, 0 )) {
	//    //    //instance_create(i, v, objSectionBorderTopScreen);
	//    //    //instance_create(i, v + __view_get( e__VW.HView, 0 ) - 16, objSectionBorderBottomScreen);
	     
	//}  


}
