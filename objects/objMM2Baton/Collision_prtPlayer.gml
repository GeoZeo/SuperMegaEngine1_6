if !dead {
	with other {
		if canHit && !instance_exists(objChargeKick) {  
	        playerGetHit(other.contactDamage, false);
	        other.moveTimer = 0;
	        other.retreating = true;
	        other.yspeed = -3;
			escapeWall(true, true, true, true);
	    }
	}
}

