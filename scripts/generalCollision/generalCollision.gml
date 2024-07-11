/// @description generalCollision()
function generalCollision() {
	//Handles a general object's collision code. The object cannot have a specified mask. If it does, use generalCollisionMask()

	//var colliding = !place_free(x, y);

	//Floor
	var mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 and yspeed > 0 {
		if mask_index > -1
			y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
		else
			y = mySolid.y - (sprite_height - sprite_yoffset);
    
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
				x = mySolid.bbox_right;
				
	        while place_meeting(x, y, mySolid)
			{
				if abs(xspeed) >= 1
					x += 1;
				else
					x += -xspeed;
			}
	    }
	    else
		{
			if mask_index > -1
			{
				x = mySolid.x - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
			}
			else
			{
				x = mySolid.bbox_left;
		        while place_meeting(x, y, mySolid)
		            x -= 1;
			}
		}
        
	    xspeed = 0;
	}


	//Ceiling
	mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 && yspeed < 0 {
		if mask_index > -1
			y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index);
		else
			y = mySolid.bbox_bottom + sprite_yoffset;
    
	    //For some reason, the code above would work correctly half the time, but clip MM inside the ceiling the other half
	    //This while-loop fixes the issue by forcing MM out of the ceiling
	    while place_meeting(x, y, mySolid)
	        y += 1;
			
	    //y = mySolid.y + mySolid.sprite_height + sprite_yoffset + (y - (bbox_top-1));
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
				y = tpsld.y - (sprite_height - sprite_yoffset);
				
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
	if mySolid >= 0 && yspeed > 0 {
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
	        //y = mySolid.bbox_top;
	        //while place_meeting(x, y, mySolid)
	        //    y -= 1;
			if mask_index > -1
				y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
			else
				y = mySolid.bbox_top - (sprite_height - sprite_yoffset);
			
	        ground = true;
	        yspeed = 0;
	    }
	}


	//Wall (moving platform)
	mySolid = instance_place(x+xspeed, y, prtMovingPlatformSolid);
	if mySolid >= 0
	{    
	    if mySolid.dead == false
	    {
	        if xspeed < 0 || (xspeed >= 0 and mySolid.xspeed > xspeed and bbox_left+mySolid.xspeed >= mySolid.bbox_right)
		    {
				if mask_index > -1
					x = mySolid.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
				else
					x = mySolid.bbox_right;
				
		        while place_meeting(x, y, mySolid)
				{
					if abs(xspeed) >= 1
						x += 1;
					else
						x += -xspeed;
				}
		    }
		    else if xspeed > 0 || (xspeed <= 0 and mySolid.xspeed < xspeed and bbox_right+mySolid.xspeed <= mySolid.bbox_left)
			{
				if mask_index > -1
					x = mySolid.bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
				else
					x = mySolid.bbox_left;
					
		        while place_meeting(x, y, mySolid)
		            x -= 1;
			}
			
			//if xspeed < 0
	        //    x = mySolid.bbox_right + (x - (bbox_left-1));
	        //else
	        //    x = mySolid.bbox_left - (bbox_right+1 - x) - 1;
            
	        xspeed = 0;
			escapeWall(true, true, false, false);
	    }
	}


	//Ceiling (moving platform)
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
	if mySolid >= 0 && yspeed < 0
	{
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
			if mask_index > -1
				y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index);
			else
				y = mySolid.bbox_bottom + sprite_yoffset;
			
	        //y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index);
	        yspeed = 0;
			escapeWall(false, false, false, true);
	    }
	}


	//Topsolids (moving platform)
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformJumpthrough);
	if mySolid >= 0 && yspeed > 0
	{
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
	        if !place_meeting(x, y, mySolid)
	        {
				if mask_index > -1
					y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
				else
					y = mySolid.bbox_top - (sprite_height - sprite_yoffset);
				
	            //y = mySolid.bbox_top - (bbox_bottom - y);
	            ground = true;
	            yspeed = 0;
	        }
	    }
	}
	

	//escapeWall();



}
