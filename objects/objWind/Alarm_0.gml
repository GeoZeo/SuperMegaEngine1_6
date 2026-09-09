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
//				other.currentXforce = other.xspeed * other.update_rate;
				
//			//x_force += other.currentXforce;
//	        //y_force += other.yspeed * other.update_rate;
				
//			var _xadd = other.currentXforce;
//			var _yadd = other.yspeed * other.update_rate;
			
//			x_force += _xadd;
//	        y_force += _yadd;
//		}
//	}
//}
			

