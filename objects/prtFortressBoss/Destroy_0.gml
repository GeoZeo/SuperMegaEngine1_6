if !cancelDestroyEvent {
	
	playerLockMovement(true);

	if makeShadow {
	    var shadow = instance_create(x, y, objBossShadow);
	    shadow.image_xscale = image_xscale;
	    shadow.image_yscale = image_yscale;
	    shadow.sprite_index = sprite_index;
	    shadow.image_index = image_index;
	    shadow.x = x;
	    shadow.y = y;
	    shadow.depth = depth;
	}
	
}

