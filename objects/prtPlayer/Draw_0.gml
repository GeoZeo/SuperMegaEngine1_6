if teleporting == false && showReady == false
{
    //Draws the player. Whitemasks will not be used
	drawPlayer();
    
    //Hitspark
    if drawHitspark == true
    {
        draw_sprite_ext(sprHitspark, 0, sprite_get_xcenter(), sprite_get_ycenter(), image_xscale, image_yscale, 0, c_white, 1);
    }
    
    //Weapon icon (when using quick weapon switching)
	if instance_exists(objBeat) and objBeat.carrying and objBeat.target == self.id
	{
	    if drawWeaponIcon == true
	    {
	        if climbing == false
	            draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(x-8) + image_xscale, round(y-30), 1, 1, 0, c_white, 1);
	        else
	            draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(x-8), round(y-30), 1, 1, 0, c_white, 1);
	    }
	}
}
else if teleporting == true
{   
    if round(global.viewY-16+teleportY) >= y
    {
        if teleportTimer == 0
            playSFX(sfxTeleportIn);
        
        //Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   //MM disappears for one frame in MM6
            drawPlayer();
        
        if teleportTimer == 2
            image_index = 1;
        else if teleportTimer == 4
            image_index = 0;
        else if teleportTimer == 6
            image_index = 2;
        else if teleportTimer = 9
        {
            teleporting = false;
            teleportTimer = 0;
			currentTeleportSpeed = 0;
            canSpriteChange = true;
            canMove = true;
			canWalk = true;
			canJump = true;
            teleportY = 0;
            canGravity = true;
			canSwitch = true;
            canPause = true;
            sprite_index = spriteStand;
			image_speed = speedStand;
            instance_activate_all();
            exit;
        }
        
        teleportTimer += 1;
    }
    else
    {
        //Teleporting downwards
        image_index = 0;
        drawSpriteColorSwap(spriteTeleport, image_index, round(x), round(global.viewY-16+teleportY), primary_color, secondary_color, make_colour_rgb(1.0, 1.0, 1.0),global.primaryCol,global.secondaryCol, global.outlineCol);
        if abs(teleportAcc) > 0 {
			currentTeleportSpeed += abs(teleportAcc);
			if currentTeleportSpeed >= abs(teleportSpeed) {
				currentTeleportSpeed = abs(teleportSpeed);
			}
		}
		else {
			currentTeleportSpeed = abs(teleportSpeed);
		}
		
		teleportY += currentTeleportSpeed;
    }
}
else if showReady == true
{	
	//Draw the READY text
    readyTimer += 1;
    
    var readyIndicator;
    readyIndicator = readyTimer mod 12;
    if readyIndicator >= 6 && readyIndicator <= 11 //For the last 7 frames of every 14 frames, show the READY text
        draw_sprite_ext(sprReady, 0, round(global.viewX+(global.viewWidth/2)), round(global.viewY+(global.viewHeight/2)), 1, 1, 0, c_white, 1);
    
	var _jingle = noone;
	if is_string(jingle)
	{   //For retro compatibility
		var parts = split(jingle, ".");
		var name = ds_queue_dequeue(parts);
		_jingle = asset_get_index("sfx" + name);
	}
	else
	{
		_jingle = jingle;
	}
	
    if (((!is_string(_jingle) and _jingle <= -1) or (is_string(_jingle) and _jingle == noone)) and readyTimer >= 72)
	|| (((!is_string(_jingle) and _jingle > -1) or (is_string(_jingle) and _jingle != noone)) and !audio_is_playing(_jingle) and readyIndicator < 6)
    {
        readyTimer = 0;
        showReady = false;
        
        //Teleporting sequence
        teleporting = true;
        teleportY = 0;
        teleportTimer = 0;
        sprite_index = spriteTeleport;
        image_speed = speedTeleport;
        image_index = 0;
		
		jingle = noone;
		
		if !audio_is_playing(bgm)
			playMusic();
    }
}

if debug_mode || cfgDebug {
    draw_set_color(c_white);
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
	if reflectProjectilesRight
		draw_rectangle(round(bbox_left+reflector_x), round(bbox_top+reflector_y), round(bbox_left+reflector_x+reflector_width), round(bbox_top+reflector_y+reflector_height),1);
	if reflectProjectilesLeft
		draw_rectangle(round(bbox_right-reflector_x), round(bbox_top+reflector_y), round(bbox_right-(reflector_x+reflector_left_offset)-(reflector_width+reflector_left_offset)), round(bbox_top+reflector_y+reflector_height),1);
    draw_arrow(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter() + global.xspeed * 10, sprite_get_ycenter() + global.yspeed * 10, 10);

	//Draw sprite anchor
    draw_line(x - 1, y - 1, x + 1, y + 1);  
    draw_line(x - 1, y + 1, x + 1, y - 1);
}

/*if keyboard_check(ord('M')) {
    draw_surface(map_surf, view_xview[0], view_yview[0]);
}*/

/* */
/*  */
