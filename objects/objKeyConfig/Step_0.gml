with (other) {
if (instance_exists(objFadeout)) exit;

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
                reset_keys();
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
                keyboard_lastkey = -1;
        }
    }
}
else {  //Set key
    if keyboard_check_pressed(vk_anykey) and keyboard_lastkey != vk_escape {
        switch selected {
            case 0: global.leftKey = keyboard_lastkey; break;
            case 1: global.rightKey = keyboard_lastkey; break;
            case 2: global.upKey = keyboard_lastkey; break;
            case 3: global.downKey = keyboard_lastkey; break;
            case 4: global.jumpKey = keyboard_lastkey; break;
            case 5: global.shootKey = keyboard_lastkey; break;
            case 6: global.weaponSwitchLeftKey = keyboard_lastkey; break;
            case 7: global.weaponSwitchRightKey = keyboard_lastkey; break;
            case 8: global.pauseKey = keyboard_lastkey; break;
            case 9: global.selectKey = keyboard_lastkey; break;
            case 10: global.slideKey = keyboard_lastkey; break;
        }
        print("PRESSED", keyboard_lastkey);
        waiting = false;
        save_configs();
    }
}

}
