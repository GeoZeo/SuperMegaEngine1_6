drawSelf3ColorsFixed(global.primaryCol, global.secondaryCol, global.outlineCol);

//drawSelf();

if cfgDebug || debug_mode {
    draw_set_color(c_white);
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
    draw_arrow(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter() + xspeed * 10, sprite_get_ycenter() + yspeed * 10, 10);
}

