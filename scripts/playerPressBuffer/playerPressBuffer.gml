/// @description playerPressBuffer()
function playerPressBuffer() {
	//Buffers key press events while keys are held to make them 
	//activate the frame the player gains/regains control
	
	if !cfgEnablePressBuffer
		return false;
		
	global.keyLeftPressed = keyboard_check(global.leftKey) || gamepad_axis_value_any(gp_axislh) < -0.2 || gamepad_button_check_any(global.leftButton);
	global.keyRightPressed = keyboard_check(global.rightKey) || gamepad_axis_value_any(gp_axislh) > 0.2 || gamepad_button_check_any(global.rightButton);
	global.keyUpPressed = keyboard_check(global.upKey) || gamepad_axis_value_any(gp_axislv) < -0.2 || gamepad_button_check_any(global.upButton);
	global.keyDownPressed = keyboard_check(global.downKey) || gamepad_axis_value_any(gp_axislv) > 0.2 || gamepad_button_check_any(global.downButton);
	global.keyJumpPressed = keyboard_check(global.jumpKey) || gamepad_button_check_any(global.jumpButton);
	global.keyShootPressed = keyboard_check(global.shootKey) || gamepad_button_check_any(global.shootButton);
	global.keyPausePressed = keyboard_check(global.pauseKey) || gamepad_button_check_any(global.pauseButton);
	global.keyWeaponSwitchLeftPressed = keyboard_check(global.weaponSwitchLeftKey) || gamepad_button_check_any(global.weaponSwitchLeftButton);
	global.keyWeaponSwitchRightPressed = keyboard_check(global.weaponSwitchRightKey) || gamepad_button_check_any(global.weaponSwitchRightButton);
	global.keySelectPressed = keyboard_check(global.selectKey) || gamepad_button_check_any(global.selectButton);
	
	if (global.enableSlideKey) {
		global.keySlide = keyboard_check(global.slideKey) || gamepad_button_check_any(global.slideButton);
	}
	

}