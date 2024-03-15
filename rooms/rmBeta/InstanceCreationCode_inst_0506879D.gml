mySpawnArea = instance_create(x-12, bbox_bottom-8, objEnemySpawnArea);
mySpawnArea.image_xscale = 1.5;
mySpawnArea.image_yscale = 1/2;

myActionArea = instance_create(x-24, bbox_bottom-8, objEnemyActionArea);
myActionArea.image_xscale = 3;
myActionArea.image_yscale = 1/2;

////To position to the left of an arrow block/screen border (based on 16x16 grid placement)...
////Place enemy at the left edge of the arrow block/screen border, then do this:
//mySpawnArea.image_xscale -= (1/16) * 12; //Tiles are 16x16 pixels -> 16 * 1.5 = 24 -> 24 / 2 = 12
//myActionArea.image_xscale -= (1/16) * 24; //16 * 3 = 48 -> 48 / 2 = 24

////To position to the right of an arrow block/screen border...
////Place enemy at the right edge of the arrow block/screen border, then do this:
//mySpawnArea.x += 12;
//myActionArea.x += 24;
//mySpawnArea.image_xscale -= (1/16) * 12;
//myActionArea.image_xscale -= (1/16) * 24;

////To position above an arrow block/screen border...
////Place enemy at the top edge of the arrow block/screen border, then do this:
//mySpawnArea.image_yscale -= (1/16) * 4; //16 * 1/2 = 8 -> 8 / 2 = 4
//myActionArea.image_yscale -= (1/16) * 4; //16 * 1/2 = 8 -> 8 / 2 = 4

////To position below an arrow block/screen border...
////Place enemy at the bottom edge of the arrow block/screen border, then do this:
//mySpawnArea.y += 12;
//myActionArea.y += 24;
//mySpawnArea.image_yscale -= (1/16) * 4;
//myActionArea.image_yscale -= (1/16) * 4;

col = 2;