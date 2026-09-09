if !instance_exists(prtPlayer)
{
	if instance_exists(objMusicPlayer)
	{
		with objMusicPlayer
		{
			playNoMusic();
		}
		with instance_nearest(x, y, objMusicPlayer) event_user(0);
	}
	else
	{
		playNoMusic();
	}
}

