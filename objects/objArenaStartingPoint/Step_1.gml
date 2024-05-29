if !global.frozen
{	
	if !isMM
	{
		if insideView_Spr() && !instance_exists(objSectionSwitcher) && prtPlayer.sprite_index != prtPlayer.spriteTeleport && instance_exists(prtPlayer)
		{
			x = prtPlayer.x;
			y = prtPlayer.y;
			sprite_index = prtPlayer.sprite_index;
			image_index = prtPlayer.image_index;
			image_speed = prtPlayer.image_speed;
			image_xscale = prtPlayer.image_xscale;
			global.yspeed = 0;
			yspeed = 0;
			currentGrav = prtPlayer.currentGrav;
			ground = prtPlayer.ground;
			prevGround = ground;
			stepTimer = prtPlayer.stepTimer;
			isMM = true;
			playerLockMovement();
			with prtPlayer visible = false;
			visible = true;
		}
	}
}

