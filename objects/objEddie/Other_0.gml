global.eddieInstance = -1;

if called
{
	instance_destroy();
}
else
{
	if itemCollected instance_destroy();
	event_user(0);
}

