/// @description  onReleaseCharge

if prtPlayer.image_xscale == 1
    box = prtPlayer.bbox_right + prtPlayer.shoot_shift;
else
    box = prtPlayer.bbox_left - prtPlayer.shoot_shift;
    
switch prtPlayer.sprite_index {
    case prtPlayer.spriteStand: yy = prtPlayer.y + prtPlayer.shoot_height; break;
    case prtPlayer.spriteStep: yy = prtPlayer.y + prtPlayer.shoot_height; break;
    case prtPlayer.spriteWalk: yy = prtPlayer.y + prtPlayer.shoot_height; break;
    case prtPlayer.spriteJump: yy = prtPlayer.y + prtPlayer.jump_shoot_height; break;
    case prtPlayer.spriteClimb: yy = prtPlayer.y + prtPlayer.shoot_height; break;
    default: yy = prtPlayer.y + prtPlayer.shoot_height; break;
}

if prtPlayer.climbing {
    prtPlayer.image_xscale = prtPlayer.climbShootXscale;
    
    if prtPlayer.image_xscale == 1
        box = prtPlayer.bbox_right;
    else
        box = prtPlayer.bbox_left;
}



