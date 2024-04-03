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
    if affectPlayer && instance_exists(prtPlayer) && !prtPlayer.climbing {
        with prtPlayer {
            if !place_meeting(x + other.xspeed, y + other.yspeed, objSolid) && !place_meeting(x + other.xspeed, y + other.yspeed, prtMovingPlatformSolid){
                x += other.xspeed * other.update_rate;
                y += other.yspeed * other.update_rate;
                //playerStep();
                global.xspeed += other.xspeed * other.update_rate;
                global.yspeed += other.yspeed * other.update_rate;
                playerCollision();
                playerMovingPlatform();
                playerCamera();
                global.xspeed -= other.xspeed * other.update_rate;
                global.yspeed -= other.yspeed * other.update_rate;
                
                //playerSwitchSections();
            }
        }
    }
}

