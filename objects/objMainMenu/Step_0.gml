if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

timer++;
if timer >= 30 timer = 0;

if global.keyUpPressed {
    selected--;
    if selected < 0 {
        selected = num_menu_items - 1;
    }
	timer = 0;
    playSFX(sfxMenuMove);
	as_timer = as_rate;
	as_init_timer = 0;
}
else if global.keyDownPressed || global.keySelectPressed {
    selected++;
    if selected >= num_menu_items {
        selected = 0;
    }
	timer = 0;
    playSFX(sfxMenuMove);
	as_timer = as_rate;
	as_init_timer = 0;
}
if cfgEnableDelayedAutoShifting {
	if global.keyUp {
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
	else if global.keyDown || global.keySelect {
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
}
if global.keyShootPressed {
	switch menu[selected] {
        case "RETURN TO TITLE":
			var ID = instance_create(0, 0, objFadeout);
			ID.type = "room";
            ID.myRoom = rmTitleScreen;
			playSFX(sfxMenuSelect);
			break;
        default:
            selected = num_menu_items - 1;
			playSFX(sfxMenuMove);
			timer = 0;
			break;
    }
	as_timer = as_rate;
	as_init_timer = 0;
}
else if global.keyPausePressed || global.keyJumpPressed {
    as_timer = as_rate;
	as_init_timer = 0;
	playSFX(sfxMenuSelect);            
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";
    switch menu[selected] {
        case "NEW GAME":
            if global.totalCharacters > 1 {
                ID.myRoom = rmPlayerSelect;
            }
            else {
                if cfgInitialStage > -1 {
                    ID.myRoom = cfgInitialStage;
                }
                else {
                    ID.myRoom = rmStageSelect;
                }
            }        
        break;
        case "LOAD GAME":
            ID.myRoom = rmLoadGame;
        break;
        case "PASSWORD":
            ID.myRoom = rmPassInput;
        break;
        case "CHALLENGES":
            ID.myRoom = rmAchievements;
        break;
        case "KEY CONFIG":
            ID.myRoom = rmKeyConfig;
        break;
        case "GAMEPAD CONFIG":
            ID.myRoom = rmJoyConfig;
        break;
        case "RETURN TO TITLE":
            ID.myRoom = rmTitleScreen;
        break;
        default:
            ID.myRoom = room;
    }
}

