/// @description onCharging (used here for rapid fire)
if !global.frozen and instance_exists(prtPlayer) and !prtPlayer.locked and !instance_exists(objSectionSwitcher) and prtPlayer.canShoot and !prtPlayer.isSlide and (prtPlayer.canMove or prtPlayer.climbing) {
    event_user(1);
}

