if (instance_exists(objFadeout)) exit;

var total_items_ = array_length_1d(global.items);
var total_items = 0;
for (var i = 0; i < total_items_; i++) {
    if global.items[i].buyable {
        total_items++;
    }
}
var items_per_row = ceil(total_items / 2);

autoImg += 0.1;
if autoImg >= 2 {
    autoImg = 0;
}
if floor(megaImg) == 0 {
    megaImg += 1 / global.blinkTimerMax;
}
else {
    megaImg += 1 / global.blinkDuration;
}
if megaImg >= 2 {
    megaImg = 0;
}
cursorCounter++;
if cursorCounter == 10 {
    cursorSprite = 1 - cursorSprite;
    cursorCounter = 0;
}

if global.keyRightPressed {
    option++;
    if option == items_per_row {
        option = 0;
    }
    else if option == total_items {
        option = items_per_row;
    }
    playSFX(sfxMenuMove);
}
if global.keyDownPressed {
    if option < items_per_row || option == total_items {
        option += items_per_row;
        if option > total_items {
            option = total_items;
        }
    }
    else {
        option = total_items;
    }
    playSFX(sfxMenuMove);
}
if global.keyLeftPressed {
    option--;
    if option == -1 {
        option = items_per_row - 1;
    }
    else if option == items_per_row - 1 {
        option = total_items - 1;
    }
    playSFX(sfxMenuMove);
}
if global.keyUpPressed {
    if option >= items_per_row && option < total_items {
        option -= items_per_row;
    }
    else if option < items_per_row {
        option = total_items;
    }
    else {
        option = 0;
    }
    playSFX(sfxMenuMove);
}
if option > total_items {
    option = 0;
}
if option < 0 {
    option = total_items;
}

if global.keyShootPressed || global.keyPausePressed {
    if option < total_items {
        show_debug_message("Trying to buy item #" + string(item_index) + " / " + global.items[item_index].name);
        with global.items[item_index] {
            if count < maxUnits && global.screws >= price {
                count++;
                global.screws -= price;
                event_user(1);
                playSFX(sfxMenuSelect);
                print("Buying " + name);
            }            
            else {
                print("Couldn't buy " + name);
                playSFX(sfxError);
            }
        }
    }
    else {
        playSFX(sfxMenuSelect);
        var ID = instance_create(0, 0, objFadeout);
        ID.type = "room";
        ID.myRoom = rmStageSelect;
    }
}

