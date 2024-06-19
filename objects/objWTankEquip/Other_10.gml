/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

var proceed = false;

// Only prime the W-Tank if there's a weapon that needs refilling.
for(i = 0; i < global.totalWeapons; i++) {
    if global.weapons[i].ammo < global.maxAmmo
        proceed = true;
}

count++ // Don't decrement the counter yet! Returns the unit subtracted in parent
// If the W-Tank is ready to proceed, prime it for use.
if proceed {
    show_debug_message("Can use. Primed.");
    timer = 0;
    using = false;
    ok = true;
    primed = true;
    playSFX(sfxMenuSelect3);
}
else {
    ok = false;
    using = false;
    playSFX(sfxError);
    show_debug_message("Ammo already full. W-Tank count: " + string(count));
}

return ok;

//ToDo
//playSFX(sfxError);
//ok = false;
//count++;

//return ok;

