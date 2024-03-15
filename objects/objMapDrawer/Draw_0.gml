var lines_size = ds_list_size(lines);

draw_set_colour(c_black);
for (var i = 0; i <= step; i++) {
    if i >= lines_size {
        break;
    }
    var p = 1;
    if i == step {
        p = progress;
        if draw_speed > 0 {
            playSFX(sfxEnergyRestore);
        }
    }
    var current_lines = ds_list_find_value(lines, i);
    if is_array(current_lines) {
        var line = current_lines;
        var dx = line[0] + p * (line[2] - line[0]);
        var dy = line[1] + p * (line[3] - line[1]);
        draw_line_width(x + line[0], y + line[1], x + dx, y + dy, line_width+2);
    }
    else {
        var size = ds_list_size(current_lines);
        for (var j = 0; j < size; j++) {
            var line = ds_list_find_value(current_lines, j);
            var dx = line[0] + p * (line[2] - line[0]);
            var dy = line[1] + p * (line[3] - line[1]);
            draw_line_width(x + line[0], y + line[1], x + dx, y + dy, line_width+2);
        }
    }
}


draw_set_colour(c_white);
for (var i = 0; i <= step; i++) {
    if i >= lines_size {
        break;
    }
    var p = 1;
    if i == step {
        p = progress;
    }
    if progress == 1 {
        stopSFX(sfxEnergyRestore);
    }
    var current_lines = ds_list_find_value(lines, i);
    if is_array(current_lines) {
        var line = current_lines;
        var dx = line[0] + p * (line[2] - line[0]);
        var dy = line[1] + p * (line[3] - line[1]);
        draw_line_width(x + line[0], y + line[1], x + dx, y + dy, line_width);
    }
    else {
        var size = ds_list_size(current_lines);
        for (var j = 0; j < size; j++) {
            var line = ds_list_find_value(current_lines, j);
            var dx = line[0] + p * (line[2] - line[0]);
            var dy = line[1] + p * (line[3] - line[1]);
            draw_line_width(x + line[0], y + line[1], x + dx, y + dy, line_width);
        }
    }
}
draw_sprite(sprFortressPoint, 0, x, y);
var last_line = ds_list_find_value(lines, lines_size - 1);
if !hidden || draw_speed > 0 {
    if is_array(last_line) {
        draw_sprite(place_icon, round(point_frame), x + last_line[2], y + last_line[3]);
    }
    else {
        var line = ds_list_find_value(last_line, 0);
        draw_sprite(place_icon, round(point_frame), x + line[2], y + line[3]);
    }
}
if draw_speed > 0 && point_frame < 1 {
    point_frame += 0.1;
}
else {
    point_frame = 0;
}

