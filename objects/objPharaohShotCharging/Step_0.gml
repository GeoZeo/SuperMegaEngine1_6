if !global.frozen || instance_exists(objSectionSwitcher) {
    imgIndex += imgSpeed;
    
    //After fully charging, change sprites
    if sprite_index == sprPharaohShotCharging {
        if imgIndex >= image_number - imgSpeed * 3 {
			var _shot = instance_create(x, y, objPharaohShotCharged);
			_shot.image_index = 1;
			_shot.image_speed = _shot.img_speed;
			instance_destroy();
        }
    }    
    image_index = imgIndex;
}

//Destroy upon level end
if instance_exists(objBossDeathTimer) {
	with objBossDeathTimer {
		if alarm[1] > 0 || prtPlayer.locked {
			with other instance_destroy();
		}
	}
}

