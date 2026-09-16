/// @description playerCrush()
function playerCrush() {
	//Crush the player if necessary
	
	var solidGround, wallLeft, wallRight, ceiling;
	solidGround = false;
	wallLeft = false;
	wallRight = false;
	ceiling = false;
	
	//print(_total_xspeed);
	//print(_total_yspeed);
	var _total_xspeed = global.xspeed + global.xforce;
	var _total_yspeed = global.yspeed + global.yforce;
	
	var _yc = clamp(abs(_total_yspeed), 0.5, 1);
	print(x);
	print(y);
	print("Total: " + string(_total_yspeed));
	
	//Crushing vertically
	if !skipCrushY
	{
		///NEW
		if !collision_rectangle_free(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, false, true, true)
		|| !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, false, true, true)
		{
			if !collision_rectangle_free(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, false, true, true)
			{
				ceiling = true;
				var _ceil = -1;
				
				if collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true) >= 0
				{
					_ceil = collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true);
					if _ceil > -1 { instance_deactivate_object(_ceil); }
				}
				else if collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
				&& !collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true).dead
				{
					_ceil = collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true);
					if _ceil > -1 { instance_deactivate_object(_ceil); }
				}
				
				if !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, false, true, true)
				|| (ground && !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+_yc, false, true, true))
				{
					solidGround = true;
					print("ah");
				}
				
				if _ceil > -1 { instance_activate_object(_ceil); }
			}
			else if !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, false, true, true)
			{
				solidGround = true;
				var _ground = -1;
				
				if collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, objSolid, false, true) >= 0
				{
					_ground = collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, objSolid, false, true);
					if _ground > -1 { instance_deactivate_object(_ground); }
				}
				else if collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
				&& !collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, prtMovingPlatformSolid, false, true).dead
				{
					_ground = collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, prtMovingPlatformSolid, false, true);
					if _ground > -1 { instance_deactivate_object(_ground); }
				}
				
				if !collision_rectangle_free(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, false, true, true)
				{
					ceiling = true;
					print("beh");
				}
				
				if _ground > -1 { instance_activate_object(_ground); }
			}
		}
		////OLD
		//if !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+1, false, true, true)
		//|| !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, false, true, true)
		//{
		//	if !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+1, false, true, true)
		//	{
		//		solidGround = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//				maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true);
        
		//			    if ID[maxID].bbox_bottom <= mask_get_ycenter()
		//				{		
		//					ceiling = true;
		//					endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_bottom <= mask_get_ycenter()
		//				    {	
		//				        ceiling = true;
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//	if !collision_rectangle_free(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, false, true, true) && !(solidGround and ceiling)
		//	{
		//		solidGround = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(bbox_left, bbox_top+_total_yspeed-1, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, bbox_top+_total_yspeed-1, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//				maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, bbox_top+_total_yspeed-1, bbox_right, mask_get_ycenter()+_total_yspeed, objSolid, false, true);
        
		//			    if ID[maxID].bbox_bottom <= mask_get_ycenter()
		//				{		
		//					ceiling = true;
		//					endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(bbox_left, bbox_top+_total_yspeed-2, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, bbox_top+_total_yspeed-2, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, bbox_top+_total_yspeed-2, bbox_right, mask_get_ycenter()+_total_yspeed, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_bottom <= mask_get_ycenter()
		//				    {	
		//				        ceiling = true;
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//}
		//else if !collision_rectangle_free(bbox_left, bbox_top+_total_yspeed-1, bbox_right, mask_get_ycenter()+_total_yspeed, false, true, true)
		//|| !collision_rectangle_free(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, false, true, true)
		//{
		//	if !collision_rectangle_free(bbox_left, bbox_top+_total_yspeed-1, bbox_right, mask_get_ycenter()+_total_yspeed, false, true, true)
		//	{
		//		ceiling = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, objSolid, false, true);
        
		//				if ID[maxID].bbox_top >= mask_get_ycenter()
		//				{		
		//					solidGround = true;
		//				    endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_top >= mask_get_ycenter()
		//				    {	
		//				        solidGround = true;
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//	if !collision_rectangle_free(bbox_left, bbox_top+_total_yspeed, bbox_right, mask_get_ycenter()+_total_yspeed, false, true, true) && !(solidGround and ceiling)
		//	{
		//		ceiling = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+1, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+1, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//				maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+1, objSolid, false, true);
        
		//			    if ID[maxID].bbox_top >= mask_get_ycenter()
		//				{		
		//					solidGround = true;
		//					endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+2, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+2, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left, mask_get_ycenter()+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+2, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_top >= mask_get_ycenter()
		//				    {	
		//				        solidGround = true;
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//}
	}
	//Crushing horizontally
	if !skipCrushX
	{
		///NEW
		if !collision_rectangle_free(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, false, true, true)
		|| !collision_rectangle_free(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, false, true, true)
		{
			if !collision_rectangle_free(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, false, true, true)
			{
				wallLeft = true;
				var _left = -1;
				
				if collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
				{
					_left = collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true);
					if _left > -1 { instance_deactivate_object(_left); }
				}
				else if collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
				&& !collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true).dead
				{
					_left = collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true);
					if _left > -1 { instance_deactivate_object(_left); }
				}
				
				if !collision_rectangle_free(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, false, true, true)
				{
					wallRight = true;
					print("theh");
				}
				
				if _left > -1 { instance_activate_object(_left); }
			}
			else if !collision_rectangle_free(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, false, true, true)
			{
				wallRight = true;
				var _right = -1;
				
				if collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
				{
					_right = collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, objSolid, false, true);
					if _right > -1 { instance_deactivate_object(_right); }
				}
				else if collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
				&& !collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true).dead
				{
					_right = collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true);
					if _right > -1 { instance_deactivate_object(_right); }
				}
				
				if !collision_rectangle_free(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, false, true, true)
				{
					wallLeft = true;
					print("cheh");
				}
				
				if _right > -1 { instance_activate_object(_right); }
			}
		}
		///OLD
		//if !collision_rectangle_free(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+1, bbox_bottom, false, true, true)
		//|| !collision_rectangle_free(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, false, true, true)
		//{
		//	if !collision_rectangle_free(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+1, bbox_bottom, false, true, true)
		//	{	
		//		wallRight = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//				maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true);
        
		//			    if ID[maxID].bbox_right <= mask_get_xcenter()
		//				{		
		//					wallLeft = true;
		//					print("oh.");
		//					endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_right <= mask_get_xcenter()
		//				    {	
		//				        wallLeft = true;
		//						print("oh..");
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//	if !collision_rectangle_free(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, false, true, true) && !(wallRight and wallLeft)
		//	{
		//		wallRight = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(bbox_left+_total_xspeed-1, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left+_total_xspeed-1, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//				maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left+_total_xspeed-1, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, objSolid, false, true);
        
		//			    if ID[maxID].bbox_right <= mask_get_xcenter()
		//				{		
		//					wallLeft = true;
		//					print("oh...");
		//					endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(bbox_left+_total_xspeed-2, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(bbox_left+_total_xspeed-2, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(bbox_left+_total_xspeed-2, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_right <= mask_get_xcenter()
		//				    {	
		//				        wallLeft = true;
		//						print("oh....");
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//}
		//else if !collision_rectangle_free(bbox_left+_total_xspeed-1, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, false, true, true)
		//|| !collision_rectangle_free(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, false, true, true)
		//{
		//	if !collision_rectangle_free(bbox_left+_total_xspeed-1, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, false, true, true)
		//	{
		//		wallLeft = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, objSolid, false, true);
        
		//				if ID[maxID].bbox_left >= mask_get_xcenter()
		//				{		
		//					wallRight = true;
		//					print("oh.....");
		//				    endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed, bbox_bottom, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_left >= mask_get_xcenter()
		//				    {	
		//				        wallRight = true;
		//						print("oh......");
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//	if !collision_rectangle_free(bbox_left+_total_xspeed, bbox_top, mask_get_xcenter()+_total_xspeed, bbox_bottom, false, true, true) && !(wallRight and wallLeft)
		//	{
		//		wallLeft = true;
		
		//		var endCheck = false;
		
		//		if collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+1, bbox_bottom, objSolid, false, true) >= 0
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+1, bbox_bottom, objSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//				maxID += 1;
		//			    ID[maxID] = collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+1, bbox_bottom, objSolid, false, true);
        
		//			    if ID[maxID].bbox_left >= mask_get_xcenter()
		//				{		
		//					wallRight = true;
		//					print("oh.......");
		//					endCheck = true;
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//		if collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+2, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//		&& !endCheck
		//		{
		//			//The extra code is to check for multiple moving platforms at once
		//			//Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
		//			var maxID;
		//			maxID = -1;
		//			while collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+2, bbox_bottom, prtMovingPlatformSolid, false, true) >= 0
		//			&& !endCheck
		//			{
		//			    maxID += 1;
		//			    ID[maxID] = collision_rectangle(mask_get_xcenter()+_total_xspeed, bbox_top, bbox_right+_total_xspeed+2, bbox_bottom, prtMovingPlatformSolid, false, true);
        
		//			    if ID[maxID].dead == false
		//			    {
		//					if ID[maxID].bbox_left >= mask_get_xcenter()
		//				    {	
		//				        wallRight = true;
		//						print("oh........");
		//				        endCheck = true;
		//				    }
		//				}
            
		//			    instance_deactivate_object(ID[maxID]);
		//			}
    
		//			var i;
		//			for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
		//			{
		//			    instance_activate_object(ID[i]);
		//			}
		//		}
		//	}
		//}
	}
	
	//Crush the player if necessary
	//print(ceiling);
	if (solidGround and ceiling and !skipCrushY)
	|| (wallLeft and wallRight and !skipCrushX)
	{
		if wallLeft and wallRight print("X");
		if solidGround and ceiling print("Y");
		
		global._health = 0;
		crushed = true;
		exit;
	}
	
	skipCrushX = false;
	skipCrushY = false;
	
	
	
}
