if !dead && !dying {
	with prtPlayerProjectile {
		if deleteFromIgnore {
			if ds_list_find_index(ignore, other) >= 0 && ds_list_find_index(ignore, other) < ds_list_size(ignore) {
				ds_list_delete(ignore, ds_list_find_index(ignore, other));
			}
		}
	}
	with objReflectedProjectile {
		if deleteFromIgnore {
			if ds_list_find_index(ignore, other) >= 0 && ds_list_find_index(ignore, other) < ds_list_size(ignore) {
				ds_list_delete(ignore, ds_list_find_index(ignore, other));
			}
		}
	}
}