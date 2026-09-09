if !global.frozen || instance_exists(objSectionSwitcher) {
	img_index += img_speed;
}

if instance_exists(prtPlayer) and prtPlayer.isSlide {
    //prtPlayer.canHit = false;
    image_xscale = prtPlayer.image_xscale;
    x = (prtPlayer.x + box_xoffset) + (global.xspeed + prtPlayer.pltSpeedX);
    y = (prtPlayer.y + box_yoffset) + (global.yspeed + prtPlayer.pltSpeedY);
	new_x = x;
	new_y = y;
}
else {
    instance_destroy();
}

if !global.frozen && cfgEnableProjectileCollisionStacking {
	var myEnemy, totalEnemies;
	myEnemy = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtEnemy, false, true);
	totalEnemies = 0;
	
	while myEnemy >= 0
	{	
		enemyID[totalEnemies] = myEnemy;
		totalEnemies++;
		instance_deactivate_object(myEnemy);
		myEnemy = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtEnemy, false, true);
	}
		
	var i;
	for(i = 0; i < totalEnemies; i++)
		instance_activate_object(enemyID[i]);
		
	var myShot, totalShots;
	myShot = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtEnemyProjectile, false, true);
	totalShots = 0;
	
	while myShot >= 0
	{	
		shotID[totalShots] = myShot;
		totalShots++;
		instance_deactivate_object(myShot);
		myShot = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtEnemyProjectile, false, true);
	}
	
	for(i = 0; i < totalShots; i++)
		instance_activate_object(shotID[i]);
	
	var myGimmick, totalGimmicks;
	myGimmick = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtGimmick, false, true);
	totalGimmicks = 0;
	
	while myGimmick >= 0
	{	
		gimmickID[totalGimmicks] = myGimmick;
		totalGimmicks++;
		instance_deactivate_object(myGimmick);
		myGimmick = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtGimmick, false, true);
	}
		
	for(i = 0; i < totalGimmicks; i++)
		instance_activate_object(gimmickID[i]);
		
	var mySolid, totalSolids;
	mySolid = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtSolidGimmick, false, true);
	totalSolids = 0;
	
	while mySolid >= 0
	{	
		solidID[totalSolids] = mySolid;
		totalSolids++;
		instance_deactivate_object(mySolid);
		mySolid = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtSolidGimmick, false, true);
	}
		
	for(i = 0; i < totalSolids; i++)
		instance_activate_object(solidID[i]);
		
	if totalEnemies > 0 || totalShots > 0 || totalGimmicks > 0 || totalSolids > 0
	{
		event_user(0);
	}
}

