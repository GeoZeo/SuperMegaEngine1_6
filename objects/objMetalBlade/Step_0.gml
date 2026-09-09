if global.frozen == false
{
    image_speed = 0.375;
    
    xspeed = cos(degtorad(dir)) * 4;
    yspeed = -sin(degtorad(dir)) * 4;   //The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
    
	x += xspeed;
    y += yspeed;
	new_x = x;
	new_y = y;
	
	if cfgEnableProjectileCollisionStacking
	{
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
}
else
{
    image_speed = 0;
}

