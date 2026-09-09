if !global.frozen
{	
	if !isMM
	{
		if insideView_Spr() && !instance_exists(objSectionSwitcher) && prtPlayer.sprite_index != prtPlayer.spriteTeleport && instance_exists(prtPlayer)
		{
			with prtPlayer playerCheckGround();
			
			x = prtPlayer.x;
			y = prtPlayer.y;
			depth = prtPlayer.depth;
			sprite_index = prtPlayer.sprite_index;
			image_index = prtPlayer.image_index;
			image_speed = prtPlayer.image_speed;
			image_xscale = prtPlayer.image_xscale;
			if !(sprite_index == asset_get_index("spr" + global.sprName + "Stand") || (asset_get_index("spr" + global.sprName + "StandBlink") != -1 and sprite_index == asset_get_index("spr" + global.sprName + "StandBlink")))
			{
				prtPlayer.blinkTimer = 0;
				prtPlayer.blinkImage = 0;
			}
			
			global.yspeed = 0;
			yspeed = 0;
			inWater = prtPlayer.inWater;
			prtPlayer.inWater = false;
			isFly = prtPlayer.isFly;
			flying = prtPlayer.flying;
			isRollback = prtPlayer.isRollback;
			rollbackMovement = prtPlayer.rollbackMovement;
			prtPlayer.isFly = false;
			prtPlayer.flying = false;
			prtPlayer.isRollback = false;
			prtPlayer.rollbackMovement = false;
			bubbleTimer = prtPlayer.bubbleTimer;
			currentGrav = prtPlayer.currentGrav;
			ground = prtPlayer.ground;
			prevGround = ground;
			stepTimer = prtPlayer.stepTimer;
			isMM = true;
			playerLockMovement();
			with objPauseMenu instance_destroy();
			stopSFX(sfxPause);
			with prtPlayer visible = false;
			visible = true;
		}
	}
}

