wpnName = "";
abbrev = "";
description = "";
ammo = global.maxAmmo;
old_ammo = ammo;
consumption = 0;
chargeConsumption = 0;
maxshots = cfgMaxNumberOfBusterShots;
sfx = sfxBuster;
chargeSFX = sfxCharging;
chargedSFX = noone;

if cfgFadeOutChargedSound //Apply a fade-out to the fully charged SFX if you want it to be easier on the player's ears
	chargedSFX = sfxCharged;
else //Don't apply it if you want to prioritise accuracy to the NES games
	chargedSFX = sfxChargedLoop;
	
unlocked = false;
bThrow = false;
freeShot = true; //Determines whether or not we can run and use the weapon at the same time. Allows us to determine whether the throwing animation is purely cosmetic or not.
rapidFire = false;
canShoot = true;
yy = 0;
box = 0;
chargeTime = 0;
initChargeTime = 0;
chargeTimer = 0;
initChargeTimer = 0;
chargeAnimTime = chargeTime;
chargeAnimTimer = 0;
chargeWhileLocked = false;
chargeWhileScrolling = false;
cooldown = 0;

persistent = true;

primaryCol = make_color_rgb(0, 120, 248);
secondaryCol = make_color_rgb(0, 232, 216);

exceptCharacters = ds_list_create();

ID = -1;

