drawSelf();
if (cfgDebug || debug_mode) and target > -1 {
    with target {
        draw_set_colour(c_fuchsia);
        draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
    }
}

