/// @description checkGround()
function checkGround() {
	//Checks whether or not the object is on the ground

	if place_meeting(x, y+1, objSolid) || (place_meeting(x, y+1, objTopSolid))
	|| place_meeting(x, y+1, prtMovingPlatformSolid) || (place_meeting(x, y+1, prtMovingPlatformJumpthrough)) {
	    if place_meeting(x, y+1, objSolid)
	        ground = true;
	    else if place_meeting(x, y+1, objTopSolid) {
			var tpsld, totalTSs, endCheck;
			tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, objTopSolid, false, true);
			totalTSs = 0;
			endCheck = false;
			while tpsld >= 0 && endCheck == false
			{
				if bbox_bottom <= tpsld.bbox_top+1
				{
					ground = true;
					endCheck = true;
					break;
				}
				else
					ground = false;
        
				platformID[totalTSs] = tpsld;
				instance_deactivate_object(tpsld);
				totalTSs += 1;
				tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, objTopSolid, false, true);
			}
			if tpsld < 0 && !endCheck
				ground = false;
    
			var i;
			for(i = 0; i < totalTSs; i += 1)
				instance_activate_object(platformID[i]);
	    }
	    else if place_meeting(x, y+1, prtMovingPlatformSolid) {
	        var sld = instance_place(x, y+1, prtMovingPlatformSolid);
	        if sld > -1 and sld.object_index != objRushJet and !sld.dead
	            ground = true;
	        else
	            ground = false;
	    }
	    else {
			var pltfm, totalPlatforms, endCheck;
		    pltfm = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, prtMovingPlatformJumpthrough, false, true);
		    totalPlatforms = 0;
			endCheck = false;
		    while pltfm >= 0 && endCheck == false
		    {
		        if pltfm.dead == false
		        {
		            if bbox_bottom <= pltfm.bbox_top+1 && pltfm.object_index != objRushJet
		            {
		                ground = true;
		                endCheck = true;
						break;
		            }
		            else
		                ground = false;
		        }
		        else
		            ground = false;
        
		        platformID[totalPlatforms] = pltfm;
		        instance_deactivate_object(pltfm);
		        totalPlatforms += 1;
		        pltfm = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, prtMovingPlatformJumpthrough, false, true);
		    }
			if pltfm < 0 && !endCheck
				ground = false;
		
			var i;
		    for(i = 0; i < totalPlatforms; i += 1)
		        instance_activate_object(platformID[i]);
	    }
	}
	else
	    ground = false;



}
