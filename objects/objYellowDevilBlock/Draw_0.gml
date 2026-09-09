useShader = false;
if whiteTimer > 0 && whiteTimer < 8 {
    shader_set(shBossHit);
    useShader = true;
}
else if alarm[1] > 0 {
    shader_set(shBossDefeated);
    useShader = true;
}

if current_state == block_states.IDLE {
    var left = col * 16 + 10;
    var top = row * 16;
    var width = 16;
    var height = 16;
    var x_ = x - 8;
    var y_ = y - 8;
    if col == 0 {   //First column is wider (foot)
        left = 0;
        width = 26;
        if image_xscale == 1 {
            x_ = x - 18;
        }
        else {
            x_ = x + 2;
        }
        if row == 1 {   //Col 0, row 1 is larger (shoulder)
            top -= 8;
            height += 8;
            y_ -= 8;
        }
    }
    if col == 1 && row == 3 {   //Col 1 row 3 is larger (inner side of leg)
        height += 16;
    }
    if col == 3 && row == 4 {   //Col 3 row 4 is wider (tip of front foot)
        width += 8;
    }
    if image_xscale == -1 {
        x_ += 16;
    }
    subimg = 0;
    draw_sprite_part_ext(sprYellowDevil, subimg, left, top, width, height, x_, y_, image_xscale, 1, c_white, 1);
}
else if insideView() {
    drawSelf();
}

if useShader {
    shader_reset();
}

