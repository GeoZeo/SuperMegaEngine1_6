if !checkPlayerSpriteCenter
{
	player_x = prtPlayer.x;
	player_y = prtPlayer.x;
}
else
{
	player_x = sprite_get_xcenter_object(prtPlayer);
	player_y = sprite_get_ycenter_object(prtPlayer);
}

