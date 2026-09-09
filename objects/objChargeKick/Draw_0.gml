if sprite_index > -1 and visible and instance_exists(prtPlayer) {
	drawSpriteColorSwapExt2 (
		sprChargeKick,
		img_index, (round(prtPlayer.x) + prtPlayer.image_xscale * 5) + (draw_xoffset * prtPlayer.image_xscale),
		(round(prtPlayer.y) + round(prtPlayer.sprite_height / 2)) + draw_yoffset,
		image_xscale,
		image_yscale,
		image_angle,
		make_color_rgb(252, 116, 96),
		make_color_rgb(252, 252, 252),
		global.primaryCol,
		global.secondaryCol,
		image_alpha
	);
}

if cfgDebug || debug_mode { 
//Draw bounding box
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
}

