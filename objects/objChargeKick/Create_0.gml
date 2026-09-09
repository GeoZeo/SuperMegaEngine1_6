event_inherited();

img_speed = 20 / room_speed;
img_index = 0;

new_x = x;
new_y = y;

passThrough = true;
unstoppable = true;
reflectible = false;
singleHit = true;
deleteFromIgnore = true;
destroyOnScroll = false;
destroyOnPause = false;
destroyOnSwitch = false;
pierceReflectors = true;

switch(global.character)
{
	case objProtoman:
		box_xoffset = 4;
		box_yoffset = 0;
		draw_xoffset = 4;
		draw_yoffset = 3;
	break;
	
	default:
		box_xoffset = 0;
		box_yoffset = 0;
		draw_xoffset = 0;
		draw_yoffset = 1;
	break;
}

