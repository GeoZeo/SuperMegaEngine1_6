if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

timer++;
if timer >= 30 timer = 0;

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
			timer = 0;
			playSFX(sfxMenuMove);
			as_timer = as_rate;
			as_init_timer = 0;
		}
    }
    else if global.keyDownPressed || global.keySelectPressed {
		if !surePhase {
			selected++;
		    if selected >= num_menu_items {
		        selected = 0;
		    }
			timer = 0;
			playSFX(sfxMenuMove);
			as_timer = as_rate;
			as_init_timer = 0;
		}
		else if global.keySelectPressed {
			isSure = !isSure;
			timer = 0;
			playSFX(sfxMenuMove);
			as_timer = as_rate;
			as_init_timer = 0;
		}
    }
	else if global.keyLeftPressed || global.keyRightPressed {
		if surePhase {
			isSure = !isSure;
			timer = 0;
			playSFX(sfxMenuMove);
			as_timer = as_rate;
			as_init_timer = 0;
		}
    }
	if cfgEnableDelayedAutoShifting {
		if global.keyUp {
			if !surePhase {
				as_init_timer++;
				if as_init_timer >= as_delay {
					as_init_timer = as_delay;
					as_timer++;
					if as_timer >= as_rate {
						selected--;
					    if selected < 0 {
					        selected = num_menu_items - 1;
					    }
						timer = 0;
						playSFX(sfxMenuMove);
					
						as_timer = 0;
					}
				}
			}
	    }
	    else if global.keyDown || global.keySelect {
			if !surePhase {
				as_init_timer++;
				if as_init_timer >= as_delay {
					as_init_timer = as_delay;
					as_timer++;
					if as_timer >= as_rate {
						selected++;
					    if selected >= num_menu_items {
					        selected = 0;
					    }
						timer = 0;
						playSFX(sfxMenuMove);
					
						as_timer = 0;
					}
				}
			}
			else if global.keySelect {
				as_init_timer++;
				if as_init_timer >= as_delay {
					as_init_timer = as_delay;
					as_timer++;
					if as_timer >= as_rate {
						isSure = !isSure;
						timer = 0;
						playSFX(sfxMenuMove);
					
						as_timer = 0;
					}
				}
			}
	    }
		else if global.keyLeft || global.keyRight {
			if surePhase {
				as_init_timer++;
				if as_init_timer >= as_delay {
					as_init_timer = as_delay;
					as_timer++;
					if as_timer >= as_rate {
						isSure = !isSure;
						timer = 0;
						playSFX(sfxMenuMove);
					
						as_timer = 0;
					}
				}
			}
	    }
	}
	if global.keyShootPressed {
		if !surePhase {
			if selected != num_menu_items - 1 {
				selected = num_menu_items - 1;
				timer = 0;
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
			timer = 0;
			surePhase = false;
		}
		as_timer = as_rate;
		as_init_timer = 0;
	}
    else if global.keyPausePressed || global.keyJumpPressed {
		as_timer = as_rate;
		as_init_timer = 0;
		if surePhase && !isSure {
			surePhase = false;
			timer = 0;
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
					timer = 0;
					playSFX(sfxMenuSelect3);
	                break;
	            case "BACK":
	                playSFX(sfxMenuSelect);            
	                var ID = instance_create(0, 0, objFadeout);
	                ID.type = "room";
	                ID.myRoom = rmMainMenu;
	                break;
	            default:
					timer = 0;
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
		timer = 0;
        waiting = false;
		as_timer = as_rate;
		as_init_timer = 0;
        save_configs();
    }
}

