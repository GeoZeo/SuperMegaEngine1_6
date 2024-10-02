/// @description  Set boss ID, as well as whether to respawn after defeat
myBoss = instance_nearest(x, y, prtBoss);
if myBoss > -1
{
	bossID = myBoss.bossID;
	bossPersistent = myBoss.bPersistent;
	healthpointsStart = myBoss.healthpointsStart;
}

