event_inherited();

if !global.frozen and obj != noone and insideView() and !place_meeting(x, y, obj) {
    counter += update_rate;
    if counter >= interval {
        counter = 0;
    }
    if instance_number_alive(obj) < maxObjs and counter == 0 {
        var instance = instance_create(x + dx, y + dy, obj);
        instance.respawn = false;
		if object_get_parent(instance.object_index) == prtEnemy {
			instance.inWater = inWater;
			if instance.checkWater && instance.inWater instance.currentGrav = instance.gravWater;
		}
    }
}

visible = false;

