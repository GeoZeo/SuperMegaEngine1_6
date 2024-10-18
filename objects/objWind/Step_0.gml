event_inherited();

if !global.frozen && insideView() {
    if affectItems {
        with prtPickup {
            if insideView() {
                x += other.xspeed * other.update_rate;
                y += other.yspeed * other.update_rate;
                xspeed += other.xspeed;
                yspeed += other.yspeed;
                checkGround();
                gravityCheckGround();
                generalCollision();
                xspeed -= other.xspeed;
                yspeed -= other.yspeed;
            }
        }
    }
    if affectEnemies {
        with prtEnemy {
            if !dead && insideView() && object_get_parent(object_index) != prtBoss {
                x += other.xspeed * other.update_rate;
                y += other.yspeed * other.update_rate;
                xspeed += other.xspeed;
                yspeed += other.yspeed;
                checkGround();
                gravityCheckGround();
                generalCollision();
                xspeed -= other.xspeed;
                yspeed -= other.yspeed;
            }
        }
    }
    if affectBosses {
        with prtBoss {
            if !dead && insideView() {
                x += other.xspeed * other.update_rate;
                y += other.yspeed * other.update_rate;
                xspeed += other.xspeed;
                yspeed += other.yspeed;
                checkGround();
                gravityCheckGround();
                generalCollision();
                xspeed -= other.xspeed;
                yspeed -= other.yspeed;
            }
        }
    }
    if affectProjectiles {
        with prtEnemyProjectile {
            if insideView() {
                x += other.xspeed * other.update_rate;
                y += other.yspeed * other.update_rate;
            }
        }
    }
    if affectPlayer && !playerTeleporting && instance_exists(prtPlayer) && !prtPlayer.climbing
	&& (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) {
        with prtPlayer {
            if !place_meeting(x + other.xspeed, y + other.yspeed, objSolid) && !place_meeting(x + other.xspeed, y + other.yspeed, prtMovingPlatformSolid){
                
				if !ground
					other.xforce = 0;
				else {
					if !place_meeting(x, y+1, objIce) or abs(iceAcc) >= abs(walkSpeed)
						other.xforce = other.xspeed * other.update_rate;
					else
						other.xforce = (other.xspeed * other.update_rate) / (abs(walkSpeed) / abs(iceAcc));
						
				}
				
				other.currentXforce += other.xforce;
				if abs(other.currentXforce) >= abs(other.xspeed * other.update_rate) || !ground || (!place_meeting(x, y+1, objIce) or abs(iceAcc) >= abs(walkSpeed))
					other.currentXforce = other.xspeed * other.update_rate;
				
				x += other.currentXforce;
                y += other.yspeed * other.update_rate;
                //playerStep();
                global.xspeed += other.currentXforce;
                global.yspeed += other.yspeed * other.update_rate;
                playerCollision();
                playerMovingPlatform();
                playerCamera();
                global.xspeed -= other.currentXforce;
                global.yspeed -= other.yspeed * other.update_rate;
                
                //playerSwitchSections();
            }
        }
    }
}

