/// @description  onCharging
if !cfgEnableCharge exit;

event_inherited();

if !prtPlayer.isShoot || (instance_exists(objSectionSwitcher) and cfgChargeWhileLocked) {
	if (prtPlayer.canMove || prtPlayer.isSlide || prtPlayer.climbing
	|| (prtPlayer.locked and cfgChargeWhileLocked)) && (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) {
		
		if prtPlayer.isShoot && (instance_exists(objSectionSwitcher) and cfgChargeWhileLocked)
			prtPlayer.shootTimer++;
		
		if !prtPlayer.isShoot || prtPlayer.shootTimer >= 20 {
			prtPlayer.isCharge = true;
    
		    if !prtPlayer.isSlide or cfgBeginChargeOnSlide
		        initChargeTimer += 1;
        
		    if initChargeTimer >= initChargeTime {
		
				if !prtPlayer.isSlide or cfgContinueChargeMidSlide
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
            var chargeTimeDiv, chargeCol;
            chargeTimeDiv = round(chargeAnimTime / 3);
			
			if (prtPlayer.isSlide and !cfgContinueChargeMidSlide) || ((prtPlayer.locked or instance_exists(objSectionSwitcher)) and cfgContinueChargeAnimWhileLocked) {
				if (chargeAnimTimer >= chargeTimeDiv and chargeTimer < chargeTimeDiv) || (chargeAnimTimer >= chargeTimeDiv * 2 and chargeTimer < chargeTimeDiv * 2)
					chargeAnimTimer = chargeTimer - (chargeAnimTimer mod 4);
			}

            if chargeAnimTimer < chargeTimeDiv
                chargeCol = outlineChargeCol1;     //Dark red
            else if chargeAnimTimer < chargeTimeDiv * 2
                chargeCol = outlineChargeCol2;     //Red (dark pink)
            else
                chargeCol = outlineChargeCol3;   //Light red (pink)
                
            if (chargeAnimTimer mod 4 == 0 or chargeAnimTimer mod 4 == 1) && chargeAnimTimer != 0
                global.outlineCol = chargeCol;
            else 
                global.outlineCol = c_black;
        }
        else {
            if chargeTimer == ceil(chargeTime) {
                stopSFX(chargeSFX);
				if prtPlayer.playChargedSound {
					
					if cfgFadeOutChargedSound
						playSFX(chargedSFX);
					else
						loopSFX(chargedSFX);
						
					prtPlayer.playChargedSound = false;
				}
            }
            
            switch (chargeAnimTimer/2 mod 3) {
                case 0: //Light blue helmet, black shirt, blue outline
                    global.primaryCol = chargeCol1
                    global.secondaryCol = c_black;
                    global.outlineCol = chargeCol2;
                break;
                
                case 1: //Black helmet, blue shirt, light blue outline
                    global.primaryCol = c_black;
                    global.secondaryCol = chargeCol2;
                    global.outlineCol = chargeCol1;
                break;
                
                case 2: //Blue helmet, light blue shirt, blue outline
                    global.primaryCol = chargeCol2;
                    global.secondaryCol = chargeCol1;
                    global.outlineCol = c_black;
                break;
            }
        }
    }
}

