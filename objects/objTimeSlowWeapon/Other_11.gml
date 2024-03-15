/// @description  onShoot
event_inherited();
if instance_exists(objTimeSlow) {
    if ok
        ammo += consumption;
    with global.defaultWeapon event_user(1);
    return false;
}

if !ok return false;

attackID = instance_create(sprite_get_xcenter_object(prtPlayer), sprite_get_ycenter_object(prtPlayer), objTimeSlow);

