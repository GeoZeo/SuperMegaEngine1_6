var oldCol, oldAlp;
oldCol = draw_get_color();
oldAlpha = draw_get_alpha();

draw_set_color(c_black);
draw_set_alpha(blackAlpha);

draw_rectangle( __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ),  __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ), false);

draw_set_color(oldCol);
draw_set_alpha(oldAlpha);

