/// @description generalCollision()
function generalCollision() {
	//Handles a general object's collision code. The object cannot have a specified mask. If it does, use generalCollisionMask()

	var colliding = !place_free(x, y);

	//Wall
	var mySolid = instance_place(x+xspeed, y, objSolid);
	if mySolid >= 0 && xspeed != 0 && !colliding {    
	    if xspeed < 0
	        x = mySolid.x + mySolid.sprite_width + (x - (bbox_left-1));
	    else
	        x = mySolid.x - (bbox_right+1 - x) - 1;
        
	    xspeed = 0;
	}

	//Floor
	mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 and yspeed > 0 and !colliding {
	    y = mySolid.bbox_top;
	    while place_meeting(x, y, mySolid)
	        y -= 1;
    
	    //y = mySolid.y - (sprite_height - sprite_yoffset);
	    ground = true;
	    yspeed = 0;
	}


	//Ceiling
	mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 && yspeed < 0 && !colliding {
	    y = mySolid.y + mySolid.sprite_height + sprite_yoffset + (y - (bbox_top-1));
	    yspeed = 0;
	}


	//Topsolids
	var tpsld, totalTSs;
	tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, objTopSolid, false, true)
	totalTSs = 0;
	while place_meeting(x, y+global.yspeed, objTopSolid)
	&& tpsld >= 0 && yspeed > 0
	{
	    if !place_meeting(x, y, tpsld)
	    {
	        y = tpsld.y - (bbox_bottom - y);
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
	        y = mySolid.bbox_top;
	        while place_meeting(x, y, mySolid)
	            y -= 1;
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
	            x = mySolid.bbox_right + (x - (bbox_left-1));
	        else
	            x = mySolid.bbox_left - (bbox_right+1 - x) - 1;
            
	        xspeed = 0;
	    }
	}


	//Ceiling (moving platform)
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
	if mySolid >= 0 && yspeed < 0
	{
	    if mySolid.object_index != objRushJet && mySolid.dead == false
	    {
	        y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index);
	        yspeed = 0;
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
	            y = mySolid.bbox_top - (bbox_bottom - y);
	            ground = true;
	            yspeed = 0;
	        }
	    }
	}
	

	//escapeWall();



}
