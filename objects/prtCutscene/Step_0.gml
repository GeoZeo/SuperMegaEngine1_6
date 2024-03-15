if instance_exists(objFadeIn) {
    with objFadeIn {
        if !reverse {
            __background_set( e__BG.Visible, other.current_scene, false );
            __background_set( e__BG.Visible, other.next_scene, true );
            other.current_scene = other.next_scene;
        }
    }
}
if current_scene > final_scene || (can_skip && global.keyPausePressed) {
    instance_destroy();
    room_goto(next_room);
}

