//Create necessary objects
if !instance_exists(objGlobalControl)
    instance_create(x, y, objGlobalControl);
    
if !instance_exists(objHealthWeaponBar)
    instance_create(x, y, objHealthWeaponBar);
    
if !instance_exists(objFadeIn)
    instance_create(x, y, objFadeIn);
    
//map_surf = drawMap(room, 1/48, x, y);

playerCameraInit();

bgm = global.bgmIndex;
bgmLoopStart = global.loopStart;
bgmLoopEnd = global.loopEnd;
bgmVolume = global.volume;
bgmLength = global.length;

if room == rmWeaponGet
	jingle = noone;