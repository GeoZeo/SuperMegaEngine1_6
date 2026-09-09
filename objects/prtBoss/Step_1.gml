/// @description  Starting the intro pose (and falling down)
if pose > -1 && startIntro == true {
	projCanTouch = false;
	shieldCanTouch = false;
    startIntro = false;
    isIntro = true;
    visible = true;
    y = global.viewY-((sprite_get_height(sprite_index)-sprite_get_yoffset(sprite_index)) * abs(image_yscale));
}
else if pose == -1 {
    image_speed = 0;
    isIntro = false;    
}

