event_inherited();

if !global.frozen and obj != noone and insideView() and !place_meeting(x, y, obj) {
    counter += update_rate;
    if counter >= interval {
        counter = 0;
    }
    if instance_number_alive(obj) < maxObjs and counter == 0 {
        var instance = instance_create(x + dx, y + dy, obj);
        instance.respawn = false;
    }
}

visible = false;

