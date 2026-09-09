event_inherited();

if !global.frozen && insideView() {
    if affectItems {
        with prtPickup {
            if insideView() && ((!ground or other.affectItemsGround) and (ground or other.affectItemsAir)) {
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
            if !dead && insideView() && ((!ground or other.affectEnemiesGround) and (ground or other.affectEnemiesAir)) && object_get_parent(object_index) != prtBoss {
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
            if !dead && insideView() && ((!ground or other.affectBossesGround) and (ground or other.affectBossesAir)) {
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
    //if affectPlayer && !playerTeleporting && instance_exists(prtPlayer) && !prtPlayer.climbing
	//&& (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) {
    //    with prtPlayer {
	//		if ((!ground or other.affectPlayerGround) and (ground or other.affectPlayerAir)) {
			
	//			if !ground
	//				other.xforce = 0;
	//			else {
	//				if !place_meeting(x, y+1, objIce) or abs(iceAcc) >= abs(walkSpeed)
	//					other.xforce = other.xspeed * other.update_rate;
	//				else
	//					other.xforce = (other.xspeed * other.update_rate) / (abs(walkSpeed) / abs(iceAcc));
						
	//			}
				
	//			other.currentXforce += other.xforce;
	//			if abs(other.currentXforce) >= abs(other.xspeed * other.update_rate) || !ground || (!place_meeting(x, y+1, objIce) or abs(iceAcc) >= abs(walkSpeed))
	//				other.currentXforce = other.xspeed;
				
	//			var _xspeed = global.xspeed;
	//			var _yspeed = global.yspeed;
				
	//			var _xadd = other.currentXforce * other.update_rate;
	//			var _yadd = other.yspeed * other.update_rate;
				
	//			x_force += _xadd;
	//            y_force += _yadd;
			
	//            if !place_meeting(x + other.currentXforce, y + other.yspeed, objSolid) 
	//			&& (!place_meeting(x + other.currentXforce, y + other.yspeed, prtMovingPlatformSolid) or instance_place(x + other.currentXforce, y + other.yspeed, prtMovingPlatformSolid).dead) {
					
	//				playerRollbackSpeed();
	//				_xspeed = global.xspeed;
	//				_yspeed = global.yspeed;
					
	//				if rollbackMovement
	//				{
	//					if xDiff != -1000000
	//					{
	//						x -= xDiff;
	//						xDiff = -1000000;
	//					}
						
	//					var __old_x = x;
	//					var __old_y = y;
	//				}
					
	//				x += _xadd;
	//				y += _yadd;
	//				global.xspeed += _xadd;
	//				global.yspeed += _yadd;
	//                //playerStep();
	//				print(global.xspeed);
					
	//				if rollbackMovement //TODO: this needs looking at!!
	//				{
	//					//if ((global.xspeed > 0 and againstWallRight) || (global.xspeed < 0 and againstWallLeft))
	//					//{
	//					//	x = __old_x;
	//					//}
	//					//if ((global.yspeed > 0 and againstGround) || (global.yspeed < 0 and againstCeiling))
	//					//{
	//					//	y = __old_y;
	//					//}
						
	//					againstGround = false;
	//					againstWallLeft = false;
	//					againstWallRight = false;
	//					againstCeiling = false;
	//				}
					
	//				if !((instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)
	//				/*||...*/) //Add other conditions here (e.g: for Rush Jet Adaptor and/or Treble Boost maybe idk?).
	//				{
	//					//Default
	//					playerBorderCheck(true, true, false);
	//					beatCollision();
	//			        beatMovingPlatform();
	//		            playerCamera();
	//					playerCrush();
	//				}
	//				else
	//				{
	//					//Beat
	//					if instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime
	//					{
	//						playerBorderCheck(true, true, false);
	//						beatCollision();
	//			            beatMovingPlatform();
	//			            playerCamera();
	//						playerCrush();
	//					}
	//				}
					
	//				print(global.xspeed);
					
	//				if rollbackMovement && xspeedRollback != -1000000
	//					xspeedRollback -= _xadd;
	//				else
	//					xspeedRollback = -1000000;

	//				if (_xspeed + _xadd != 0 and global.xspeed == 0) or againstWallLeft or againstWallRight
	//				{
	//					other.currentXforce = 0;
	//					if !rollbackMovement
	//						_xspeed = 0;
	//					else
	//						_xspeed = global.xspeed - _xadd;
	//					print(againstWallRight);
	//				}
	//				else
	//				{
	//					_xspeed = global.xspeed - _xadd;
	//				}
					
	//                //playerSwitchSections();
	//            }
	//			else {
	//				other.currentXforce = 0;
	//			}
			
	//			playerSpikes();
	//			playerCollisionEnd();
			
	//			global.xspeed = _xspeed;
	//			global.yspeed = _yspeed;
	//			x_force -= _xadd;
	//            y_force -= _yadd;
	//			print(global.xspeed);
	//        }
	//		else {
	//			other.currentXforce = 0;
	//		}
	//	}
    //}
	//else {
	//	other.currentXforce = 0;
	//}
}

