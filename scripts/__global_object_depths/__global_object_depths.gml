function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths = [];
	array_push(global.__objectDepths, 0); // objSolid
	array_push(global.__objectDepths, 0); // objIce
	array_push(global.__objectDepths, 0); // objTopSolid
	array_push(global.__objectDepths, 0); // objLadder
	array_push(global.__objectDepths, 0); // objSpike
	array_push(global.__objectDepths, 0); // objWater
	array_push(global.__objectDepths, 0); // prtCollision
	array_push(global.__objectDepths, -1010000); // objGlobalControl
	array_push(global.__objectDepths, -1010000); // objGlobalInit
	array_push(global.__objectDepths, -2); // prtPlayer
	array_push(global.__objectDepths, -2); // objMegaman
	array_push(global.__objectDepths, -2); // objProtoman
	array_push(global.__objectDepths, 0); // prtWeapon
	array_push(global.__objectDepths, 0); // prtPlayerProjectile
	array_push(global.__objectDepths, 0); // prtShieldWeapon
	array_push(global.__objectDepths, -1); // objReflectedProjectile
	array_push(global.__objectDepths, -1); // objBusterShot
	array_push(global.__objectDepths, -1); // objBusterShotHalfCharged
	array_push(global.__objectDepths, -1); // objBusterShotCharged
	array_push(global.__objectDepths, 0); // objMegaBusterWeapon
	array_push(global.__objectDepths, -1); // objProtoBusterShotHalfCharged
	array_push(global.__objectDepths, -1); // objProtoBusterShotCharged
	array_push(global.__objectDepths, 0); // objProtoBusterWeapon
	array_push(global.__objectDepths, -1); // objMetalBlade
	array_push(global.__objectDepths, 0); // objMetalBladeWeapon
	array_push(global.__objectDepths, -1); // objNeedleCannon
	array_push(global.__objectDepths, 0); // objNeedleCannonWeapon
	array_push(global.__objectDepths, -2); // objPharaohShotCharging
	array_push(global.__objectDepths, -1); // objPharaohShot
	array_push(global.__objectDepths, -1); // objPharaohShotCharged
	array_push(global.__objectDepths, 0); // objPharaohShotWeapon
	array_push(global.__objectDepths, 0); // objDrillBombWeapon
	array_push(global.__objectDepths, -1); // objDrillBomb
	array_push(global.__objectDepths, -1); // objDrillBombExplosion
	array_push(global.__objectDepths, -3); // objStarCrash
	array_push(global.__objectDepths, 0); // objStarCrashWeapon
	array_push(global.__objectDepths, -1); // objChargeKick
	array_push(global.__objectDepths, 0); // objChargeKickWeapon
	array_push(global.__objectDepths, -1); // objSilverTomahawk
	array_push(global.__objectDepths, 0); // objSilverTomahawkWeapon
	array_push(global.__objectDepths, -1); // objWindStorm
	array_push(global.__objectDepths, 0); // objWindStormWeapon
	array_push(global.__objectDepths, 0); // objCentaurFlash
	array_push(global.__objectDepths, 0); // objCentaurFlashWeapon
	array_push(global.__objectDepths, 0); // objHornetChaserWeapon
	array_push(global.__objectDepths, 1); // objHornetChaser
	array_push(global.__objectDepths, 0); // prtRush
	array_push(global.__objectDepths, 0); // objRushCoil
	array_push(global.__objectDepths, 0); // objRushCoilWeapon
	array_push(global.__objectDepths, -3); // objRushJet
	array_push(global.__objectDepths, 0); // objRushJetWeapon
	array_push(global.__objectDepths, 0); // objTimeSlowWeapon
	array_push(global.__objectDepths, 0); // objTimeSlow
	array_push(global.__objectDepths, 0); // objMegamanSweat
	array_push(global.__objectDepths, 0); // objMegamanExplosion
	array_push(global.__objectDepths, -3); // objGuardPowerUpEffect
	array_push(global.__objectDepths, -1001000); // objHealthWeaponBar
	array_push(global.__objectDepths, 0); // objMegamanDeathTimer
	array_push(global.__objectDepths, -1100000); // objFadeIn
	array_push(global.__objectDepths, -1100000); // objFadeout
	array_push(global.__objectDepths, 0); // objMM1Met
	array_push(global.__objectDepths, 0); // objSuzi
	array_push(global.__objectDepths, 0); // objBeak
	array_push(global.__objectDepths, 0); // objPicketMan
	array_push(global.__objectDepths, 0); // objScrewBomber
	array_push(global.__objectDepths, 0); // objBigEye
	array_push(global.__objectDepths, 0); // objGabyoall
	array_push(global.__objectDepths, 0); // objMM1MetBullet
	array_push(global.__objectDepths, 0); // objBeakBullet
	array_push(global.__objectDepths, 0); // objPicket
	array_push(global.__objectDepths, 0); // objMM2Baton
	array_push(global.__objectDepths, 0); // objTelly
	array_push(global.__objectDepths, 0); // objFanFiend
	array_push(global.__objectDepths, 0); // objSniperJoe
	array_push(global.__objectDepths, 0); // objMM2Bullet
	array_push(global.__objectDepths, 0); // objPoleEgg
	array_push(global.__objectDepths, 0); // objPole
	array_push(global.__objectDepths, 0); // objDestructibleWall
	array_push(global.__objectDepths, 0); // objBBitter
	array_push(global.__objectDepths, 0); // objOctoper
	array_push(global.__objectDepths, 0); // objOctoShot
	array_push(global.__objectDepths, 0); // objColton
	array_push(global.__objectDepths, 0); // objColtonBullet
	array_push(global.__objectDepths, 0); // prtEnemy
	array_push(global.__objectDepths, 0); // prtEnemyProjectile
	array_push(global.__objectDepths, -1001000); // objEnemyActionArea
	array_push(global.__objectDepths, -1001000); // objEnemyActionArea
	array_push(global.__objectDepths, 0); // objEnemyWindStorm
	array_push(global.__objectDepths, 0); // prtMiniBoss
	array_push(global.__objectDepths, -1001000); // objBossControl
	array_push(global.__objectDepths, -1001000); // objArenaStartingPoint
	array_push(global.__objectDepths, 10); // objBossDoor
	array_push(global.__objectDepths, 10); // objBossDoorH
	array_push(global.__objectDepths, 0); // objPharaoh
	array_push(global.__objectDepths, 0); // objPharaohManShot
	array_push(global.__objectDepths, 0); // objPharaohManShotBig
	array_push(global.__objectDepths, 0); // prtBoss
	array_push(global.__objectDepths, 0); // objBossDeathTimer
	array_push(global.__objectDepths, 0); // objAbsorbEffect
	array_push(global.__objectDepths, 0); // prtFortressBoss
	array_push(global.__objectDepths, 0); // objBossShadow
	array_push(global.__objectDepths, 3); // objYellowDevil
	array_push(global.__objectDepths, 3); // objYellowDevilBlock
	array_push(global.__objectDepths, 0); // objYellowDevilBullet
	array_push(global.__objectDepths, 0); // objWilyMachine4
	array_push(global.__objectDepths, 0); // objWilyMachine4Shot
	array_push(global.__objectDepths, 0); // objWilyMachine4Smoke
	array_push(global.__objectDepths, 0); // objWilyPod4
	array_push(global.__objectDepths, 0); // objWilyCapsule1
	array_push(global.__objectDepths, 0); // objWilyCapsuleEnergy
	array_push(global.__objectDepths, 0); // objWilyCapsuleShot
	array_push(global.__objectDepths, 0); // objDrWily
	array_push(global.__objectDepths, 0); // objBigEyeBoss
	array_push(global.__objectDepths, 0); // prtPickup
	array_push(global.__objectDepths, 0); // objLifeEnergySmall
	array_push(global.__objectDepths, 0); // objLifeEnergyBig
	array_push(global.__objectDepths, 0); // objWeaponEnergySmall
	array_push(global.__objectDepths, 0); // objWeaponEnergyBig
	array_push(global.__objectDepths, 0); // objETank
	array_push(global.__objectDepths, 0); // objWTank
	array_push(global.__objectDepths, 0); // objMTank
	array_push(global.__objectDepths, 0); // objSTank
	array_push(global.__objectDepths, 0); // objLife
	array_push(global.__objectDepths, 0); // objScrewSmall
	array_push(global.__objectDepths, 0); // objScrewBig
	array_push(global.__objectDepths, 0); // objEnergyBalancer
	array_push(global.__objectDepths, 0); // objYashichi
	array_push(global.__objectDepths, 0); // objPlateT
	array_push(global.__objectDepths, 0); // objPlateI
	array_push(global.__objectDepths, 0); // objPlateM
	array_push(global.__objectDepths, 0); // objPlateE
	array_push(global.__objectDepths, 0); // prtGimmick
	array_push(global.__objectDepths, 0); // prtSolidGimmick
	array_push(global.__objectDepths, 0); // prtMovingPlatformJumpthrough
	array_push(global.__objectDepths, 0); // prtMovingPlatformSolid
	array_push(global.__objectDepths, 1); // objYokuBlock
	array_push(global.__objectDepths, 0); // objSpawner
	array_push(global.__objectDepths, 0); // objShake
	array_push(global.__objectDepths, 10); // objTeleport
	array_push(global.__objectDepths, 0); // objTellySpawner
	array_push(global.__objectDepths, 0); // objMM2Conveyor
	array_push(global.__objectDepths, 0); // objWind
	array_push(global.__objectDepths, 0); // objSparkmanPlatform
	array_push(global.__objectDepths, 0); // objSparkmanPlatformStop
	array_push(global.__objectDepths, 0); // objDropPlatform
	array_push(global.__objectDepths, 0); // objJunkBlockSpawner
	array_push(global.__objectDepths, 999000); // prtScenery
	array_push(global.__objectDepths, 999000); // objMM3Teleporter
	array_push(global.__objectDepths, 0); // objMovingPlatformTest
	array_push(global.__objectDepths, 0); // objMovingPlatformJumpthroughTest
	array_push(global.__objectDepths, -1001000); // objCheckpoint
	array_push(global.__objectDepths, 0); // objJunkBlock
	array_push(global.__objectDepths, 0); // prtDestructibleBlock
	array_push(global.__objectDepths, 0); // objDustBlock
	array_push(global.__objectDepths, 0); // objAutoScroll
	array_push(global.__objectDepths, -1001000); // objMusicPlayer
	array_push(global.__objectDepths, 0); // prtEffect
	array_push(global.__objectDepths, 0); // objExplosion
	array_push(global.__objectDepths, 0); // objItemExplosion
	array_push(global.__objectDepths, 0); // objSlideDust
	array_push(global.__objectDepths, 0); // objSplash
	array_push(global.__objectDepths, 0); // objSplashH
	array_push(global.__objectDepths, -4); // objAirBubble
	array_push(global.__objectDepths, -900); // objDmgText
	array_push(global.__objectDepths, 0); // objFlash
	array_push(global.__objectDepths, 0); // objExplosion4
	array_push(global.__objectDepths, -1010000); // objPauseMenu
	array_push(global.__objectDepths, -1010000); // objPassMenu
	array_push(global.__objectDepths, -1010000); // objPassInput
	array_push(global.__objectDepths, 0); // objWeaponGet
	array_push(global.__objectDepths, 0); // objStageSelect
	array_push(global.__objectDepths, 0); // objIntroduction
	array_push(global.__objectDepths, 0); // objDisclaimer
	array_push(global.__objectDepths, 0); // objTitleScreen
	array_push(global.__objectDepths, 0); // objShop
	array_push(global.__objectDepths, 0); // objMainMenu
	array_push(global.__objectDepths, 0); // objKeyConfig
	array_push(global.__objectDepths, 0); // objJoyConfig
	array_push(global.__objectDepths, 0); // objLoadGame
	array_push(global.__objectDepths, 0); // objSaveGame
	array_push(global.__objectDepths, 0); // objPlayerSelect
	array_push(global.__objectDepths, 0); // objAchievements
	array_push(global.__objectDepths, -1001000); // objSectionBorderLeftScreen
	array_push(global.__objectDepths, -1001000); // objSectionBorderRightScreen
	array_push(global.__objectDepths, -1001000); // objSectionBorderVertical
	array_push(global.__objectDepths, -1001000); // objSectionScrollLeft
	array_push(global.__objectDepths, -1001000); // objSectionScrollRight
	array_push(global.__objectDepths, -1001000); // objSectionBorderTopScreen
	array_push(global.__objectDepths, -1001000); // objSectionBorderBottomScreen
	array_push(global.__objectDepths, -1001000); // objSectionBorderHorizontal
	array_push(global.__objectDepths, -1001000); // objSectionScrollUp
	array_push(global.__objectDepths, -1001000); // objSectionScrollDown
	array_push(global.__objectDepths, -1001000); // objSectionBorderLeft
	array_push(global.__objectDepths, -1001000); // objSectionBorderRight
	array_push(global.__objectDepths, -1001000); // objSectionBorderTop
	array_push(global.__objectDepths, -1001000); // objSectionBorderBottom
	array_push(global.__objectDepths, -1001000); // objSectionArrowLeft
	array_push(global.__objectDepths, -1001000); // objSectionArrowRight
	array_push(global.__objectDepths, -1001000); // objSectionArrowUp
	array_push(global.__objectDepths, -1001000); // objSectionArrowDown
	array_push(global.__objectDepths, 0); // objSectionSwitcher
	array_push(global.__objectDepths, 0); // prtEquip
	array_push(global.__objectDepths, 0); // objLifeEquip
	array_push(global.__objectDepths, 0); // objETankEquip
	array_push(global.__objectDepths, 0); // objWTankEquip
	array_push(global.__objectDepths, 0); // objSTankEquip
	array_push(global.__objectDepths, 0); // objMTankEquip
	array_push(global.__objectDepths, 0); // objEddieEquip
	array_push(global.__objectDepths, 0); // objGuardPowerUpEquip
	array_push(global.__objectDepths, 0); // objExitEquip
	array_push(global.__objectDepths, 0); // objShockGuardEquip
	array_push(global.__objectDepths, 0); // objBeatEquip
	array_push(global.__objectDepths, 0); // objEnergyBalancerEquip
	array_push(global.__objectDepths, 0); // objPowerGeneratorEquip
	array_push(global.__objectDepths, 0); // objHiSpeedChargeEquip
	array_push(global.__objectDepths, 0); // prtPlateEquip
	array_push(global.__objectDepths, 0); // objPlateTEquip
	array_push(global.__objectDepths, 0); // objPlateIEquip
	array_push(global.__objectDepths, 0); // objPlateMEquip
	array_push(global.__objectDepths, 0); // objPlateEEquip
	array_push(global.__objectDepths, 0); // objText
	array_push(global.__objectDepths, 0); // prtCutscene
	array_push(global.__objectDepths, 0); // objOpening
	array_push(global.__objectDepths, 0); // objWilyUFO
	array_push(global.__objectDepths, 0); // objCredits
	array_push(global.__objectDepths, 0); // objFortress
	array_push(global.__objectDepths, 0); // objFortressPoint
	array_push(global.__objectDepths, 0); // objFortressTurnPoint
	array_push(global.__objectDepths, 0); // objFortressPointStart
	array_push(global.__objectDepths, 0); // objFortressUp
	array_push(global.__objectDepths, 0); // objFortressDown
	array_push(global.__objectDepths, 0); // objFortressRight
	array_push(global.__objectDepths, 0); // objFortressLeft
	array_push(global.__objectDepths, 0); // objFortressSpot
	array_push(global.__objectDepths, 0); // objMapDrawer
	array_push(global.__objectDepths, 0); // objEddie
	array_push(global.__objectDepths, -3); // objBeat
	array_push(global.__objectDepths, 0); // objAchievementBox
	array_push(global.__objectDepths, 0); // prtAchievement
	array_push(global.__objectDepths, 0); // objTimeLordAchievement
	array_push(global.__objectDepths, 0); // objPentawerAchievement
	array_push(global.__objectDepths, 0); // objEnergyBalancerAchievement
	array_push(global.__objectDepths, 0); // objPowerGeneratorAchievement
	array_push(global.__objectDepths, 0); // objDevilSlayerAchievement
	array_push(global.__objectDepths, 0); // objLudditeAchievement
	array_push(global.__objectDepths, 0); // objJusticeAchievement


	global.__objectNames = [];
	array_push(global.__objectNames, "objSolid");
	array_push(global.__objectNames, "objIce");
	array_push(global.__objectNames, "objTopSolid");
	array_push(global.__objectNames, "objLadder");
	array_push(global.__objectNames, "objSpike");
	array_push(global.__objectNames, "objWater");
	array_push(global.__objectNames, "prtCollision");
	array_push(global.__objectNames, "objGlobalControl");
	array_push(global.__objectNames, "objGlobalInit");
	array_push(global.__objectNames, "prtPlayer");
	array_push(global.__objectNames, "objMegaman");
	array_push(global.__objectNames, "objProtoman");
	array_push(global.__objectNames, "prtWeapon");
	array_push(global.__objectNames, "prtPlayerProjectile");
	array_push(global.__objectNames, "prtShieldWeapon");
	array_push(global.__objectNames, "objReflectedProjectile");
	array_push(global.__objectNames, "objBusterShot");
	array_push(global.__objectNames, "objBusterShotHalfCharged");
	array_push(global.__objectNames, "objBusterShotCharged");
	array_push(global.__objectNames, "objMegaBusterWeapon");
	array_push(global.__objectNames, "objProtoBusterShotHalfCharged");
	array_push(global.__objectNames, "objProtoBusterShotCharged");
	array_push(global.__objectNames, "objProtoBusterWeapon");
	array_push(global.__objectNames, "objMetalBlade");
	array_push(global.__objectNames, "objMetalBladeWeapon");
	array_push(global.__objectNames, "objNeedleCannon");
	array_push(global.__objectNames, "objNeedleCannonWeapon");
	array_push(global.__objectNames, "objPharaohShotCharging");
	array_push(global.__objectNames, "objPharaohShot");
	array_push(global.__objectNames, "objPharaohShotCharged");
	array_push(global.__objectNames, "objPharaohShotWeapon");
	array_push(global.__objectNames, "objDrillBombWeapon");
	array_push(global.__objectNames, "objDrillBomb");
	array_push(global.__objectNames, "objDrillBombExplosion");
	array_push(global.__objectNames, "objStarCrash");
	array_push(global.__objectNames, "objStarCrashWeapon");
	array_push(global.__objectNames, "objChargeKick");
	array_push(global.__objectNames, "objChargeKickWeapon");
	array_push(global.__objectNames, "objSilverTomahawk");
	array_push(global.__objectNames, "objSilverTomahawkWeapon");
	array_push(global.__objectNames, "objWindStorm");
	array_push(global.__objectNames, "objWindStormWeapon");
	array_push(global.__objectNames, "objCentaurFlash");
	array_push(global.__objectNames, "objCentaurFlashWeapon");
	array_push(global.__objectNames, "objHornetChaserWeapon");
	array_push(global.__objectNames, "objHornetChaser");
	array_push(global.__objectNames, "prtRush");
	array_push(global.__objectNames, "objRushCoil");
	array_push(global.__objectNames, "objRushCoilWeapon");
	array_push(global.__objectNames, "objRushJet");
	array_push(global.__objectNames, "objRushJetWeapon");
	array_push(global.__objectNames, "objTimeSlowWeapon");
	array_push(global.__objectNames, "objTimeSlow");
	array_push(global.__objectNames, "objMegamanSweat");
	array_push(global.__objectNames, "objMegamanExplosion");
	array_push(global.__objectNames, "objGuardPowerUpEffect");
	array_push(global.__objectNames, "objHealthWeaponBar");
	array_push(global.__objectNames, "objMegamanDeathTimer");
	array_push(global.__objectNames, "objFadeIn");
	array_push(global.__objectNames, "objFadeout");
	array_push(global.__objectNames, "objMM1Met");
	array_push(global.__objectNames, "objSuzi");
	array_push(global.__objectNames, "objBeak");
	array_push(global.__objectNames, "objPicketMan");
	array_push(global.__objectNames, "objScrewBomber");
	array_push(global.__objectNames, "objBigEye");
	array_push(global.__objectNames, "objGabyoall");
	array_push(global.__objectNames, "objMM1MetBullet");
	array_push(global.__objectNames, "objBeakBullet");
	array_push(global.__objectNames, "objPicket");
	array_push(global.__objectNames, "objMM2Baton");
	array_push(global.__objectNames, "objTelly");
	array_push(global.__objectNames, "objFanFiend");
	array_push(global.__objectNames, "objSniperJoe");
	array_push(global.__objectNames, "objMM2Bullet");
	array_push(global.__objectNames, "objPoleEgg");
	array_push(global.__objectNames, "objPole");
	array_push(global.__objectNames, "objDestructibleWall");
	array_push(global.__objectNames, "objBBitter");
	array_push(global.__objectNames, "objOctoper");
	array_push(global.__objectNames, "objOctoShot");
	array_push(global.__objectNames, "objColton");
	array_push(global.__objectNames, "objColtonBullet");
	array_push(global.__objectNames, "prtEnemy");
	array_push(global.__objectNames, "prtEnemyProjectile");
	array_push(global.__objectNames, "objEnemyActionArea");
	array_push(global.__objectNames, "objEnemySpawnArea");
	array_push(global.__objectNames, "objEnemyWindStorm");
	array_push(global.__objectNames, "prtMiniBoss");
	array_push(global.__objectNames, "objBossControl");
	array_push(global.__objectNames, "objArenaStartingPoint");
	array_push(global.__objectNames, "objBossDoor");
	array_push(global.__objectNames, "objBossDoorH");
	array_push(global.__objectNames, "objPharaoh");
	array_push(global.__objectNames, "objPharaohManShot");
	array_push(global.__objectNames, "objPharaohManShotBig");
	array_push(global.__objectNames, "prtBoss");
	array_push(global.__objectNames, "objBossDeathTimer");
	array_push(global.__objectNames, "objAbsorbEffect");
	array_push(global.__objectNames, "prtFortressBoss");
	array_push(global.__objectNames, "objBossShadow");
	array_push(global.__objectNames, "objYellowDevil");
	array_push(global.__objectNames, "objYellowDevilBlock");
	array_push(global.__objectNames, "objYellowDevilBullet");
	array_push(global.__objectNames, "objWilyMachine4");
	array_push(global.__objectNames, "objWilyMachine4Shot");
	array_push(global.__objectNames, "objWilyMachine4Smoke");
	array_push(global.__objectNames, "objWilyPod4");
	array_push(global.__objectNames, "objWilyCapsule1");
	array_push(global.__objectNames, "objWilyCapsuleEnergy");
	array_push(global.__objectNames, "objWilyCapsuleShot");
	array_push(global.__objectNames, "objDrWily");
	array_push(global.__objectNames, "objBigEyeBoss");
	array_push(global.__objectNames, "prtPickup");
	array_push(global.__objectNames, "objLifeEnergySmall");
	array_push(global.__objectNames, "objLifeEnergyBig");
	array_push(global.__objectNames, "objWeaponEnergySmall");
	array_push(global.__objectNames, "objWeaponEnergyBig");
	array_push(global.__objectNames, "objETank");
	array_push(global.__objectNames, "objWTank");
	array_push(global.__objectNames, "objMTank");
	array_push(global.__objectNames, "objSTank");
	array_push(global.__objectNames, "objLife");
	array_push(global.__objectNames, "objScrewSmall");
	array_push(global.__objectNames, "objScrewBig");
	array_push(global.__objectNames, "objEnergyBalancer");
	array_push(global.__objectNames, "objYashichi");
	array_push(global.__objectNames, "objPlateT");
	array_push(global.__objectNames, "objPlateI");
	array_push(global.__objectNames, "objPlateM");
	array_push(global.__objectNames, "objPlateE");
	array_push(global.__objectNames, "prtGimmick");
	array_push(global.__objectNames, "prtSolidGimmick");
	array_push(global.__objectNames, "prtMovingPlatformJumpthrough");
	array_push(global.__objectNames, "prtMovingPlatformSolid");
	array_push(global.__objectNames, "objYokuBlock");
	array_push(global.__objectNames, "objSpawner");
	array_push(global.__objectNames, "objShake");
	array_push(global.__objectNames, "objTeleport");
	array_push(global.__objectNames, "objTellySpawner");
	array_push(global.__objectNames, "objMM2Conveyor");
	array_push(global.__objectNames, "objWind");
	array_push(global.__objectNames, "objSparkmanPlatform");
	array_push(global.__objectNames, "objSparkmanPlatformStop");
	array_push(global.__objectNames, "objDropPlatform");
	array_push(global.__objectNames, "objJunkBlockSpawner");
	array_push(global.__objectNames, "prtScenery");
	array_push(global.__objectNames, "objMM3Teleporter");
	array_push(global.__objectNames, "objMovingPlatformTest");
	array_push(global.__objectNames, "objMovingPlatformJumpthroughTest");
	array_push(global.__objectNames, "objCheckpoint");
	array_push(global.__objectNames, "objJunkBlock");
	array_push(global.__objectNames, "prtDestructibleBlock");
	array_push(global.__objectNames, "objDustBlock");
	array_push(global.__objectNames, "objAutoScroll");
	array_push(global.__objectNames, "objMusicPlayer");
	array_push(global.__objectNames, "prtEffect");
	array_push(global.__objectNames, "objExplosion");
	array_push(global.__objectNames, "objItemExplosion");
	array_push(global.__objectNames, "objSlideDust");
	array_push(global.__objectNames, "objSplash");
	array_push(global.__objectNames, "objSplashH");
	array_push(global.__objectNames, "objAirBubble");
	array_push(global.__objectNames, "objDmgText");
	array_push(global.__objectNames, "objFlash");
	array_push(global.__objectNames, "objExplosion4");
	array_push(global.__objectNames, "objPauseMenu");
	array_push(global.__objectNames, "objPassMenu");
	array_push(global.__objectNames, "objPassInput");
	array_push(global.__objectNames, "objWeaponGet");
	array_push(global.__objectNames, "objStageSelect");
	array_push(global.__objectNames, "objIntroduction");
	array_push(global.__objectNames, "objDisclaimer");
	array_push(global.__objectNames, "objTitleScreen");
	array_push(global.__objectNames, "objShop");
	array_push(global.__objectNames, "objMainMenu");
	array_push(global.__objectNames, "objKeyConfig");
	array_push(global.__objectNames, "objJoyConfig");
	array_push(global.__objectNames, "objLoadGame");
	array_push(global.__objectNames, "objSaveGame");
	array_push(global.__objectNames, "objPlayerSelect");
	array_push(global.__objectNames, "objAchievements");
	array_push(global.__objectNames, "objSectionBorderLeftScreen");
	array_push(global.__objectNames, "objSectionBorderRightScreen");
	array_push(global.__objectNames, "objSectionBorderVertical");
	array_push(global.__objectNames, "objSectionScrollLeft");
	array_push(global.__objectNames, "objSectionScrollRight");
	array_push(global.__objectNames, "objSectionBorderTopScreen");
	array_push(global.__objectNames, "objSectionBorderBottomScreen");
	array_push(global.__objectNames, "objSectionBorderHorizontal");
	array_push(global.__objectNames, "objSectionScrollUp");
	array_push(global.__objectNames, "objSectionScrollDown");
	array_push(global.__objectNames, "objSectionBorderLeft");
	array_push(global.__objectNames, "objSectionBorderRight");
	array_push(global.__objectNames, "objSectionBorderTop");
	array_push(global.__objectNames, "objSectionBorderBottom");
	array_push(global.__objectNames, "objSectionArrowLeft");
	array_push(global.__objectNames, "objSectionArrowRight");
	array_push(global.__objectNames, "objSectionArrowUp");
	array_push(global.__objectNames, "objSectionArrowDown");
	array_push(global.__objectNames, "objSectionSwitcher");
	array_push(global.__objectNames, "prtEquip");
	array_push(global.__objectNames, "objLifeEquip");
	array_push(global.__objectNames, "objETankEquip");
	array_push(global.__objectNames, "objWTankEquip");
	array_push(global.__objectNames, "objSTankEquip");
	array_push(global.__objectNames, "objMTankEquip");
	array_push(global.__objectNames, "objEddieEquip");
	array_push(global.__objectNames, "objGuardPowerUpEquip");
	array_push(global.__objectNames, "objExitEquip");
	array_push(global.__objectNames, "objShockGuardEquip");
	array_push(global.__objectNames, "objBeatEquip");
	array_push(global.__objectNames, "objEnergyBalancerEquip");
	array_push(global.__objectNames, "objPowerGeneratorEquip");
	array_push(global.__objectNames, "objHiSpeedChargeEquip");
	array_push(global.__objectNames, "prtPlateEquip");
	array_push(global.__objectNames, "objPlateTEquip");
	array_push(global.__objectNames, "objPlateIEquip");
	array_push(global.__objectNames, "objPlateMEquip");
	array_push(global.__objectNames, "objPlateEEquip");
	array_push(global.__objectNames, "objText");
	array_push(global.__objectNames, "prtCutscene");
	array_push(global.__objectNames, "objOpening");
	array_push(global.__objectNames, "objWilyUFO");
	array_push(global.__objectNames, "objCredits");
	array_push(global.__objectNames, "objFortress");
	array_push(global.__objectNames, "objFortressPoint");
	array_push(global.__objectNames, "objFortressTurnPoint");
	array_push(global.__objectNames, "objFortressPointStart");
	array_push(global.__objectNames, "objFortressUp");
	array_push(global.__objectNames, "objFortressDown");
	array_push(global.__objectNames, "objFortressRight");
	array_push(global.__objectNames, "objFortressLeft");
	array_push(global.__objectNames, "objFortressSpot");
	array_push(global.__objectNames, "objMapDrawer");
	array_push(global.__objectNames, "objEddie");
	array_push(global.__objectNames, "objBeat");
	array_push(global.__objectNames, "objAchievementBox");
	array_push(global.__objectNames, "prtAchievement");
	array_push(global.__objectNames, "objTimeLordAchievement");
	array_push(global.__objectNames, "objPentawerAchievement");
	array_push(global.__objectNames, "objEnergyBalancerAchievement");
	array_push(global.__objectNames, "objPowerGeneratorAchievement");
	array_push(global.__objectNames, "objDevilSlayerAchievement");
	array_push(global.__objectNames, "objLudditeAchievement");
	array_push(global.__objectNames, "objJusticeAchievement");


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
