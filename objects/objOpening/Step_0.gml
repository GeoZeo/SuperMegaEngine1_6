event_inherited();

switch current_scene {
    case 1:
        instance_activate_object(txt);
        var intensity = 255 * round((alarm[1] / delay_frames) * 4)/4;
        var blue = 255;
        if intensity <= 0 {
            blue = 0;
        }
        __background_set( e__BG.Blend, 1, make_colour_rgb(intensity,intensity,blue) );
    break;
    case 2:
        instance_activate_object(txt2);
    break;    
}

