/// @description onAdd

if platesCount() == platesCollectedCount() {
    weapon.unlocked = true;
    add_achievement(objTimeLordAchievement);
}

