//Sets the ID of this pickup, so that we can despawn it when the room starts if the pickup has already been collected in the level
//However, if it's been dropped by an enemy or Eddie, this can be ignored
if !(variable_instance_exists(id, "index_of_origin") and (object_is_ancestor(index_of_origin, prtEnemy) or index_of_origin == objItemExplosion or index_of_origin == objEddie))
{
    if pickupID == -15
    {
        pickupID = global.currentPickupID;
        global.currentPickupID += 1;
    }
    
    if global.pickupCollected[pickupID] == true
	{
        instance_destroy();
	}
}

