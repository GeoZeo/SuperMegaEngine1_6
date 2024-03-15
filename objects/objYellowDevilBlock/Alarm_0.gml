/// @description UNFIT
current_state = block_states.UNFIT;

/// Throw next block
with objYellowDevilBlock {
    if block_id == other.block_id + 1 && current_state == block_states.IDLE && image_xscale == other.image_xscale {
        alarm[0] = room_speed * delay;
    }
}

