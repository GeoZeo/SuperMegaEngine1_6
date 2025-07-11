/// @description  Cursor Movement
if global.keyDownPressed {
    playSFX(sfxMenuMove);
	arrowTimer = 0;
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
    
    var loops = 0; //How many times the while-loop has been passed through
    //show_debug_message("Going down from " + string(option));
    
    while (option < global.totalWeapons && !global.weapons[option].unlocked) || loops == 0 || (option >= global.totalWeapons && (!global.items[option-global.totalWeapons].usable || !global.items[option-global.totalWeapons].showPause || (global.items[option-global.totalWeapons].count == 0 and !global.items[option-global.totalWeapons].showZero))) {
        if option > global.totalWeapons {
            option = 0;
        }
        //The bottom of the left column and the right column;
        //when the bottom of the left column is selected and we press down, we want to select the first item
        //for the right column, we want to select the last item
        else if option != weapons_per_col-1 && option != global.totalWeapons - 1 {
            option++;
            if option < 0
                option = global.totalWeapons - 1;
            else if option > global.totalWeapons+array_length_1d(global.items) - 1
                option = 0;
        }
        else if option == weapons_per_col-1 //The bottom of the left column
        {
            option = global.totalWeapons; //First item
			global.weapon = oldWeapon;
			with prtPlayer event_user(0);
        }
        else //The bottom of the right column
        {
            option = global.totalWeapons+array_length_1d(global.items)-1; //Last item
			global.weapon = oldWeapon;
			with prtPlayer event_user(0);
        }
            
        //if option < global.totalWeapons
        //{
        //    global.weapon = option;
        //    with prtPlayer event_user(0);
        //}
        
        loops++;
    }
}
else if global.keyUpPressed {
    playSFX(sfxMenuMove);
	arrowTimer = 0;
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
    
    var loops = 0;
    
    while (option < global.totalWeapons && global.weapons[option].unlocked == false) || loops == 0 || (option >= global.totalWeapons && (!global.items[option-global.totalWeapons].usable || !global.items[option-global.totalWeapons].showPause || (global.items[option-global.totalWeapons].count == 0 and !global.items[option-global.totalWeapons].showZero)))
    {
        if option == global.totalWeapons+array_length_1d(global.items)-1 //Last item
        {
            option = global.totalWeapons-1; //The bottom weapon of the right column
        }
        else if option >= global.totalWeapons //Item
        {
            option = weapons_per_col-1; //The bottom weapon of the left column
        }
        else if option == weapons_per_col //The top weapon of the right column
        {
            option = global.totalWeapons+array_length_1d(global.items)-1; //Last item
			global.weapon = oldWeapon;
			with prtPlayer event_user(0);
        }
        else if option == 0 //The top weapon of the left column
        {
            option = global.totalWeapons; //First item
			global.weapon = oldWeapon;
			with prtPlayer event_user(0);
        }
        else
        {
            option -= 1;
            if option < 0 {
                option = global.totalWeapons;
				global.weapon = oldWeapon;
				with prtPlayer event_user(0);
			}
            else if option > global.totalWeapons+array_length_1d(global.items)-1 {
                option = 0;
			}
        }
            
        //if option < global.totalWeapons
        //{
        //    global.weapon = option;
        //    with prtPlayer event_user(0);
        //}
        
        loops++;
    }
}

if global.keyLeftPressed || global.keyRightPressed
{
    if global.totalWeapons > weapons_per_col //If there is a right column of weapons
    && option < global.totalWeapons          //And an item is not selected
    {
        if option > weapons_per_col-1
            option -= weapons_per_col;
        else
            option += weapons_per_col;
            
        if option > global.totalWeapons-1
            option = global.totalWeapons-1;
        else if option < 0
            option = 0;
            
        playSFX(sfxMenuMove);
		arrowTimer = 0;
		h_as_timer = h_as_rate;
		h_as_init_timer = 0;
    }
    
    //Items
    if option >= global.totalWeapons {
        if global.keyLeftPressed {
            option--;
            if option < global.totalWeapons
                option = global.totalWeapons+array_length_1d(global.items)-1; //Last item
        }
        if global.keyRightPressed {
            option++;
            if option > global.totalWeapons+array_length_1d(global.items)-1
                option = global.totalWeapons; //First item
        }
		global.weapon = oldWeapon;
		with prtPlayer event_user(0);

            
        playSFX(sfxMenuMove);
		arrowTimer = 0;
		h_as_timer = h_as_rate;
		h_as_init_timer = 0;
    }
    
    
    while (option < global.totalWeapons && global.weapons[option].unlocked == false)
	|| option > global.totalWeapons+array_length_1d(global.items)-1
	|| (option >= global.totalWeapons && (!global.items[option-global.totalWeapons].usable || !global.items[option-global.totalWeapons].showPause || (global.items[option-global.totalWeapons].count == 0 and !global.items[option-global.totalWeapons].showZero)))
    {
        if option == weapons_per_col
            option = global.totalWeapons-1;
        else if option == 0
        {
            if global.totalWeapons > weapons_per_col
                option = weapons_per_col-1;
            else
                option = global.totalWeapons-1;
        }
        else if option > global.totalWeapons+array_length_1d(global.items)-1 {
            option = global.totalWeapons; //First item
			global.weapon = oldWeapon;
			with prtPlayer event_user(0);
		}
        else if global.keyLeftPressed {
            if option == global.totalWeapons {
                option = global.totalWeapons+array_length_1d(global.items)-1
				global.weapon = oldWeapon;
				with prtPlayer event_user(0);
			}
            else {
                option -= 1;
				if option >= global.totalWeapons || option <= global.totalWeapons+array_length_1d(global.items)-1 {
					global.weapon = oldWeapon;
					with prtPlayer event_user(0);
				}
			}
        }
        else if global.keyRightPressed {
            option += 1;
			if option >= global.totalWeapons || option <= global.totalWeapons+array_length_1d(global.items)-1 {
				global.weapon = oldWeapon;
				with prtPlayer event_user(0);
			}
		}
    }
    
    //if option < global.totalWeapons {
    //    global.weapon = option;
    //    with prtPlayer event_user(0);
    //}
}
if cfgEnableDelayedAutoShifting {
	if global.keyDown {
		v_as_init_timer++;
		if v_as_init_timer >= v_as_delay {
			v_as_init_timer = v_as_delay;
			v_as_timer++;
			if v_as_timer >= v_as_rate {
				v_as_timer = 0;
			    playSFX(sfxMenuMove);
				arrowTimer = 0;
    
			    var loops = 0; //How many times the while-loop has been passed through
			    //show_debug_message("Going down from " + string(option));
    
			    while (option < global.totalWeapons && !global.weapons[option].unlocked) || loops == 0 || (option >= global.totalWeapons && (!global.items[option-global.totalWeapons].usable || !global.items[option-global.totalWeapons].showPause || (global.items[option-global.totalWeapons].count == 0 and !global.items[option-global.totalWeapons].showZero))) {
			        if option > global.totalWeapons {
			            option = 0;
			        }
			        //The bottom of the left column and the right column;
			        //when the bottom of the left column is selected and we press down, we want to select the first item
			        //for the right column, we want to select the last item
			        else if option != weapons_per_col-1 && option != global.totalWeapons - 1 {
			            option++;
			            if option < 0
			                option = global.totalWeapons - 1;
			            else if option > global.totalWeapons+array_length_1d(global.items) - 1
			                option = 0;
			        }
			        else if option == weapons_per_col-1 //The bottom of the left column
			        {
			            option = global.totalWeapons; //First item
						global.weapon = oldWeapon;
						with prtPlayer event_user(0);
			        }
			        else //The bottom of the right column
			        {
			            option = global.totalWeapons+array_length_1d(global.items)-1; //Last item
						global.weapon = oldWeapon;
						with prtPlayer event_user(0);
			        }
            
			        //if option < global.totalWeapons
			        //{
			        //    global.weapon = option;
			        //    with prtPlayer event_user(0);
			        //}
        
			        loops++;
			    }
			}
		}
	}
	else if global.keyUp {
		v_as_init_timer++;
		if v_as_init_timer >= v_as_delay {
			v_as_init_timer = v_as_delay;
			v_as_timer++;
			if v_as_timer >= v_as_rate {
			    v_as_timer = 0;
				playSFX(sfxMenuMove);
				arrowTimer = 0;
    
			    var loops = 0;
    
			    while (option < global.totalWeapons && global.weapons[option].unlocked == false) || loops == 0 || (option >= global.totalWeapons && (!global.items[option-global.totalWeapons].usable || !global.items[option-global.totalWeapons].showPause || (global.items[option-global.totalWeapons].count == 0 and !global.items[option-global.totalWeapons].showZero)))
			    {
			        if option == global.totalWeapons+array_length_1d(global.items)-1 //Last item
			        {
			            option = global.totalWeapons-1; //The bottom weapon of the right column
			        }
			        else if option >= global.totalWeapons //Item
			        {
			            option = weapons_per_col-1; //The bottom weapon of the left column
			        }
			        else if option == weapons_per_col //The top weapon of the right column
			        {
			            option = global.totalWeapons+array_length_1d(global.items)-1; //Last item
						global.weapon = oldWeapon;
						with prtPlayer event_user(0);
			        }
			        else if option == 0 //The top weapon of the left column
			        {
			            option = global.totalWeapons; //First item
						global.weapon = oldWeapon;
						with prtPlayer event_user(0);
			        }
			        else
			        {
			            option -= 1;
			            if option < 0 {
			                option = global.totalWeapons;
							global.weapon = oldWeapon;
							with prtPlayer event_user(0);
						}
			            else if option > global.totalWeapons+array_length_1d(global.items)-1 {
			                option = 0;
						}
			        }
            
			        //if option < global.totalWeapons
			        //{
			        //    global.weapon = option;
			        //    with prtPlayer event_user(0);
			        //}
        
			        loops++;
			    }
			}
		}
	}

	if (global.keyLeft and !global.keyRight) || (global.keyRight and !global.keyLeft)
	{
		h_as_init_timer++;
		if h_as_init_timer >= h_as_delay {
			h_as_init_timer = h_as_delay;
			h_as_timer++;
			if h_as_timer >= h_as_rate {
			    if global.totalWeapons > weapons_per_col //If there is a right column of weapons
			    && option < global.totalWeapons          //And an item is not selected
			    {
			        if option > weapons_per_col-1
			            option -= weapons_per_col;
			        else
			            option += weapons_per_col;
            
			        if option > global.totalWeapons-1
			            option = global.totalWeapons-1;
			        else if option < 0
			            option = 0;
            
			        playSFX(sfxMenuMove);
					h_as_timer = 0;
					arrowTimer = 0;
			    }
    
			    //Items
			    if option >= global.totalWeapons {
			        if global.keyLeft {
			            option--;
			            if option < global.totalWeapons
			                option = global.totalWeapons+array_length_1d(global.items)-1; //Last item
			        }
			        if global.keyRight {
			            option++;
			            if option > global.totalWeapons+array_length_1d(global.items)-1
			                option = global.totalWeapons; //First item
			        }
					global.weapon = oldWeapon;
					with prtPlayer event_user(0);

            
			        playSFX(sfxMenuMove);
					h_as_timer = 0;
					arrowTimer = 0;
			    }
    
    
			    while (option < global.totalWeapons && global.weapons[option].unlocked == false)
				|| option > global.totalWeapons+array_length_1d(global.items)-1
				|| (option >= global.totalWeapons && (!global.items[option-global.totalWeapons].usable || !global.items[option-global.totalWeapons].showPause || (global.items[option-global.totalWeapons].count == 0 and !global.items[option-global.totalWeapons].showZero)))
			    {
			        if option == weapons_per_col
			            option = global.totalWeapons-1;
			        else if option == 0
			        {
			            if global.totalWeapons > weapons_per_col
			                option = weapons_per_col-1;
			            else
			                option = global.totalWeapons-1;
			        }
			        else if option > global.totalWeapons+array_length_1d(global.items)-1 {
			            option = global.totalWeapons; //First item
						global.weapon = oldWeapon;
						with prtPlayer event_user(0);
					}
			        else if global.keyLeft {
			            if option == global.totalWeapons {
			                option = global.totalWeapons+array_length_1d(global.items)-1
							global.weapon = oldWeapon;
							with prtPlayer event_user(0);
						}
			            else {
			                option -= 1;
							if option >= global.totalWeapons || option <= global.totalWeapons+array_length_1d(global.items)-1 {
								global.weapon = oldWeapon;
								with prtPlayer event_user(0);
							}
						}
			        }
			        else if global.keyRight {
			            option += 1;
						if option >= global.totalWeapons || option <= global.totalWeapons+array_length_1d(global.items)-1 {
							global.weapon = oldWeapon;
							with prtPlayer event_user(0);
						}
					}
			    }
    
			    //if option < global.totalWeapons {
			    //    global.weapon = option;
			    //    with prtPlayer event_user(0);
			    //}
			}
		}
	}
	else if global.keyLeft && global.keyRight
	{
		h_as_init_timer++;
		if h_as_init_timer >= h_as_delay {
			h_as_init_timer = h_as_delay;
		}
		h_as_timer = h_as_rate;
	}
}

