/// @description  onUnPrime: to be inherited
//will be called when unpriming the item in the pause menu

if count <= 0 || !usable {
    show_debug_message("Equipment not usable or inexistent. Count: " + string(count) + " Usable: " + string(usable));
    playSFX(sfxError);
    ok = false;
    return false;
}


ok = true;
show_debug_message("Unpriming " + eqName);

return true;

