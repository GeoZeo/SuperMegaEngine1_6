if !dead && !dying {
	with other {
		if canHit && other.playerCanTouch {  
	        playerGetHit(other.contactDamage, false);
	    }
	}
}

