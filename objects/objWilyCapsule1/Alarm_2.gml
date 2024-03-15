/// @description  Attack
randomize();

image_xscale = 4;
image_yscale = 4;
do {
    x = random(__view_get( e__VW.WView, 0 ) - 96) + __view_get( e__VW.XView, 0 ) + 48;
    y = random(__view_get( e__VW.HView, 0 ) - 96) + __view_get( e__VW.YView, 0 ) + 48;
} until(!place_meeting(x, y, prtPlayer));
do {
    centerX = random(__view_get( e__VW.WView, 0 ) - maxRadius * 2) + __view_get( e__VW.XView, 0 ) + maxRadius;
    centerY = random(__view_get( e__VW.HView, 0 ) - maxRadius * 2) + __view_get( e__VW.YView, 0 ) + maxRadius;
    image_xscale *= 0.9;
    image_yscale *= 0.9;
} until(!place_meeting(centerX, centerY, prtPlayer));
image_xscale = 1;
image_yscale = 1;

for (var i = 0; i < 4; i++) {
    instance_create(centerX, centerY, objWilyCapsuleEnergy);
}

alarm[0] = maxRadius;

