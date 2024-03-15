event_inherited();

visible = false;
canHit = false;
image_speed = 0;
image_xscale = -1;
eyeTimer = 0;
hitWhite = false;
makeShadow = false;

offsetX = 16 + 12;
offsetY = 16 * 5 - 8;

blocks = 19;
block_delay = 0.5;    //Interval between blocks, in seconds

//First column
blockX[0] = 0;
blockX[1] = 0;
blockX[2] = 0;
blockX[3] = 0;

blockY[0] = 3;
blockY[1] = 2;
blockY[2] = 4;
blockY[3] = 1;

//Second column
blockX[4] = 1;
blockX[5] = 1;
blockX[6] = 1;
blockX[7] = 1;

blockY[4] = 2;
blockY[5] = 3;
blockY[6] = 1;
blockY[7] = 0;

//Third column
blockX[8] = 2;
blockX[9] = 2;
blockX[10] = 2;
blockX[11] = 2;
blockX[12] = 2;

blockY[8] = 4;
blockY[9] = 3;
blockY[10] = 2;
blockY[11] = 0;
blockY[12] = 1;

//Fourth column
blockX[13] = 3;
blockX[14] = 3;
blockX[15] = 3;
blockX[16] = 3;
blockX[17] = 3;

blockY[13] = 3;
blockY[14] = 1;
blockY[15] = 2;
blockY[16] = 0;
blockY[17] = 4;

//Fifth column
blockX[18] = 4;

blockY[18] = 2;

enum yd_states {OPENING, CLOSING, SHOOTING, CLOSED};

current_state = yd_states.CLOSED;

depth--;

