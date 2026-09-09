if unpause {
	unpause = false;
	global.frozen = false;
	instance_destroy();
}

