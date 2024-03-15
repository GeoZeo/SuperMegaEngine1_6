switch phase {
    case 0: //Preparing for moving up
        timer++;
        if timer >= 15 {
            timer = 0;
            phase = 1;
        }
    break;
    
    case 1: //Moving up
        megaY -= 8;
        if megaY <= round(__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2)) {
            megaY = round(__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2));
            phase = 2;
        }
    break;
    
    case 2: //Teleporting animation
        timer += 1;
        if timer >= 3 {
            timer = 0;
            if megaImg < 2
                megaImg += 1;
            else {
                megaImg = 0;
                megaSpr = megaSpr2;
                phase = 3;
            }
        }
    break;
    
    case 3: //Waiting
        timer++;
        if timer >= 40 {
            timer = 0;
            phase = 4;
        }
    break;
    
    case 4: //Moving right
        megaX += 2;
        if megaX >= round(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )*0.75)) {
            megaX = round(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )*0.75));
            phase = 5;
        }
    break;
    
    case 5: //Waiting for text
        timer++;
        if timer >= 40 {
            timer = 0;
            phase = 6;
        }
    break;
    
    case 6: //Show "You got"
        timer++;
        
        if timer mod 3 == 0 && text1Alpha < 1
            text1Alpha += 1/3;
            
        if text1Alpha > 1
            text1Alpha = 1;
            
        if timer >= 35 {
            timer = 0;
            phase = 7;
        }
    break;
    
    case 7: //Show weapon name
        timer++;
        
        if timer mod 3 == 0 && text2Alpha < 1
            text2Alpha += 1/3;
            
        if text2Alpha > 1
            text2Alpha = 1;
        
        if timer >= 25 {
            timer = 0;
            phase = 8;
        }
    break;
    
    case 8: //Flicker between normal and weapon color
        timer++;
        if timer >= 40 {
            timer = 0;
            phase = 9;
            global.currentWeapon = 0;
        }
    break;
    
    case 9: //Weapon color and timer for leaving
        timer++;
        if timer >= 4.5 * 60 {
            timer = 0;
            var ID = instance_create(x, y, objFadeout);
            ID.type = "room";
            ID.myRoom = rmPass;
        }
    break;
}

if cfgWeaponPreview and global.weaponID > -1 {
    
    if instance_exists(prtPlayer) and prtPlayer.canMove {
        playerLockMovement();
    }
    
    with prtPlayer {
        image_xscale = 1;
        canHit = false;
    }
    
    with objHealthWeaponBar instance_destroy();
    
    with prtPickup instance_destroy();
    if phase == 8 {   //Flicker
        global.weapon = global.weaponID.newID - global.weapon;
        with prtPlayer event_user(0); //Colors
    }
    else if phase == 9 {   //WEAPON DEMO
        if global.currentWeapon == 0 {
            global.currentWeapon = global.weaponID.newID;
            global.weapon = global.currentWeapon;
            with prtPlayer event_user(0); //Colors
        }
        else {
            with global.weaponID event_user(6);
        }
    }
}

