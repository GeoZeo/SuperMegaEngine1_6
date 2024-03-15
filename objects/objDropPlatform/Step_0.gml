event_inherited();

if !global.frozen and !dead {
    switch phase {
        //Idle
        case 0:
            if place_meeting(x, y-1, prtPlayer) {
                if prtPlayer.ground == true && prtPlayer.bbox_bottom <= bbox_top + 1
                && !collision_rectangle(prtPlayer.bbox_left, prtPlayer.bbox_bottom, prtPlayer.bbox_right, prtPlayer.bbox_bottom+1, prtMovingPlatformSolid, false, true)
                && !collision_rectangle(prtPlayer.bbox_left, prtPlayer.bbox_bottom, prtPlayer.bbox_right, prtPlayer.bbox_bottom+1, prtMovingPlatformJumpthrough, false, true) {
                    phase = 1;
                    timer = 0;
                }
            }
        break;
        
        
        //Preparing to drop down
        case 1:
            timer += update_rate;
            if timer >= dropTimerMax {
                timer = 0;
                phase = 2;
            }
        break;
        
        
        //Dropping down animation
        case 2:
            timer += update_rate;
            if floor(timer) mod 4 == 1 {
                timer = floor(timer) + 1;
                image_index++;
                if image_index == 4 {
                    with topSolidID instance_destroy();
                    phase = 3;
                    timer = 0;
                }
            }
        break;
        
        
        //Dropped down
        case 3:
            timer += update_rate;
            if timer >= rebuildTimerMax {
                timer = 0;
                phase = 4;
            }
        break;
        
        
        //Rebuilding animation
        case 4:
            timer += update_rate;
            if floor(timer) == 1 {
                timer = 2;
                topSolidID = instance_create(x-16, y, objTopSolid);
                topSolidID.image_xscale = 2;
            }
            
            if floor(timer) mod 3 == 1 {
                timer = floor(timer) + 1;
                image_index--;
                if image_index == 0 {
                    timer = 0;
                    phase = 0;
                }
            }
        break;
    }
}

