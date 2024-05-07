if object_index == prtPlayer {
    instance_create(x, y, global.character);
    instance_destroy();
    exit;
}

name = "";
sprName = "";

if room != rmInit {
    //Teleport to the checkpoint location, if we hit a checkpoint
    if global.checkpoint {
        x = global.checkpointX;
        y = global.checkpointY;
    }
    
    placeTileObjects();
    placeTileAnimations();
    placeRoomBorders();
    placeHorizontalBorders();
    mergeBlocks();

    //Initialize the camera
    newSectionXOffset = 0;
    newSectionYOffset = 0;
    playerCameraInit();
}


//Physics variables
grav = cfgGravity; //The player's gravity
gravWater = cfgGravityWater; //The player's gravity in water
jumpSpeed = cfgJumpSpeed;  //Dunno why grav needs to be multiplied by 2, but MM jumps as high as in MM5 when doing so
jumpSpeedWater = cfgJumpSpeedWater;
walkSpeed = cfgWalkSpeed;
maxVspeed = cfgMaxFallingSpeed;
stepSpeed = cfgStepSpeed;
stepForceMax = cfgMaxStepForce;
stepFrames = cfgStepFrames;
canTurnaroundStep = cfgCanTurnaroundStep; //Whether sidestepping in the opposite direction to where we're facing actually moves us, or if it just flips us around without any movement (like in MM9 & 10).
iceDec = cfgIceDec; //The deceleration on ice when not holding any buttons
iceDecWalk = cfgIceDecWalk; //The deceleration on ice when moving in the opposite direction
slideSpeed = cfgSlideSpeed;
slideFrames = cfgSlideFrames;
climbSpeed = cfgClimbSpeed; //Official value of MM3
initChargeTime = cfgInitChargeTime; //The amount of frames after which to start charging after the shooting animation is complete
chargeTime = cfgChargeTime; //Official value of MM6
hitTime = cfgHitTime; //The amount of frames you experience knockback after getting hit
knockbackAmount = cfgKnockback;
invincibilityTime = cfgInvincibilityTime; //The number of invincibility frames you get before you can get hit again

enableSlide = cfgEnableSlide;
enableCharge = cfgEnableCharge;

//Variables
ground = false;
prevGround = false;
prevXScale = image_xscale;
isStep = false;
stepTimer = 0;
stepForce = 0;
canInitStep = true; //Can we initialize sidestepping?
cancelStep = false; //Whether or not to cancel a sidestep when trying to do so in the opposite direction.
global.xspeed = 0;
global.yspeed = 0;
pltSpeedX = 0;
pltSpeedY = 0;
prevPltSpeedX = pltSpeedX;
prevPltSpeedY = pltSpeedY;
canMinJump = true;
locked = false; //Are we currently supposed to be locked via playerLockMovement?
canMove = true;
canJump = true; //Can we actually jump while on the ground? Implemented to fix a glitch where jumping on the frame you land prevents collision events such as the land sound, drop platforms opening and spikes killing you from occuring.
canWalk = true; //Can we walk/run while on the ground? Allows us to restrict this when using fixed-shot weapons such as the Metal Blade and Pharaoh Shot.
canSpriteChange = true;
canSwitch = false;
canShoot = true;
isShoot = false;
isThrow = false;
shootTimer = 0;
isSlide = false;
slideTimer = 0;
canHit = true;
isHit = false;
hitTimer = 0;
drawHitspark = false;
invincibilityTimer = 0;
isCharge = false;
chargeTimer = 0;
initChargeTimer = 0; //The timer for when to start charging after exiting the shooting animation
canGravity = true;
climbing = false;
climbSpriteTimer = 0;
canStep = false; //We can actually perform the step event even if canStep = false; it's merely used to block certain events from happening at the first frame, as canStep becomes true after 1 frame
alarm[0] = 1; //For canStep
teleporting = false;
teleportY = 0;
teleportTimer = 0;
dead = false;
deathByPit = false; //Did we die by falling in a bottomless pit?
killTime = 40; //Delay before MM explodes upon death (in frames). Change here as you see fit.
killTimer = 0;
playChargeSound = true; //Can we play the charging SFX? Or has it already been played?
playChargedSound = true; //Can we play the charged SFX? Or has it already been played?
playLandSound = true; //Should we play the landing SFX when colliding with a floor? (Disabled on ladders, for example)
playLandSoundTimer = 2; //Lasts two frames, since it takes 1 extra frame for the collision code to register
canPlayLandSound = false; //Is the floor safe (i.e: not a spike floor)? If so, we still play the landing SFX.
currentGrav = grav; //Normal gravity or water gravity?
currentJumpSpeed = jumpSpeed; //Normal jump speed or water jump speed?
inWater = false;
bubbleTimer = 0; //Timer for the air bubble MM creates under water
blinkTimer = 0; //Timer for MM's blinking animation when standing still
blinkTimerMax = 120;
blinkImage = 0; //0 for no blinking, 1 for blinking
blinkDuration = 8; //The amount of frames the blinking lasts
drawWeaponIcon = false; //Whether or not we should draw the weapon icon above our head (used when using quick weapon switching)
drawWeaponIconTimer = -1;
onRushJet = false; //Are we on the Rush Jet?
movedByPlatform = false;
movedPlatformID = -20;
damageMultiplier = 1;   //Multiplies damage taken

//Initial background music for the stage. Edit this in instance creation code.
bgm = noone;
bgmVolume = -1;
bgmLoopStart = -1;
bgmLoopEnd = -1;
bgmLength = -1;

update_rate = 1;

//Reflection
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left


shoot_height = 4;
shoot_shift = 6;
jump_shoot_height = 3;


primary_color = make_colour_rgb(0, 112, 236);
secondary_color = make_colour_rgb(0, 232, 216);
src_col1 = make_colour_rgb(0, 89, 255);
src_col2 = make_colour_rgb(0, 0, 187);
src_col3 = make_colour_rgb(0, 217, 255);

global.outlineCol = c_black;

spriteStandDefault = noone;
spriteStepDefault = noone;
spriteWalkDefault = noone;
spriteJumpDefault = noone;
spriteClimbDefault = noone;
spriteGetupDefault = noone;

spriteStand = noone;
spriteStep = noone;
spriteWalk = noone;
spriteJump = noone;
spriteClimb = noone;
spriteGetup = noone;
    
//Static sprites
spriteSlide = noone;
spriteHit = noone;
spriteTeleport = noone;

spriteLife = sprLife;
spriteStageSelect = sprMMStageSelect;
stageSelectFollow = true;

//Sprite animation speeds
speedStandDefault = 0;
speedStepDefault = 0;
speedWalkDefault = 0.15;
speedJumpDefault = 0;
speedClimbDefault = 0;
speedGetupDefault = 0;

speedStandShoot = 0;
speedStepShoot = 0;
speedWalkShoot = 0.15;
speedJumpShoot = 0;
speedClimbShoot = 0;
speedGetupShoot = 0;

speedStandThrow = 0;
speedStepThrow = 0;
speedWalkThrow = 0.15;
speedJumpThrow = 0;
speedClimbThrow = 0;
speedGetupThrow = 0;

speedStand = 0;
speedStep = 0;
speedWalk = 0.15;
speedJump = 0;
speedClimb = 0;
speedGetup = 0;

speedSlide = 0;
speedHit = 0;
speedTeleport = 0.15;

//Starting jingle (i.e: Proto Man whistle)?
jingle = noone;

//Show the READY text
showReady = true;
readyTimer = 0;
canSpriteChange = false;
canMove = false;
canWalk = false;
canGravity = false;
canPause = false;
image_speed = 0;

prevx = noone;

global.charTotalWeapons = 0;
var weapon_index = 0;
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtWeapon) {
        if i.character == -1 or i.character == self.object_index {
            with i {
                other.weapons[weapon_index] = self;
                other.weapons[weapon_index].newID = weapon_index;
            }
            weapon_index++;
        }
    }
}
global.charTotalWeapons = array_length_1d(weapons);
global.char_weapons_per_col = ceil(global.charTotalWeapons / 2);
global.weapons = weapons;
global.totalWeapons = global.charTotalWeapons;
global.weapons_per_col = global.char_weapons_per_col;

defaultWeapon = weapons[0];

global.charTotalEquips = 0;
var equip_index = 0;
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtEquip) and i != prtPlateEquip {
        if ds_list_find_index(i.exceptCharacters, object_index) == -1 {
            with i {
                other.items[equip_index] = self;
                event_user(5);
            }
            //print("adding", object_get_name(i), "to index", equip_index);
            equip_index++;
        }
    }
}
global.charTotalEquips = array_length_1d(items);
global.char_equips_per_row = ceil(global.charTotalEquips / 2);
global.items = items;


if room != rmInit {
    //Set the correct whitemask colors
    event_user(0);
}

