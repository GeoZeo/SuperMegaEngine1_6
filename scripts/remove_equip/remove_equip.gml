function remove_equip(argument0) {
	//remove_equip(equip_index)
	var item_index = argument0;
	if item_index.count > 0 {
	    item_index.count--;
	    with item_index event_user(6);
	}



}
