var _oldActive = instance_exists(prtPlayer);
if !_oldActive instance_activate_object(prtPlayer);
var _oldX = 0;
var _oldY = 0;
if instance_exists(prtPlayer)
{
	_oldX = prtPlayer.x;
	_oldY = prtPlayer.y;
	prtPlayer.x = global.viewX + round(global.viewWidth / 2);
	prtPlayer.y = global.viewY + round(global.viewHeight / 2);
}
with prtPlayer 
{
	playerCameraInit();
	
	prtPlayer.x = _oldX;
	prtPlayer.y = _oldY;
}

if activateCheckpoints && instance_exists(prtPlayer) && !prtPlayer.dead
{
	var _activated = false;
	var _found = false;
	
	var myCheckpoint, totalCheckpoints;
	myCheckpoint = instance_nearest(x, y, objCheckpoint);
	totalCheckpoints = 0;
	
	while myCheckpoint >= 0 && !_found
	{	
		if insideViewObj(myCheckpoint)
		{
			_found = true;
			break;
		}
		
		checkpointID[totalCheckpoints] = myCheckpoint;
		totalCheckpoints++;
		instance_deactivate_object(myCheckpoint);
		if instance_exists(objCheckpoint) myCheckpoint = instance_nearest(x, y, objCheckpoint);
	}
		
	var i;
	for(i = 0; i < totalCheckpoints; i++)
		instance_activate_object(checkpointID[i]);
	
	if instance_exists(myCheckpoint) && myCheckpoint > -1
	{
		with myCheckpoint
		{
			event_perform(ev_collision, prtPlayer);
			_activated = true;
		}
	}
	
	if !_activated
	{
		if cfgShowCheckpointFlag && !(global.checkpoint == true and global.checkpointX == xx and global.checkpointY == yy)
		{
			instance_create(other.x, other.y, objCheckpointFlag);
		}

		global.checkpoint = true;
		global.checkpointX = xx;
		global.checkpointY = yy;
	}
}

if !_oldActive instance_deactivate_object(prtPlayer);

