if !dead {
	with other {
		if canHit {  
	        playerGetHit(other.contactDamage);
	        other.moveTimer = 0;
	        other.retreating = true;
	        other.yspeed = -3;
	    }
	}
}

