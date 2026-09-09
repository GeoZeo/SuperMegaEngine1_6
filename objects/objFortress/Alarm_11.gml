/// @description  Create Paths

var drawer;

currentObj = instance_find(objFortressPointStart, 0);

for (var i = 0; i < global.numFortressLevels; i++) {
	drawer[i] = instance_create(currentObj.x, currentObj.y, objMapDrawer);
	
	origin = currentObj;
	x = 0;
	y = 0;
	
	drawerRef = drawer[i];
	paths = [];
	path_i = 0;
	makePath(currentObj.up, currentObj.right, currentObj.down, currentObj.left, path_i);
	
	do
	{
		var old_length = array_length_1d(paths);
		if array_length_1d(paths) > 0 && paths[path_i] > -1
		{
			with paths[path_i] event_user(0);
		}
		path_i++;
		if path_i >= array_length_1d(paths)
		{
			drawerRef.keys[array_length_1d(drawerRef.keys)] = currentKey;
			currentKey++;
			with objFortressPath
			{
				if reachedSpot
				{
					var _j = 0;
					if next.object_index == objFortressPoint || object_is_ancestor(next.object_index, objFortressPoint) {
						fortressObj.currentObj = next;
						with fortressObj
						{
							for (var j = 0; j < array_length_1d(paths); j++)
							{
								if paths[j] == other.id
								{
									_j = j;
									array_delete(paths, j , 1);
									break;
								}
							}
						}
						instance_destroy();
					}
					else if object_is_ancestor(next.object_index, objFortressTurnPoint) {
						with fortressObj
						{
							for (var j = 0; j < array_length_1d(paths); j++)
							{
								if paths[j] == other.id
								{
									_j = j;
									array_delete(paths, j, 1);
									break;
								}
							}
						}
						if !next.lineCreated
						{
							makePath(next.up, next.right, next.down, next.left, _j);
							next.lineCreated = true;
						}
						instance_destroy();
					}
				}
			}
			path_i = 0;
		}
	} until instance_number(objFortressPath) == 0

	drawer[i].place_icon = currentObj.sprite_index;
    drawer[i].hidden = currentObj.hidden;
	if i == 0 {
		drawer[i].first = true;
	}
    if i != global.currentFortressLevel {
        drawer[i].draw_speed = 0;
    }
    if global.currentFortressLevel > i {
        drawer[i].step = ds_list_size(drawer[i].lines);
		drawer[i].hidden = false;
		currentKey = 0;
    }
}

