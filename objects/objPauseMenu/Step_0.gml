switch phase {
    case 0: //Fading in
        blackAlphaTimer++;
        if blackAlphaTimer >= blackAlphaTimerMax {
            blackAlphaTimer = 0;
            blackAlpha += blackAlphaIncrease;
            if blackAlpha >= 1
                phase = 1;
        }
    break;
    
    case 1: //Fading out
        event_user(0); //Moving the selection
            
        blackAlphaTimer++;
        if blackAlphaTimer >= blackAlphaTimerMax {
            blackAlphaTimer = 0;
            blackAlpha -= blackAlphaIncrease;
            if blackAlpha <= 0
                phase = 2;
        }
    break;
    
    case 2: //Idle
        event_user(0); //Moving the selection
            
        
        //Select the weapon/tank
        if global.keyJumpPressed || global.keyPausePressed || global.keyShootPressed {
            if option < global.totalWeapons {   //Selected a weapon             
                global.currentWeapon = option;
                with prtPlayerProjectile if ((destroyOnSwitch and other.oldWeapon != other.option) or destroyOnPause) instance_destroy();
                with objReflectedProjectile instance_destroy();
                with prtRush instance_destroy();
                with objRushJet instance_destroy(); //Could not be parented to prtRush since it's parented to prtMovingPlatformSolid
                with prtPlayer {
                    if onRushJet {
                        onRushJet = false;
						canWalk = true;
                    }
                }
                
                // If an item hasn't been primed for use, transition to phase 3.
                if (primedItemIndex == -1) {
                    if global.currentWeapon != oldWeapon {
                        with global.weapons[global.currentWeapon] event_user(0);
                    }
                    playSFX(sfxMenuSelect);
                    phase = 3;
                }
                // Otherwise, transition to phase 5.
                else {
                    global.items[primedItemIndex].using = true;
                    global.items[primedItemIndex].useOnIndex = option;
                    option = 99;
                    phase = 5;
                }
            }
            else {  //Selected an item
                item_index = option - global.totalWeapons;
                
                // If the item selected was already primed, unprime it.
                if (item_index == primedItemIndex) {
                    with global.items[item_index] event_user(3);    //Unprime item.
                    primedItemIndex = -1;
                }
                else if (primedItemIndex == -1) {                    
                    with global.items[item_index] event_user(0);    //Activate item
                    if global.items[item_index].ok {
                        // If this flag is true, it means that this item will need to be used on a weapon/util.
                        if (global.items[item_index].useOnWeapon) {
                            global.currentWeapon = global.defaultWeapon.ID;
                            primedItemIndex = item_index;
                            option = 0;
                        }
                        else {
                            option = 99;
                            phase = 5;
                            primedItemIndex = -1;
                        }
                    }
                }
                else {
                    playSFX(sfxError);
                }
            }
        }
    break;
    
    case 3: //Fading out
        blackAlphaTimer++;
        if blackAlphaTimer >= blackAlphaTimerMax {
            blackAlphaTimer = 0;
            blackAlpha += blackAlphaIncrease;
            if blackAlpha >= 1 {
                phase = 4;
                if resetWeapon {
                    global.weapon = oldWeapon;
                    with prtPlayer event_user(0);
                }
				////Properly updates MM's animations when switching weapons while in the shooting/throwing pose. Made to match how it looks in MM9 and MM10.
				if prtPlayer.isShoot || prtPlayer.isThrow {
					if global.weapons[global.currentWeapon].bThrow {
						with prtPlayer {
							if !isSlide && !isHit && !teleporting {
								isThrow = true;
								isShoot = false;
							}
						}
					}
					else {
						with prtPlayer {
							if !isSlide && !isHit && !teleporting {
								isShoot = true;
								isThrow = false;
							}
						}
					}
				}

				with prtPlayer {
					if isThrow {
						if !global.weapons[global.currentWeapon].freeShot {
							if ground && !climbing && !isSlide && !isHit && !teleporting {
								canWalk = false;
								global.xspeed = 0;
							}
							else if !ground && !climbing && !isSlide && !isHit && !teleporting  {
								canWalk = true;
								canSpriteChange = true;
							}
						}
					}
					else
					{
						if ground && !isSlide && !isHit && !teleporting {
							canWalk = true;
							canSpriteChange = true;
						}
					}
				}
				////
            }
        }
    break;
    
    case 4: //Fading in
        blackAlphaTimer++;
        if blackAlphaTimer >= blackAlphaTimerMax {
            blackAlphaTimer = 0;
            blackAlpha -= blackAlphaIncrease;
            if blackAlpha <= 0 {
                global.frozen = false;
                instance_destroy();
            }
        }
    break;
    
    case 5: //Using item
        if !global.items[item_index].using {
            phase = 2;
            option = oldWeapon;
            global.weapon = oldWeapon;
            primedItemIndex = -1;
            with prtPlayer event_user(0);
        }
    break;
}

