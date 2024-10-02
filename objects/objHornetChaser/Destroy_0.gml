if target > -1 && instance_exists(target)
	target.targetedBy = -1;
	
if item > -1 && instance_exists(item) {
	item.grabbedBy = -1;
	item.targetedBy = -1;
	with item if pickupID == -15 restartTimer = true;
}

