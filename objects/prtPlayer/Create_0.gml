if object_index == prtPlayer {
    instance_create(x, y, global.character);
    instance_destroy();
    exit;
}

charName = "";
sprName = "";

if room != rmInit && room != rmPlayerSelect && room != rmLoadGame && room != rmSaveGame && room != rmPassInput {
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
grav = global.grav; //The player's gravity
gravWater = global.gravWater; //The player's gravity in water
jumpSpeed = cfgJumpSpeed;  //Dunno why grav needs to be multiplied by 2, but MM jumps as high as in MM5 when doing so
jumpSpeedWater = cfgJumpSpeedWater;
walkSpeed = cfgWalkSpeed;
maxVspeed = cfgMaxFallingSpeed;
stepSpeed = cfgStepSpeed;
stepFrames = cfgStepFrames;
canTurnaroundStep = cfgCanTurnaroundStep; //Whether sidestepping in the opposite direction to where we're facing actually moves us, or if it just flips us around without any movement (like in MM9 & 10).
iceDec = cfgIceDec; //The deceleration on ice when not holding any buttons
iceDecWalk = cfgIceDecWalk; //The deceleration on ice when moving in the opposite direction
iceAcc = cfgIceAcc; //The acceleration on ice when not holding any buttons and being pushed/pulled by a current (i.e: by objWind) while on the ground (NOTE: If you don't want movement applied by current to be slowed by ice, simply set the macro to a number equal to/greater than the walk speed macro.)
iceAccWalk = cfgIceAccWalk; //The acceleration on ice when moving from a standstill (NOTE: If you don't want to have to work for your momentum while on ice, simply set the macro to a number equal to/greater than the walk speed macro.)
flightAirControlOn = cfgEnableFlightAirControl; //Does bumping into walls still reset our speed while we're flying (i.e: via Beat, Rush Jet Adapter, Treble Boost, etc.)? Can be overridden to be true or false by each flight ability individually
slideSpeed = cfgSlideSpeed;
slideFrames = cfgSlideFrames;
dashSpeed = cfgDashSpeed;
dashFrames = cfgDashFrames;
climbSpeed = cfgClimbSpeed; //Official value of MM3
extraStunFrames = cfgExtraStunFrames; //Official value of MM9
initChargeTime = cfgInitChargeTime; //The amount of frames after which to start charging after the shooting animation is complete
chargeTime = cfgChargeTime; //Official value of MM6
enableSuperArmour = cfgEnableSuperArmour; //Whether or not the character has knockback immunity
hitTime = cfgHitTime; //The amount of frames you experience knockback after getting hit
knockbackAmount = cfgKnockback;
invincibilityTime = cfgInvincibilityTime; //The number of invincibility frames you get before you can get hit again

enableSlide = cfgEnableSlide;
enableCharge = cfgEnableCharge;
enableDash = false;

//Variables
ground = false;
crushed = false;
old_x = x;
old_y = y;
prevGround = false;
prevXScale = image_xscale;
skipCrushX = false;
skipCrushY = false;
isStep = false;
stepTimer = 0;
canInitStep = true; //Can we initialize sidestepping?
cancelStep = false; //Whether or not to cancel a sidestep when trying to do so in the opposite direction.
stunKnockbackSpeed = 0;
global.xspeed = 0;
global.yspeed = 0;
global.xforce = 0;
global.yforce = 0;
x_force = 0;
y_force = 0;
pltSpeedX = 0;
pltSpeedY = 0;
prevPltSpeedX = pltSpeedX;
prevPltSpeedY = pltSpeedY;
pushedBySpawnedSolid = false;
canMinJump = true;
locked = false; //Are we currently supposed to be locked via playerLockMovement?
pause = false;
global.hasJumped = false;
global.hasSwitchedL = false;
global.hasSwitchedR = false;
global.hasSlid = false;
canMove = true;
canJump = true;
maxJumps = 1; //How many times can we jump before landing on the ground again?
jumps = 0; //How many times have we jumped before hitting the ground? Originally a "canJump" bool implemented to fix a glitch where jumping on the frame you land prevents collision events such as the land sound, drop platforms opening and spikes killing you from occuring.
canWalk = true; //Can we walk/run while on the ground? Allows us to restrict this when using fixed-shot weapons such as the Metal Blade and Pharaoh Shot.
canSpriteChange = true;
canSwitch = false;
canShoot = true;
isShoot = false;
isThrow = false;
shootTimer = 0;
isSlide = false;
slideTimer = 0;
isDash = false;
dust_xoffset = 7;
dust_yoffset = 2;
canHit = true;
isHit = false;
hitTimer = 0;
superArmour = enableSuperArmour;
drawHitspark = false;
invincibilityTimer = 0;
isCharge = false;
chargeTimer = 0;
initChargeTimer = 0; //The timer for when to start charging after exiting the shooting animation
canGravity = true;
climbing = false;
climbSpriteTimer = 0;
isStun = false;
stunTimer = 0;
canStep = false; //We can actually perform the step event even if canStep = false; it's merely used to block certain events from happening at the first frame, as canStep becomes true after 1 frame
alarm[0] = 1; //For canStep
teleporting = false;
teleportY = 0;
teleportTimer = 0;
teleportSpeed = 7;
teleportAcc = 7/30;
landing = false;
currentTeleportSpeed = 0;
cameraXOffset = 0;
cameraYOffset = 0;
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
createGuardPowerUpEffect = false;
onRushJet = false; //Are we on the Rush Jet?
movedByPlatform = false;
movedPlatformID = -20;
damageMultiplier = 1;   //Multiplies damage taken

//These variables are almost all used exclusively for Beat physics (but you find find other uses for them ig...)
//State booleans
isFly = false; //Keeps the 'flying' bool in check in case we get hit
flying = false; //Whether or not the player is currently in the flight state
isRollback = false; //Keeps the 'disableSpeedResetting' bool in check in case we get hit
rollbackMovement = false; //Whether or not to roll back our speed and position after moving into a floor, wall or ceiling

//Variables for rolling back speed after a collision (NOTE: also used for wind currents)
xspeedRollback = -1000000;
yspeedRollback = -1000000;

//Booleans used to determine on which axes to roll back speed and position
againstGround = false;
againstWallLeft = false;
againstWallRight = false;
againstCeiling = false;

////Variables for rolling back position if necessary (used for wind currents
//xDiff = -1000000;
//yDiff = -1000000;

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
reflector_x = 0; //Reflector hitbox transform
reflector_y = 0;
reflector_width = 0;
reflector_height = 0;
reflector_left_offset = false; //Offset by 1 when facing left?

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
spriteDash = noone;
spriteHit = noone;
spriteStun = noone;
spriteTeleport = noone;
spriteLand = noone;
spriteAbsorbTransition = noone;
spriteAbsorb = noone;

spriteLife = sprLife;
spriteStageSelect = sprMMStageSelect;
stageSelectFollow = true;
speedStageSelect = 0;
spriteShop = sprMegamanShop;

//Additional shop variables
shopX = 198;
shopY = 145;
shopXScale = -1;
shopYScale = 1;
shopNPC = objAuto;
shopBackground = bgShop;

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
speedDash = 0;
speedHit = 0;
speedStun = 0;
speedTeleport = 0.15;
speedLand = 0;
speedAbsorbTransition = 0;
speedAbsorb = 0;

speedShop = 0;

//Starting jingle (i.e: Proto Man whistle)?
jingle = noone;

//Jet sprite (used in the credits)
jetSprite = sprRushJet;
jetSpeed = 0.25;

//Shop BGM
shopBGM = bgmShop;
shopBGMvolume = 0.9;
shopBGMloopStart = 0;
shopBGMloopEnd = 1;

//Show the READY text
showReady = true;
readyTimer = 0;
canSpriteChange = false;
canMove = false;
canWalk = false;
canGravity = false;
canPause = false;
image_speed = 0;

global.charTotalWeapons = 0;
var weapon_index = 0;
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtWeapon) {
        if !(ds_list_find_index(i.exceptCharacters, self.object_index) > -1 && ds_list_find_index(i.exceptCharacters, self.object_index) < ds_list_size(i.exceptCharacters)) {
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

