/// @description generalCollision()
function generalCollision() {
	//Handles a general object's collision code.

	//Floor
	var mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 and yspeed > 0 {
	    
		if mask_index > -1
			y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
		else
			y = mySolid.y - (sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index));
	    
		while place_meeting(x, y, mySolid)
	        y -= 1;
    
	    //y = mySolid.y - (sprite_height - sprite_yoffset);
	    ground = true;
	    yspeed = 0;
	}
	
	
	//Wall
	mySolid = instance_place(x+xspeed, y, objSolid);
	if mySolid >= 0 && xspeed != 0 {    
	    if xspeed < 0
		{
			if mask_index > -1
				x = mySolid.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index);
			else
				x = mySolid.bbox_right + sprite_get_xoffset(sprite_index) - sprite_get_bbox_left(sprite_index);
				
			while place_meeting(x, y, mySolid)
			{
				if abs(xspeed) >= 1
					x++;
				else
					x += abs(xspeed);
			}
		}
		else
		{
	        if mask_index > -1
				x = mySolid.x - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
			else
				x = mySolid.x - (sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index)) + (sprite_get_width(sprite_index) - sprite_get_bbox_right(sprite_index)) - 1;
		}
		
	    xspeed = 0;
	}


	//Ceiling
	mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 && yspeed < 0 {
		if mask_index > -1
			y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index) - sprite_get_bbox_top(mask_index);
		else
			y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index) - sprite_get_bbox_top(sprite_index);
    
	    while place_meeting(x, y, mySolid)
	        y += 1;
			
	    yspeed = 0;
	}


	//Topsolids
	var tpsld, totalTSs;
	tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, objTopSolid, false, true)
	totalTSs = 0;
	while place_meeting(x, y+yspeed, objTopSolid)
	&& tpsld >= 0 && yspeed > 0
	{
	    if !place_meeting(x, y, tpsld)
	    {
	        if mask_index > -1
				y = tpsld.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
			else
				y = tpsld.y - (sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index));
				
			ground = true;
			yspeed = 0;
			break;
	    }
		
		platformID[totalTSs] = tpsld;
		instance_deactivate_object(tpsld);
		totalTSs += 1;
		tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, objTopSolid, false, true);
	}
	var i;
	for(i = 0; i < totalTSs; i += 1)
		instance_activate_object(platformID[i]);
	

	//Floor (moving platform)
	var mySolid;
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
	if mySolid >= 0 && (yspeed > 0 || (mySolid.yspeed < 0 and yspeed > mySolid.yspeed * mySolid.update_rate)) {
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
	        if mask_index > -1
				y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
			else
				y = mySolid.bbox_top - (sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index));
				
	        while place_meeting(x, y, mySolid)
	            y -= 1;
				
			if (mySolid.yspeed < 0 and yspeed > mySolid.yspeed * mySolid.update_rate)
				y += mySolid.yspeed * mySolid.update_rate;
			
	        ground = true;
	        yspeed = 0;
	    }
	}


	//Wall (moving platform)
	mySolid = instance_place(x+xspeed, y, prtMovingPlatformSolid);
	if mySolid >= 0 && xspeed != 0
	{    
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
	        if xspeed < 0
			{
	            if mask_index > -1
					x = mySolid.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
				else
					x = mySolid.bbox_right + sprite_get_xoffset(sprite_index) - sprite_get_bbox_left(sprite_index) + 1;
	            
				while place_meeting(x, y, mySolid)
				{
					if abs(xspeed) >= 1
						x++;
					else
						x += abs(xspeed);
				}
			}
	        else
			{
	            if mask_index > -1
					x = mySolid.bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
	            else
					x = mySolid.bbox_left - (sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index)) + (sprite_get_width(sprite_index) - sprite_get_bbox_right(sprite_index)) - 1;
				
				while place_meeting(x, y, mySolid)
				{
					if abs(xspeed) >= 1
						x--;
					else
						x -= abs(xspeed);
				}
			}
			
	        xspeed = 0;
	    }
	}


	//Ceiling (moving platform)
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
	if mySolid >= 0 && yspeed < 0
	{
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
			if mask_index > -1
				y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index) - sprite_get_bbox_top(mask_index);
			else
				y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index) - sprite_get_bbox_top(sprite_index);
				
	        yspeed = 0;
	    }
	}


	//Topsolids (moving platform)
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformJumpthrough);
	if mySolid >= 0 && (yspeed > 0 || (mySolid.yspeed < 0 and yspeed > mySolid.yspeed * mySolid.update_rate))
	{
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
	        if !place_meeting(x, y+mySolid.yspeed, mySolid)
	        {
				if mask_index > -1
					y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
				else
					y = mySolid.bbox_top - (sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index));
					
				if (mySolid.yspeed < 0 and yspeed > mySolid.yspeed * mySolid.update_rate)
					y += mySolid.yspeed * mySolid.update_rate;
				
	            ground = true;
	            yspeed = 0;
	        }
	    }
	}
	

	//escapeWall();



}
