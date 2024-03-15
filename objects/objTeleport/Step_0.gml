timerLED += 0.1;
if timerLED >= 2 {
    timerLED = 0;
}
if sprite_index == prtPlayer.spriteTeleport {
    if image_index >= 2 {
        if !out {
            visible = false;
            sprite_index = -1;
            var fadeoutin = instance_create(x, y, objFadeIn);
            fadeoutin.blackAlpha = 0;
            fadeoutin.blackAlphaDecrease = -0.2;
            fadeoutin.reverse = true;
            fadeoutin.deactivate = false;
            alarm[0] = 15;
            alarm[1] = 30;
        }
        else {
            //instance_activate_object(objMegaman);
            with instance_nearest(toX, toY, objBossControl) {
                if !insideView() {
                    playerFreeMovement()
                }
            }
            prtPlayer.x = toX;
            prtPlayer.y = toY;
            prtPlayer.visible = true;
            prtPlayer.image_xscale = toDir;
            x = origX;
            y = origY;            
            visible = false;
            sprite_index = sprCollisionOther;
            out = false;
            instance_activate_object(objSolid);
            if returnBGM > -1 {
                playMusicVolume(returnBGM, 0.9);
            }
        }
    }
}

