instance_destroy();

if cfgShowCheckpointFlag && !(global.checkpoint == true and global.checkpointX == xx and global.checkpointY == yy)
{
	instance_create(other.x, other.y, objCheckpointFlag);
}

global.checkpoint = true;
global.checkpointX = xx;
global.checkpointY = yy;
