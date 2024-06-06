/// @description  onCharging
event_inherited();

if !prtPlayer.isShoot || (instance_exists(objSectionSwitcher) and cfgChargeWhileLocked) {
	if (prtPlayer.canMove || prtPlayer.isSlide || prtPlayer.climbing
	|| (prtPlayer.locked and cfgChargeWhileLocked)) && (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) {
		
		if prtPlayer.isShoot && (instance_exists(objSectionSwitcher) and cfgChargeWhileLocked)
			prtPlayer.shootTimer++;
			
		if !prtPlayer.isShoot || prtPlayer.shootTimer >= 20 {
			prtPlayer.isCharge = true;
    
		    if !prtPlayer.isSlide
		        initChargeTimer += 1;
        
		    if initChargeTimer >= initChargeTime {
		
				if !prtPlayer.isSlide
					chargeTimer += 1;
			}
		}
	}
			
	if initChargeTimer >= initChargeTime {
		
		chargeAnimTimer += 1;
        
        if chargeTimer == 1 && prtPlayer.playChargeSound {
            playSFX(chargeSFX);
			prtPlayer.playChargeSound = false;
		}
        
        if chargeTimer < chargeTime {
			var chargeTimeDiv, chargeInterval;
			chargeTimeDiv = round(chargeAnimTime / 3);
			
			if chargeAnimTimer < chargeTimeDiv
                chargeInterval = 4;
            else if chargeAnimTimer < chargeTimeDiv * 2
                chargeInterval = 3;
            else
                chargeInterval = 2;
			
            if round(chargeAnimTimer / chargeInterval) mod 2 == 0 && chargeAnimTimer != 0
                global.outlineCol = outlineChargeCol1;
            else
                global.outlineCol = c_black;
        }
        else {
            
            switch (chargeAnimTimer/2 mod 3) {
                case 0:
                    global.primaryCol = chargeCol1
                    global.secondaryCol = chargeCol2;
                    global.outlineCol = outlineChargeCol2;
                break;
                
                case 1:
                    global.primaryCol = primaryCol;
                    global.secondaryCol = secondaryCol;
                    global.outlineCol = outlineChargeCol1;
                break;

                case 2:
                    global.primaryCol = primaryCol;
                    global.secondaryCol = secondaryCol;
                    global.outlineCol = c_black;
                break;
            }
        }
    }
}

