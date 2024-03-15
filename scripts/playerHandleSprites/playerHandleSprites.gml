/// @description playerHandleSprites()
function playerHandleSprites() {
	//Handles the player's sprites, e.g. use different sprites when shooting
	//Note that some sprites like sliding are static and are thus not altered in this script
	if !instance_exists(global.character) exit;

	spriteStandDefault = asset_get_index("spr" + global.character.sprName + "Stand");
	spriteStepDefault = asset_get_index("spr" + global.character.sprName + "Step");
	spriteJumpDefault = asset_get_index("spr" + global.character.sprName + "Jump");
	spriteWalkDefault = asset_get_index("spr" + global.character.sprName + "Walk");
	spriteClimbDefault = asset_get_index("spr" + global.character.sprName + "Climb");
	spriteGetupDefault = asset_get_index("spr" + global.character.sprName + "ClimbGetup");

	if isShoot {
	    spriteStand = asset_get_index("spr" + global.character.sprName + "StandShoot");
	    spriteStep = asset_get_index("spr" + global.character.sprName + "StandShoot");
	    spriteJump = asset_get_index("spr" + global.character.sprName + "JumpShoot");
	    spriteWalk = asset_get_index("spr" + global.character.sprName + "WalkShoot");
	    spriteClimb = asset_get_index("spr" + global.character.sprName + "ClimbShoot");
	    spriteGetup = asset_get_index("spr" + global.character.sprName + "ClimbShoot");
		
		speedStand = speedStandShoot;
		speedStep = speedStepShoot;
		speedWalk = speedWalkShoot;
		speedJump = speedJumpShoot;
		speedClimb = speedClimbShoot;
		speedGetup = speedGetupShoot;
	}
	else if isThrow {
	    spriteStand = asset_get_index("spr" + global.character.sprName + "StandThrow");
	    spriteStep = asset_get_index("spr" + global.character.sprName + "StandThrow");
	    spriteJump = asset_get_index("spr" + global.character.sprName + "JumpThrow");
	    spriteWalk = asset_get_index("spr" + global.character.sprName + "WalkThrow");
	    spriteClimb = asset_get_index("spr" + global.character.sprName + "ClimbThrow");
	    spriteGetup = asset_get_index("spr" + global.character.sprName + "ClimbThrow");
		
		speedStand = speedStandThrow;
		speedStep = speedStepThrow;
		speedWalk = speedWalkThrow;
		speedJump = speedJumpThrow;
		speedClimb = speedClimbThrow;
		speedGetup = speedGetupThrow;
	}
	else {
	    spriteStand = asset_get_index("spr" + global.character.sprName + "Stand");
	    spriteStep = asset_get_index("spr" + global.character.sprName + "Step");
	    spriteJump = asset_get_index("spr" + global.character.sprName + "Jump");
	    spriteWalk = asset_get_index("spr" + global.character.sprName + "Walk");
	    spriteClimb = asset_get_index("spr" + global.character.sprName + "Climb");
	    spriteGetup = asset_get_index("spr" + global.character.sprName + "ClimbGetup");
		
		speedStand = speedStandDefault;
		speedStep = speedStepDefault;
		speedWalk = speedWalkDefault;
		speedJump = speedJumpDefault;
		speedClimb = speedClimbDefault;
		speedGetup = speedGetupDefault;
	}



}
