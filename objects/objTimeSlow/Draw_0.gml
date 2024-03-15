if activating and instance_exists(prtPlayer) {
    draw_set_alpha(0.5);
    draw_set_color(c_purple);
    draw_circle(x, y, radius - 0.5, true);
    draw_circle(x, y, radius + 0.5, true);
    draw_set_color(c_fuchsia);
    draw_circle(x, y, radius, true);
    
    draw_set_color(c_purple);
    draw_circle(x, y, radius / 2 - 0.5, true);
    draw_circle(x, y, radius / 2 + 0.5, true);
    draw_set_color(c_fuchsia);
    draw_circle(x, y, radius / 2, true);
    
    draw_set_color(c_purple);
    draw_circle(x, y, radius / 4 - 0.5, true);
    draw_circle(x, y, radius / 4 + 0.5, true);
    draw_set_color(c_fuchsia);
    draw_circle(x, y, radius / 4, true);
    draw_set_alpha(1);
}

if alarm[1] > 0 {
    draw_set_alpha(0.1);
    draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ), false); 
    draw_set_alpha(1);
}

