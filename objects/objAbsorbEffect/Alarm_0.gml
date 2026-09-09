if instance_exists(objBossDeathTimer)
{
	target_x = objBossDeathTimer.x+objBossDeathTimer.image_xscale;
	target_y = objBossDeathTimer.y+4;
    move_towards_point(target_x, target_y, spd);
}

