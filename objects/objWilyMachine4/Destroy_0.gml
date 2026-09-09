if !cancelDestroyEvent {

	with objWilyMachine4Smoke {
	    instance_destroy();
	}
	with objWilyMachine4Shot {
	    instance_destroy();
	}
	instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objWilyPod4);

}

