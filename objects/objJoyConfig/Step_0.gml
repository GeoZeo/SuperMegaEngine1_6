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
        selected--;
        if selected < 0 {
            selected = num_menu_items - 1;
        }
        playSFX(sfxMenuMove);
    }
    else if global.keyDownPressed || global.keySelectPressed {
        selected++;
        if selected >= num_menu_items {
            selected = 0;
        }
        playSFX(sfxMenuMove);
    }
    else if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed {
        switch menu[selected] {
            case "RESET":
                reset_buttons();
                save_configs();
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
else {  //Set button
    var button = gamepad_button_check_pressed_all();
    if button != false {
        switch selected {
            case 0: global.leftButton = button; break;
            case 1: global.rightButton = button; break;
            case 2: global.upButton = button; break;
            case 3: global.downButton = button; break;
            case 4: global.jumpButton = button; break;
            case 5: global.shootButton = button; break;
            case 6: global.weaponSwitchLeftButton = button; break;
            case 7: global.weaponSwitchRightButton = button; break;
            case 8: global.pauseButton = button; break;
            case 9: global.selectButton = button; break;
            case 10: global.slideButton = button; break;
        }
        waiting = false;
        save_configs();
    }
}

