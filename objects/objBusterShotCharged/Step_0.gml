event_inherited();

if !global.frozen && cfgShotSplash {
    waterBelow = instance_position(x - sprite_xoffset, y + sprite_height, objWater);
    if waterBelow > -1 && waterBelow.bbox_top > y {
		with waterBelow {
			if !(collision_rectangle(other.x-16, bbox_top-1, other.x, bbox_top, objWater, false, false)
			|| collision_rectangle(other.x-16, bbox_top-1, other.x, bbox_top, objSolid, false, false)) {
				instance_create(other.x - other.sprite_xoffset, y, objSplash);
				playSFX(sfxSplash);
			}
		}
    }
	
	waterAbove = instance_position(x - sprite_xoffset, y - sprite_height, objWater);
	if waterAbove > -1 && waterAbove.bbox_bottom < y {
		with waterAbove {
			if !(collision_rectangle(other.x-16, bbox_bottom, other.x, bbox_bottom+1, objWater, false, false)
			|| collision_rectangle(other.x-16, bbox_bottom, other.x, bbox_bottom+1, objSolid, false, false)) {
				var splash = instance_create(other.x - other.sprite_xoffset, y + sprite_height, objSplash);
				splash.image_yscale = -1;
		        playSFX(sfxSplash);
			}
		}
    }
}

