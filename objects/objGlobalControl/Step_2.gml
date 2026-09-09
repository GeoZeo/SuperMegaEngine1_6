//Move the camera depending on the view variables
//These variables are here to make setting and getting the view easier
camera_set_view_pos(global.view, global.viewX + global.shakeX, global.viewY + global.shakeY);

//Re-enabling buffering
if cfgEnableBuffering && !instance_exists(objSectionSwitcher)
{
	if !global.keyJump global.hasJumped = false;
	if !global.keyWeaponSwitchLeft global.hasSwitchedL = false;
	if !global.keyWeaponSwitchRight global.hasSwitchedR = false;
	
	if global.enableSlideKey
		if !global.keySlide global.hasSlid = false;
}

