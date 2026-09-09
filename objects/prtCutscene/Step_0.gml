if instance_exists(objFadeIn) {
    with objFadeIn {
        if !reverse {
            __background_set( e__BG.Visible, other.current_scene, false );
            __background_set( e__BG.Visible, other.next_scene, true );
            other.current_scene = other.next_scene;
        }
    }
}

var _fadeIn = instance_exists(objFadeIn) && !objFadeIn.reverse;
var _fadeOut = (instance_exists(objFadeIn) && objFadeIn.reverse) || instance_exists(objFadeout);

if current_scene > final_scene || (can_skip && global.keyPausePressed && ((!_fadeIn or skip_fade_ins) and (!_fadeOut or skip_fade_outs))) {
    if !(current_scene > final_scene) && ((can_skip && global.keyPausePressed && ((!_fadeIn or skip_fade_ins) and (!_fadeOut or skip_fade_outs))) && fade_out_skip) {
		var ID = instance_create(0, 0, objFadeout);
	    ID.type = "room";
		ID.myRoom = next_room;
		
		with objFadeIn {
			if reverse {
				ID.blackAlpha = blackAlpha;
				ID.blackAlphaDecrease = -blackAlphaDecrease;
				ID.blackAlphaTimer = blackAlphaTimer;
				ID.blackAlphaTimerMax = blackAlphaTimerMax;
				instance_destroy();
			}
		}
		
		current_alarm = -1;
	}
	else {
		instance_destroy();
		room_goto(next_room);
	}
}

with objFadeout {
	if _fadeIn blackAlpha = 0;
}

