if dir <= 0 || (dir > 0 and bbox_right >= sprite_get_bbox_left(other.sprite_index) + 1)
{
	event_inherited();

	//event_user(14);
	event_user(2);
}

