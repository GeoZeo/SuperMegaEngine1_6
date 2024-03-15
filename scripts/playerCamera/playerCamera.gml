/// @description playerCamera()
function playerCamera() {
	//Handles the camera
	//Call it in prtPlayer

	xOffset = objGlobalControl.cameraXOffset;
	yOffset = objGlobalControl.cameraYOffset;

	//Follow the player
	__view_set( e__VW.XView, 0, round((x + xOffset) - __view_get( e__VW.WView, 0 ) / 2) );
	__view_set( e__VW.YView, 0, round((y + yOffset) - __view_get( e__VW.HView, 0 ) / 2) );

	//Stop at section borders
	if __view_get( e__VW.XView, 0 ) > sectionRight-__view_get( e__VW.WView, 0 )
	    __view_set( e__VW.XView, 0, sectionRight-__view_get( e__VW.WView, 0 ) );
	else if __view_get( e__VW.XView, 0 ) < sectionLeft
	    __view_set( e__VW.XView, 0, sectionLeft );
    
	if __view_get( e__VW.YView, 0 ) > sectionBottom-__view_get( e__VW.HView, 0 )
	    __view_set( e__VW.YView, 0, sectionBottom-__view_get( e__VW.HView, 0 ) );
	else if __view_get( e__VW.YView, 0 ) < sectionTop
	    __view_set( e__VW.YView, 0, sectionTop );
    
    
	//Stop at room borders
	if __view_get( e__VW.XView, 0 ) > room_width-__view_get( e__VW.WView, 0 )
	    __view_set( e__VW.XView, 0, room_width-__view_get( e__VW.WView, 0 ) );
	else if __view_get( e__VW.XView, 0 ) < 0
	    __view_set( e__VW.XView, 0, 0 );
    
	if __view_get( e__VW.YView, 0 ) > room_height-__view_get( e__VW.HView, 0 )
	    __view_set( e__VW.YView, 0, room_height-__view_get( e__VW.HView, 0 ) );
	else if __view_get( e__VW.YView, 0 ) < 0
	    __view_set( e__VW.YView, 0, 0 );



}
