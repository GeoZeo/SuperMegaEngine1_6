event_inherited();

bossName = "PHARAOH MAN";
level = rmBeta;
introBGCol = make_color_rgb(255, 145, 95);
introLineCol = make_color_rgb(255, 204, 174);
standSprite = sprPharaohStand;
pose = sprPharaohPose;
poseImgSpeed = 3/60;
weaponID = objPharaohShotWeapon;
utilityID = -1;
//utilityID = objRushJetWeapon; //Uncomment this line (and remove the line above, optionally) for testing weapon get with utilities
bossID = 7; //The ID on the stage select screen. The top-left has an ID of 0, then it goes clockwise (so the left panel's ID is 7)
            //The middle panel's ID is 8
			
//bPersistent = false;

contactDamage = 4;

global.weaponID = weaponID;
global.utilityID = utilityID;
global.bossID = bossID;

healthpointsStart = 28;
healthpoints = healthpointsStart;
prevHealthPoints = healthpoints;

ground = false;
attackTimer = 0;
jumpTimer = 0;
jumpAmount = 0;
canInitShoot = true;
player_sprite_xcenter = 0;
player_sprite_ycenter = 0;
player_bbox_bottom = 0;
phase = 0; //0 = nothing; 1 = jumping; 2 = jumping and shooting; 3 = shooting the big shot

//Weapon damages (only the ones different from default)
damage[objStarCrash] = 0;

damage[objSilverTomahawk] = 2;

damage[objWindStorm] = 5;

damage[objCentaurFlash] = 4;

damage[objTimeSlow] = 1;

