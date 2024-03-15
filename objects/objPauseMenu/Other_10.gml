/// @description  Cursor Movement
if global.keyDownPressed {
    playSFX(sfxMenuMove);
    
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
        }
        else //The bottom of the right column
        {
            option = global.totalWeapons+array_length_1d(global.items)-1; //Last item
        }
            
        if option < global.totalWeapons
        {
            global.weapon = option;
            with prtPlayer event_user(0);
        }
        
        loops++;
    }
}
else if global.keyUpPressed {
    playSFX(sfxMenuMove);
    
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
        }
        else if option == 0 //The top weapon of the left column
        {
            option = global.totalWeapons; //First item
        }
        else
        {
            option -= 1;
            if option < 0
                option = global.totalWeapons;
            else if option > global.totalWeapons+array_length_1d(global.items)-1
                option = 0;
        }
            
        if option < global.totalWeapons
        {
            global.weapon = option;
            with prtPlayer event_user(0);
        }
        
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

            
        playSFX(sfxMenuMove);
    }
    
    
    while (option < global.totalWeapons && global.weapons[option].unlocked == false) || option > global.totalWeapons+array_length_1d(global.items)-1  || (option >= global.totalWeapons && (!global.items[option-global.totalWeapons].usable || !global.items[option-global.totalWeapons].showPause || (global.items[option-global.totalWeapons].count == 0 and !global.items[option-global.totalWeapons].showZero)))
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
        else if option > global.totalWeapons+array_length_1d(global.items)-1
            option = global.totalWeapons; //First item
        else if global.keyLeftPressed {
            if option == global.totalWeapons
                option = global.totalWeapons+array_length_1d(global.items)-1
            else
                option -= 1;
        }
        else if global.keyRightPressed   
            option += 1;
    }
    
    if option < global.totalWeapons {
        global.weapon = option;
        with prtPlayer event_user(0);
    }
}

