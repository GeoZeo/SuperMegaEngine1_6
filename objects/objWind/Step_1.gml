if !global.frozen && insideView() {
	if affectPlayer && !playerTeleporting && instance_exists(prtPlayer) && !prtPlayer.climbing
	&& (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) {
	    with prtPlayer {
			if ((!ground or other.affectPlayerGround) and (ground or other.affectPlayerAir)) {
			
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
					other.currentXforce = other.xspeed;
				
				var _xadd = other.currentXforce * other.update_rate;
				var _yadd = other.yspeed * other.update_rate;
			
				//Adjust the offset for surface checks in case x-force (positive or negative) is less than the minimum collision check threshold (which is 0.5 (0.500005 for going left))
				var _xOff = 0;
				if other.currentXforce > 0 && other.currentXforce < 0.5
				{
					_xOff = 0.5 - other.currentXforce;
				}
				else if other.currentXforce < 0 && other.currentXforce > -0.500005
				{
					_xOff = -0.500005 - other.currentXforce;
				}
			
				var _near = (_xOff * place_meeting(x+sign(other.currentXforce), y, objSolid));
				var __near = (_xOff * (place_meeting(x+sign(other.currentXforce), y, prtMovingPlatformSolid) and !instance_place(x+sign(other.currentXforce), y, prtMovingPlatformSolid).dead));
			
				if !place_meeting(x + (global.xspeed + other.currentXforce) + _near, y + (global.yspeed + other.yspeed), objSolid) 
				&& (!place_meeting(x + (global.xspeed + other.currentXforce) + __near, y + (global.yspeed + other.yspeed), prtMovingPlatformSolid) or instance_place(x + (global.xspeed + other.currentXforce) + __near, y + (global.yspeed + other.yspeed), prtMovingPlatformSolid).dead) {
				
					global.xforce += _xadd;
					global.yforce += _yadd;
					
					print("Y: " + string(y));
	        
				}
				else {
					other.currentXforce = 0;
				}
		    }
			else {
				other.currentXforce = 0;
			}
		}
	}
	else {
		other.currentXforce = 0;
	}
}

