/// @description  Attack

image_xscale = 4;
image_yscale = 4;

do {
	randomize();
    x = random(global.viewWidth - 96) + global.viewX + 48;
	randomize();
    y = random(global.viewHeight - 96) + global.viewY + 48;
} until(!place_meeting(x, y, prtPlayer));
do {
	randomize();
    centerX = random(global.viewWidth - maxRadius * 2) + global.viewX + maxRadius;
    randomize();
	centerY = random(global.viewHeight - maxRadius * 2) + global.viewY + maxRadius;
    image_xscale *= 0.9;
    image_yscale *= 0.9;
} until(!place_meeting(centerX, centerY, prtPlayer));
image_xscale = 1;
image_yscale = 1;

for (var i = 0; i < 4; i++) {
    instance_create(centerX, centerY, objWilyCapsuleEnergy);
}

alarm[0] = maxRadius;

