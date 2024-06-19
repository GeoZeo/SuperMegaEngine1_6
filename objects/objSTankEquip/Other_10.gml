/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

var proceed = false;
for(i = 0; i < global.totalWeapons; i++) {
    if ceil(global.weapons[i].ammo) < global.maxAmmo
        proceed = true;
}

if ceil(global._health) < global._maxHealth
    proceed = true;
                        
if proceed {
    show_debug_message("Can use. Starting restoring.");
    timer = 0;
    loopSFX(sfxEnergyRestore);
    using = true;
    ok = true;
}
else {
    ok = false;
    count++;
    playSFX(sfxError);
}

return ok;

