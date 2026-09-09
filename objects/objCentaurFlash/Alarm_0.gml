if global.frozen {
	with prtEnemy {
	    if projCanTouch && damage[objCentaurFlash] != 0 && !dead && !dying && canHit && !reflectProjectiles && ((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite)) {
	        healthpoints -= damage[objCentaurFlash];
	        check_enemy_death();
	    }    
	}
}

global.frozen = false;
with prtPlayer canPause = true;

with backShader instance_destroy();
with backShaderReset instance_destroy();
with frontShader instance_destroy();
with frontShaderReset instance_destroy();

instance_destroy();

