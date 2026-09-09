event_inherited();

switch current_scene {
    case 1:
		if canPlayMusic && (!instance_exists(objFadeIn) or !objFadeIn.reverse) {
			playMusicNoLoop(bgmOpening);
			canPlayMusic = false;
		}
        instance_activate_object(txt);
		var percentLeft = round((alarm[1] / delay_frames) * 4)/4;
        var intensity = 255;
        var blue = 255;
		with objText {
			switch ds_queue_size(phrases) {
				case 0:
					if percentLeft <= 0.25 {
						intensity = 0;
						x = round(room_width / 2) - 24;
						y = round(room_height / 2);
					}
					break;
				case 1:
					intensity = 255 * 0.25;
					break;
				case 2:
					intensity = 255 * 0.5;
					break;
				case 3:
					intensity = 255 * 0.75;
					break;
				default:
					intensity = 255;
					break;
			}
		}
        if intensity <= 0 {
            blue = 0;
        }
        __background_set( e__BG.Blend, 1, make_colour_rgb(intensity,intensity,blue) );
    break;
    case 2:
		if canPlayMusic && (!instance_exists(objFadeIn) or !objFadeIn.reverse) {
			with txt instance_destroy();
			playMusicNoLoop(bgmOpening2);
			canPlayMusic = false;
		}
        instance_activate_object(txt2);
    break;    
}

