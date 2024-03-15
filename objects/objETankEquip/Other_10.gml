event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

if global._health < global._maxHealth {
    show_debug_message("Can use. Starting restoring.");
    timer = 0;
    using = true;
    ok = true;
    loopSFX(sfxEnergyRestore);
}
else {
    ok = false;
    using = false;
    count++;    //Return the unit subtracted in parent
    playSFX(sfxError);
    show_debug_message("Health already full. E-Tank count: " + string(count));
}

return ok;

