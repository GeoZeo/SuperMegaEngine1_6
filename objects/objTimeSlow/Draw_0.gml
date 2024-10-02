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
    draw_rectangle(global.viewX, global.viewY, global.viewX + global.viewWidth, global.viewY + global.viewHeight, false); 
    draw_set_alpha(1);
}

