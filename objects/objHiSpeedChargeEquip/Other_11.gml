/// @description  onBuy

event_inherited();

for (var i = 0; i < global.totalWeapons; i++) {
    global.weapons[i].initChargeTime  /= 2;
    global.weapons[i].chargeTime  /= 2;
}

