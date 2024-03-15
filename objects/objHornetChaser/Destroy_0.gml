if item > -1 {
	item.grabbedBy = -1;
	with item if pickupID == -15 restartTimer = true;
}

