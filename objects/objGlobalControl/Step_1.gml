/// @description Keys
global.keyLeft = keyboard_check(global.leftKey) || gamepad_axis_value_any(gp_axislh) < -0.2 || gamepad_button_check_any(global.leftButton);
global.keyRight = keyboard_check(global.rightKey) || gamepad_axis_value_any(gp_axislh) > 0.2 || gamepad_button_check_any(global.rightButton);
global.keyUp = keyboard_check(global.upKey) || gamepad_axis_value_any(gp_axislv) < -0.2 || gamepad_button_check_any(global.upButton);
global.keyDown = keyboard_check(global.downKey) || gamepad_axis_value_any(gp_axislv) > 0.2 || gamepad_button_check_any(global.downButton);
global.keyJump = keyboard_check(global.jumpKey) || gamepad_button_check_any(global.jumpButton);
global.keyShoot = keyboard_check(global.shootKey) || gamepad_button_check_any(global.shootButton);
global.keyPause = keyboard_check(global.pauseKey) || gamepad_button_check_any(global.pauseButton);
global.keyWeaponSwitchLeft = keyboard_check(global.weaponSwitchLeftKey) || gamepad_button_check_any(global.weaponSwitchLeftButton);
global.keyWeaponSwitchRight = keyboard_check(global.weaponSwitchRightKey) || gamepad_button_check_any(global.weaponSwitchRightButton);
global.keySelect = keyboard_check(global.selectKey) || gamepad_button_check_any(global.selectButton);

global.keyLeftPressed = keyboard_check_pressed(global.leftKey) || gamepad_button_check_pressed_any(global.leftButton);
global.keyRightPressed = keyboard_check_pressed(global.rightKey) || gamepad_button_check_pressed_any(global.rightButton);
global.keyUpPressed = keyboard_check_pressed(global.upKey) || gamepad_button_check_pressed_any(global.upButton);
global.keyDownPressed = keyboard_check_pressed(global.downKey) || gamepad_button_check_pressed_any(global.downButton);
global.keyJumpPressed = keyboard_check_pressed(global.jumpKey) || gamepad_button_check_pressed_any(global.jumpButton);
global.keyShootPressed = keyboard_check_pressed(global.shootKey) || gamepad_button_check_pressed_any(global.shootButton);
global.keyPausePressed = keyboard_check_pressed(global.pauseKey) || gamepad_button_check_pressed_any(global.pauseButton);
global.keyWeaponSwitchLeftPressed = keyboard_check_pressed(global.weaponSwitchLeftKey) || gamepad_button_check_pressed_any(global.weaponSwitchLeftButton);
global.keyWeaponSwitchRightPressed = keyboard_check_pressed(global.weaponSwitchRightKey) || gamepad_button_check_pressed_any(global.weaponSwitchRightButton);
global.keySelectPressed = keyboard_check_pressed(global.selectKey) || gamepad_button_check_pressed_any(global.selectButton);

global.keyLeftReleased = keyboard_check_released(global.leftKey) || gamepad_button_check_released_any(global.leftButton);
global.keyRightReleased = keyboard_check_released(global.rightKey || gamepad_button_check_released_any(global.rightButton));
global.keyUpReleased = keyboard_check_released(global.upKey) || gamepad_button_check_released_any(global.upButton);
global.keyDownReleased = keyboard_check_released(global.downKey) || gamepad_button_check_released_any(global.downButton);
global.keyJumpReleased = keyboard_check_released(global.jumpKey) || gamepad_button_check_released_any(global.jumpButton);
global.keyShootReleased = keyboard_check_released(global.shootKey) || gamepad_button_check_released_any(global.shootButton);
global.keyPauseReleased = keyboard_check_released(global.pauseKey) || gamepad_button_check_released_any(global.pauseButton);
global.keyWeaponSwitchLeftReleased = keyboard_check_released(global.weaponSwitchLeftKey) || gamepad_button_check_released_any(global.weaponSwitchLeftButton);
global.keyWeaponSwitchRightReleased = keyboard_check_released(global.weaponSwitchRightKey) || gamepad_button_check_released_any(global.weaponSwitchRightButton);
global.keySelectReleased = keyboard_check_released(global.selectKey) || gamepad_button_check_released_any(global.selectButton);

// If the slide key is enabled.
if (global.enableSlideKey) {
    global.keySlide = keyboard_check(global.slideKey) || gamepad_button_check_any(global.slideButton);
    global.keySlidePressed = keyboard_check_pressed(global.slideKey) || gamepad_button_check_pressed_any(global.slideButton);
    global.keySlideReleased = keyboard_check_released(global.slideKey) || gamepad_button_check_released_any(global.slideButton);
}

