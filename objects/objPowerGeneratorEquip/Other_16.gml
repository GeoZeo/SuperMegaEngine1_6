/// @description  onRemove

event_inherited();

for (var i = 0; i < global.totalWeapons; i++) {
    global.weapons[i].consumption *= 2;
    global.weapons[i].chargeConsumption *= 2;
}

