global.damageMultiplier = 1;

option = 0;
selectedOption = false;
global.checkpoint = false;
global.levelStart = true;

if global._lives < 0 {
    global._lives = 2;
    gameOver = true;
    canSelectOption = false;
    if !audio_is_playing(bgmGameOver) {
        playMusicVolume(bgmGameOver, 1);
    }
    alarm[0] = 240;
}
else {
    gameOver = false;
    canSelectOption = true;
    
    if global.passPlayVictory && !audio_is_playing(bgmWeaponGet) {
        playMusicVolume(bgmWeaponGet, 1);
    }
}
    
for(var i = 0; i < global.totalWeapons; i++){
    global.weapons[i].ammo = 28;
}

pass = make_password();
print("Password", pass);

