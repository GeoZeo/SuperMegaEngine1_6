if global.screen_shader != noone {
    shader_set(global.screen_shader);
    draw_surface(application_surface, 0, 0);
    shader_reset();
}

