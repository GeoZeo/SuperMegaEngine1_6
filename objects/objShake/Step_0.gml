event_inherited();

if !global.frozen && insideView() {
    if total_shake_x == 0 || total_shake_y == 0 {
        alarm[0] = shake_duration * room_speed;
    }
    shake_x = random_range(-shake_amount, shake_amount);
    shake_y = random_range(-shake_amount, shake_amount);
    total_shake_x += shake_x;
    total_shake_y += shake_y;
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (shake_x) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (shake_y) );
}

