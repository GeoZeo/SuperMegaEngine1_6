//Set position to above the player's head
if !thrown {
	if instance_exists(prtPlayer) {
	    x = prtPlayer.x + prtPlayer.image_xscale;
	    y = prtPlayer.y - 20;
		
		dir = sign(prtPlayer.image_xscale);
		image_xscale = dir;
	}
	else {
	    instance_destroy();
	}
	
	if instance_exists(objSectionSwitcher) && (cfgChargeWhileLocked or cfgContinueChargeAnimWhileLocked) {
		image_speed = img_speed;
	}
}

