/// @description checkWater()
function checkWater() {
	//Allows a general object to be affected by water.
	
	if place_meeting(x, y, objWater) && inWater == false
	{
		var _sectionLeft = global.viewX;
		var _sectionTop = global.viewY;
		var _sectionRight = global.viewX + (global.viewWidth);
		var _sectionBottom = global.viewY + (global.viewHeight);
		
		inWater = true;
	
		var currentWater;
		currentWater = instance_place(x, y, objWater);
		if currentWater >= 0 && (insideViewObj_Spr(currentWater) or currentWater.bbox_bottom <= _sectionTop)
		{
		    if bbox_bottom <= currentWater.bbox_top+yspeed+1
			&& currentWater.bbox_top < _sectionBottom
			&& currentWater.bbox_top > _sectionTop
		    {
				if canSplash
				{
					instance_create(x, currentWater.bbox_top+1, objSplash);
					playSFX(sfxSplash);
				}
		    }
			else if bbox_top >= currentWater.bbox_bottom+yspeed-1
			&& currentWater.bbox_bottom < _sectionBottom
			{
				if canSplash
				{
					var splash = instance_create(x, currentWater.bbox_bottom-1, objSplash);
					splash.image_yscale = -1;
					playSFX(sfxSplash);
				}
			}
			if bbox_right <= currentWater.bbox_left+xspeed+1
			&& currentWater.bbox_left > _sectionLeft
			&& currentWater.bbox_left < _sectionRight
		    {
				if canSplash
				{
					instance_create(currentWater.bbox_left+1, y, objSplashH);
					playSFX(sfxSplash);
				}
		    }
			else if bbox_left >= currentWater.bbox_right+xspeed-1
			&& currentWater.bbox_right > _sectionLeft
			&& currentWater.bbox_right < _sectionRight
			{
				if canSplash
				{
					var splash = instance_create(currentWater.bbox_right-1, y, objSplashH);
					splash.image_xscale = -1;
					playSFX(sfxSplash);
				}
			}
		}
		else if currentWater >= 0 && !(insideViewObj_Spr(currentWater) or currentWater.bbox_bottom <= _sectionTop)
		{
			inWater = false;
		}
	}

	if inWater == true
	{
	    currentGrav = gravWater;
		
		if variable_instance_exists(id, "bubbleTimer")
		{
			bubbleTimer += 1;
			if bubbleTimer >= 10
			{
			    bubbleTimer = 0;
				
			    var myBubble = -1;
				with objAirBubble
				{
					if id_of_origin = other.id || ((other.object_index == objArenaStartingPoint or other.object_index == objBossDeathTimer) and object_is_ancestor(index_of_origin, prtPlayer))
						myBubble = id;
				}
			
			    if myBubble < 0 && position_meeting(x, y-4, objWater)
			        instance_create(x, y, objAirBubble);
			}
		}
	}
	else
	{
	    currentGrav = grav;
		if variable_instance_exists(id, "bubbleTimer")
			bubbleTimer = 0;
	}


	//Leaving the water
	if inWater == true
	{
		var _sectionLeft = global.viewX;
		var _sectionTop = global.viewY;
		var _sectionRight = global.viewX + (global.viewWidth);
		var _sectionBottom = global.viewY + (global.viewHeight);
		
	    var wtr;
	    wtr = instance_place(x-xspeed, y-yspeed, objWater);
	    if wtr >= 0 && !place_meeting(x+sign(xspeed), y+sign(yspeed), objWater)
	    {
	        if bbox_bottom < wtr.bbox_top+1
	        {
				with wtr
				{
					if !collision_rectangle((other.x-8)+1, bbox_top-1, (other.x+8)-1, bbox_top, objWater, false, false)
					{
						other.inWater = false;
						if other.canSplash
						&& bbox_top < _sectionBottom
						&& bbox_top > _sectionTop
						{
							instance_create(other.x, bbox_top+1, objSplash);
							playSFX(sfxSplash);
						}
					}
				}
	        }
			else if bbox_top > wtr.bbox_bottom-1
	        {
				with wtr
				{
					if !collision_rectangle((other.x-8)+1, bbox_bottom, (other.x+8)-1, bbox_bottom+1, objWater, false, false)
					{
						other.inWater = false;
						if other.canSplash
						&& bbox_bottom < _sectionBottom
						{
							var splash = instance_create(other.x, bbox_bottom-1, objSplash);
							splash.image_yscale = -1;
					        playSFX(sfxSplash);
						}
					}
				}
	        }
			if bbox_right < wtr.bbox_left+1
	        {
				with wtr
				{
					if !collision_rectangle(bbox_left-1, (other.y-8)+1, bbox_left, (other.y+8)-1, objWater, false, false)
					{
						other.inWater = false;
						if other.canSplash
						&& bbox_left > _sectionLeft
						&& bbox_left < _sectionRight
						{
							instance_create(bbox_left+1, other.y, objSplashH);
					        playSFX(sfxSplash);
						}
					}
				}
	        }
			else if bbox_left > wtr.bbox_right-1
	        {
				with wtr
				{
					if !collision_rectangle(bbox_right, (other.y-8)+1, bbox_right+1, (other.y+8)-1, objWater, false, false)
					{
						other.inWater = false;
						if other.canSplash
						&& bbox_right > _sectionLeft
						&& bbox_right < _sectionRight
						{
							var splash = instance_create(bbox_right-1, other.y, objSplashH);
							splash.image_xscale = -1;
					        playSFX(sfxSplash);
						}
					}
				}
	        }
	    }
		else if !place_meeting(x, y, objWater)
		{
			inWater = false;
		}
	}
	
	
	
}