/// @description playerShielding(argument0)
/// @param condition: the condition to check to determine whether or not reflecting is active
function playerShielding(argument0) {
	//Reflects/deflects enemy projectiles if the character has a valid reflector hitbox
	
	if teleporting or showReady
		return false;
	
	if argument0 == true {
	    reflectProjectilesLeft = image_xscale < 0;
	    reflectProjectilesRight = image_xscale > 0;
	}
	else {
	    reflectProjectilesLeft = false;
	    reflectProjectilesRight = false;
	}
	
	var _x = reflector_x;
	var _y = reflector_y;
	var _width = abs(reflector_width);
	var _height = abs(reflector_height);
	var _offset = reflector_left_offset;
	
	if (_width > 0 and _height > 0) && (reflectProjectilesLeft or reflectProjectilesRight)
	{
		var myProj, totalProjs;
		if reflectProjectilesLeft
			myProj = collision_rectangle(bbox_right-_x, bbox_top+_y, bbox_right-(_x+_offset)-(_width+_offset), bbox_top+_y+_height, prtEnemyProjectile, false, true);
		else if reflectProjectilesRight
			myProj = collision_rectangle(bbox_left+_x, bbox_top+_y, bbox_left+_x+_width, bbox_top+_y+_height, prtEnemyProjectile, false, true);
		totalProjs = 0;
		while myProj >= 0
		{
			with myProj
			{
				with other event_user(1); //Reflection
			}	
			
			shotID[totalProjs] = myProj;
			instance_deactivate_object(myProj);
			totalProjs++;
			if reflectProjectilesLeft
				myProj = collision_rectangle(bbox_right-_x, bbox_top+_y, bbox_right-(_x+_offset)-(_width+_offset), bbox_top+_y+_height, prtEnemyProjectile, false, true);
			else if reflectProjectilesRight
				myProj = collision_rectangle(bbox_left+_x, bbox_top+_y, bbox_left+_x+_width, bbox_top+_y+_height, prtEnemyProjectile, false, true);
		}
		
		var i;
		for(i = 0; i < totalProjs; i++)
			instance_activate_object(shotID[i]);
	}



}
