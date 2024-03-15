/// @description  gamepad_button_check_pressed_all() : Returns currently pressed button (any)
function gamepad_button_check_pressed_all() {
	for ( var i = gp_face1; i < gp_axisrv; i++ ) {
	    if ( gamepad_button_check_pressed_any( i ) ) return i;
	}
	return false;



}
