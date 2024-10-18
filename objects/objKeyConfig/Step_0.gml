with (other) {
if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

timer++;
if timer >= 30 timer = 0;

key[0] = global.leftKey;
key[1] = global.rightKey;
key[2] = global.upKey;
key[3] = global.downKey;
key[4] = global.jumpKey;
key[5] = global.shootKey;
key[6] = global.weaponSwitchLeftKey;
key[7] = global.weaponSwitchRightKey;
key[8] = global.pauseKey;
key[9] = global.selectKey;
key[10] = global.slideKey;

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
			timer = 0;
			playSFX(sfxMenuSelect);
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
			            reset_keys();
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
	                keyboard_lastkey = -1;
	        }
		}
    }
}
else {  //Set key
    if keyboard_check_pressed(vk_anykey) and keyboard_lastkey != vk_escape {
        switch selected {
            case 0: global.leftKey = keyboard_lastkey; key[0] = global.leftKey; break;
            case 1: global.rightKey = keyboard_lastkey; key[1] = global.rightKey; break;
            case 2: global.upKey = keyboard_lastkey; key[2] = global.upKey; break;
            case 3: global.downKey = keyboard_lastkey; key[3] = global.downKey; break;
            case 4: global.jumpKey = keyboard_lastkey; key[4] = global.jumpKey; break;
            case 5: global.shootKey = keyboard_lastkey; key[5] = global.shootKey; break;
            case 6: global.weaponSwitchLeftKey = keyboard_lastkey; key[6] = global.weaponSwitchLeftKey; break;
            case 7: global.weaponSwitchRightKey = keyboard_lastkey; key[7] = global.weaponSwitchRightKey; break;
            case 8: global.pauseKey = keyboard_lastkey; key[8] = global.pauseKey; break;
            case 9: global.selectKey = keyboard_lastkey; key[9] = global.selectKey; break;
            case 10: global.slideKey = keyboard_lastkey; key[10] = global.slideKey; break;
        }
        print("PRESSED", keyboard_lastkey);
		timer = 0;
        waiting = false;
		as_timer = as_rate;
		as_init_timer = 0;
        save_configs();
    }
}

}
