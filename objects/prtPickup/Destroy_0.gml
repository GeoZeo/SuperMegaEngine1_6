if fromStageEddie {
	var _oldActive = instance_exists(objEddie);
	if !_oldActive instance_activate_object(objEddie);
	if instance_exists(id_of_origin) {
		with id_of_origin {
			myItem = -1;
		}
	}
	if !_oldActive instance_deactivate_object(objEddie);
}

