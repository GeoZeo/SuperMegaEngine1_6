progress = 0;
canDraw = false;
current_priority = 0;
draw_speed = 0.1;
first = false;
drawPoint = false; //Set to false to make the hidden point appear only when the path touches its position.
keys = [];
lines = ds_list_create();
step = -1;
point_frame = 0;
line_width = 2;
place_icon = sprFortressPoint;
hidden = false;
playDrawSound = true;
instance_deactivate_object(self);

