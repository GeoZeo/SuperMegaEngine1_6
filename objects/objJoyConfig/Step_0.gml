if (instance_exists(objFadeout)) exit;

key[0] = global.leftButton;
key[1] = global.rightButton;
key[2] = global.upButton;
key[3] = global.downButton;
key[4] = global.jumpButton;
key[5] = global.shootButton;
key[6] = global.weaponSwitchLeftButton;
key[7] = global.weaponSwitchRightButton;
key[8] = global.pauseButton;
key[9] = global.selectButton;
key[10] = global.slideButton;

if !waiting {
    if global.keyUpPressed {
		if !surePhase {
			selected--;
		    if selected < 0 {
		        selected = num_menu_items - 1;
		    }
		}
        playSFX(sfxMenuMove);
    }
    else if global.keyDownPressed || global.keySelectPressed {
		if !surePhase {
			selected++;
		    if selected >= num_menu_items {
		        selected = 0;
		    }
		}
		else if global.keySelectPressed {
			isSure = !isSure;
		}
        playSFX(sfxMenuMove);
    }
	else if global.keyLeftPressed || global.keyRightPressed {
		if surePhase {
			isSure = !isSure;
			playSFX(sfxMenuMove);
		}
    }
	if global.keyShootPressed {
		if !surePhase {
			if selected != num_menu_items - 1 {
				selected = num_menu_items - 1;
				playSFX(sfxMenuMove);
			}
			else {
				var ID = instance_create(0, 0, objFadeout);
	            ID.type = "room";
	            ID.myRoom = rmMainMenu;
			}
		}
		else {
			playSFX(sfxMenuSelect);
			surePhase = false;
		}
	}
    else if global.keyPausePressed || global.keyJumpPressed {
		if surePhase && !isSure {
			surePhase = false;
			playSFX(sfxMenuSelect3);
		}
		else {
	        switch menu[selected] {
	            case "RESET":
					if surePhase {
		                reset_buttons();
		                save_configs();
						surePhase = false;
					}
					else {
						surePhase = true;
						isSure = false;
					}
					playSFX(sfxMenuSelect3);
	                break;
	            case "BACK":
	                playSFX(sfxMenuSelect);            
	                var ID = instance_create(0, 0, objFadeout);
	                ID.type = "room";
	                ID.myRoom = rmMainMenu;
	                break;
	            default:
	                playSFX(sfxMenuSelect3);
	                waiting = true;
	        }
		}
    }
}
else {  //Set button
    var button = gamepad_button_check_pressed_all();
    if button != false {
        switch selected {
            case 0: global.leftButton = button; key[0] = global.leftButton; break;
            case 1: global.rightButton = button; key[1] = global.rightButton; break;
            case 2: global.upButton = button; key[2] = global.upButton; break;
            case 3: global.downButton = button; key[3] = global.downButton; break;
            case 4: global.jumpButton = button; key[4] = global.jumpButton; break;
            case 5: global.shootButton = button; key[5] = global.shootButton; break;
            case 6: global.weaponSwitchLeftButton = button; key[6] = global.weaponSwitchLeftButton; break;
            case 7: global.weaponSwitchRightButton = button; key[7] = global.weaponSwitchRightButton; break;
            case 8: global.pauseButton = button; key[8] = global.pauseButton; break;
            case 9: global.selectButton = button; key[9] = global.selectButton; break;
            case 10: global.slideButton = button; key[10] = global.slideButton; break;
        }
        waiting = false;
        save_configs();
    }
}

