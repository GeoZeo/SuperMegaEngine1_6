if __background_get( e__BG.Blend, 0 ) == c_blue {
    __background_set( e__BG.Visible, 1, false );
    shader_set(shBlueish);
    draw_background(bgFortress, 0, 0);
    shader_reset();
}
else {
    __background_set( e__BG.Visible, 0, true );
}

