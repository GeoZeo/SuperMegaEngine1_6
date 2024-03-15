if !global.frozen and instance_exists(prtPlayer) and global.weapons[global.currentWeapon] == self and ammo > 0 {
    if prtPlayer.isSlide and !instance_exists(objChargeKick) {
        if instance_exists(objSlideDust) and objSlideDust.image_index == 0 {
            var kick = instance_create(prtPlayer.x + prtPlayer.image_xscale * 5, prtPlayer.y + prtPlayer.sprite_height / 2, objChargeKick);
            kick.depth = prtPlayer.depth - 1;
            ammo -= consumption;
        }
    }
}

