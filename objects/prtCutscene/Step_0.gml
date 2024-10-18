if instance_exists(objFadeIn) {
    with objFadeIn {
        if !reverse {
            __background_set( e__BG.Visible, other.current_scene, false );
            __background_set( e__BG.Visible, other.next_scene, true );
            other.current_scene = other.next_scene;
        }
    }
}

var _fadeInExists = instance_exists(objFadeIn) && !objFadeIn.reverse;

if (can_skip && (global.keyPausePressed or global.keyJumpPressed) && (!_fadeInExists or skip_fade_ins) && !skip_fade_outs) {
	if skip_fade_ins with objFadeIn if !reverse instance_destroy();
	changeScene(final_scene, delay);
}
if current_scene > final_scene || (can_skip && global.keyPausePressed && ((!_fadeInExists or skip_fade_ins) and skip_fade_outs)) {
    instance_destroy();
    room_goto(next_room);
}

