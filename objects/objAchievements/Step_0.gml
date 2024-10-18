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
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";    
    ID.myRoom = rmMainMenu;
	as_timer = as_rate;
	as_init_timer = 0;
}

topItem = max(0, selected - maxItems + 1);

