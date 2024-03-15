/// @description Initialize switching sections


var plt = instance_place(x, y+1, prtMovingPlatformSolid);   //Moving platform below Mega Man?
if plt < 0
	plt = instance_place(x, y+1, prtMovingPlatformJumpthrough);
if plt > -1 && (!plt.keepOnSwitch || plt.object_index == objRushJet) {
    plt = -1;
}

var prevX = x;

if newSectionXOffset > 0 //Switching to the right
{
    x = sectionRight-6;
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher) dir = "right";
}
else if newSectionXOffset < 0 //Switching to the left
{
    x = sectionLeft+6;
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher) dir = "left";
}
else if newSectionYOffset > 0 //Switching down
{
    y  = sectionBottom-6 + sprite_yoffset - (sprite_height/2);
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher) dir = "down";
}
else if newSectionYOffset < 0 //Switching up
{
    y  = sectionTop+6 + sprite_yoffset - (sprite_height/2);
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher) dir = "up";
}

//If there was a moving platform below Mega Man, adjust it to remain below him
if ground == true && plt >= 0 && plt.keepOnSwitch {
    plt.y = bbox_bottom + plt.sprite_yoffset;
}
if (instance_exists(objSectionSwitcher) && plt > -1 && plt.keepOnSwitch) {
    objSectionSwitcher.plt = plt;
	
	//If there was a moving platform below Mega Man, adjust it accordingly
	//Right
	if objSectionSwitcher.dir = "right" {
		if !objSectionSwitcher.door {
			if ground == true && plt >= 0 && plt.keepOnSwitch && plt.xspeed > 0 {
				plt.x -= abs(x - prevX);
				plt.transitionSideways = true;
			}
			else {
				plt.transitionSideways = false;
			}
		}
		else {
			if ground == true && plt >= 0 && plt.keepOnSwitch && plt.xspeed > 0 {
				plt.x -= abs(x - prevX);
				plt.transitionSideways = true;
			}
			else {
				plt.transitionSideways = false;
			}
		}
	}
	//Left
	else if objSectionSwitcher.dir = "left" {
		if !objSectionSwitcher.door {
			if ground == true && plt >= 0 && plt.keepOnSwitch && plt.xspeed < 0 {
				plt.x += abs(x - prevX);
				plt.transitionSideways = true;
			}
			else {
				plt.transitionSideways = false;
			}
		}
		else {
			if ground == true && plt >= 0 && plt.keepOnSwitch && plt.xspeed < 0 {
				plt.x += abs(x - prevX);
				plt.transitionSideways = true;
			}
			else {
				plt.transitionSideways = false;
			}
		}
	}
	else {
		plt.transitionSideways = false;
	}
}


