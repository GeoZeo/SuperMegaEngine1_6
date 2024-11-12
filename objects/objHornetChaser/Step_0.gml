event_inherited();

if target < 0 and item < 0 and !place_meeting(x, y, objItemExplosion) {    //Choose target

	var myEnemy, myPickup;

    image_xscale *= 2;
	image_yscale *= 2;
		
	myPickup = instance_place(x, y, prtPickup)
	if (myPickup > -1
	&& instance_exists(myPickup)
	&& insideViewObj(myPickup)
	&& myPickup.targetable
	&& myPickup.targetedBy < 0
	&& (object_is_ancestor(myPickup.object_index, prtPickup) and myPickup.grabbedBy < 0))    //If touching an item
	{
		target = myPickup.id;
		myPickup.targetedBy = id;
		targetLocked = true;
	}
	
	image_xscale /= 2;
	image_yscale /= 2;
	
	myEnemy = instance_place(x, y, prtEnemy)
	if (myEnemy > -1
	&& instance_exists(myEnemy)
	&& insideViewObj(myEnemy)
	&& !myEnemy.dead && !myEnemy.dying
	&& myEnemy.targetable
	&& myEnemy.targetedBy != id)    //If touching an enemy
	{
		targetLocked = true;
	}

	if chaseTimer < chaseTime && !targetLocked
	{
		chaseTimer++;
	}
	if chaseTimer >= chaseTime && !targetLocked
	{
		chaseTimer = chaseTime;
			
		//Find a target, either an enemy or an item, whichever's closest.
		if target < 0 {
		    var n = 1;
			var deadEnemies = [];
			with prtEnemy {
				if dead || dying {
					array_push(deadEnemies, id);
					instance_deactivate_object(id);
				}
			}
		    while target < 0 or (object_is_ancestor(target.object_index, prtEnemy) and (target.dead or target.dying)) or (object_is_ancestor(target.object_index, prtPickup) and target.grabbedBy > -1)
			or ((!insideViewObj(target) and (object_is_ancestor(target.object_index, prtPickup) or (object_is_ancestor(target.object_index, prtEnemy) and !target.checkFullSprite))) or (!insideViewObj_Spr(target) and (object_is_ancestor(target.object_index, prtEnemy) and target.checkFullSprite)))
			or !target.targetable  {
		        if n > instance_number(prtEnemy) + instance_number(prtPickup) {
		            target = -1;
		            break;
		        }
				var e_dx = 0;
			    var e_dy = 0;
				myEnemy = instance_nth_nearest(x, y, prtEnemy, n);
				if myEnemy > -1 && instance_exists(myEnemy)
				{
					e_dx = sprite_get_xcenter_object(myEnemy) - x;
				    e_dy = sprite_get_ycenter_object(myEnemy) - y;
				}
				var e_len = sqrt(e_dx*e_dx + e_dy*e_dy);
			
				var p_dx = 0;
			    var p_dy = 0;
				myPickup = instance_nth_nearest(x, y, prtPickup, n);
				if myPickup > -1 && instance_exists(myPickup)
				{
					p_dx = sprite_get_xcenter_object(myPickup) - x;
				    p_dy = sprite_get_ycenter_object(myPickup) - y;
				}
				var p_len = sqrt(p_dx*p_dx + p_dy*p_dy);
			
				if ((abs(e_len) <= abs(p_len)
				or (myPickup < 0 or (!insideViewObj(myPickup) or !myPickup.targetable)
				or (object_is_ancestor(myPickup.object_index, prtPickup) and (myPickup.grabbedBy > -1 or (myPickup.grabbedBy < 0 and myPickup.targetedBy > -1)))))
				&& (myEnemy.targetedBy < 0 or n < instance_number(object_index))
				&& myEnemy > -1 && !myEnemy.dead && !myEnemy.dying
				&& ((insideViewObj(myEnemy) and !myEnemy.checkFullSprite) or (insideViewObj_Spr(myEnemy) and myEnemy.checkFullSprite))
				&& myEnemy.targetable) {
					target = myEnemy.id;
					myEnemy.targetedBy = id;
					targetLocked = true;
				}
				else if myPickup > -1 && insideViewObj(myPickup) && myPickup.targetable
				&& myPickup.targetedBy < 0 && myPickup.grabbedBy < 0
				&& object_is_ancestor(myPickup.object_index, prtPickup) {
			
					target = myPickup.id;
					myPickup.targetedBy = id;
					targetLocked = true;
				}
		        n++;
		    }
			for (var i = 0; i < array_length_1d(deadEnemies); i++) {
				instance_activate_object(deadEnemies[i]);
			}
		}
	}
}

if target > -1 {    //Chasing
    if instance_exists(target) {
		if (object_is_ancestor(target.object_index, prtPickup) and target.grabbedBy > -1) {
			target = -1;
		}
		else {
			var _targetAng = point_direction(x, y, sprite_get_xcenter_object(target), sprite_get_ycenter_object(target));
			var _targetDir = sign(angle_difference(_targetAng, ang));
			if ang != _targetAng {
				ang += turningSpd * _targetDir;
				if sign(angle_difference(_targetAng, ang)) != _targetDir
					ang = _targetAng;
			}
			xspeed = cos(degtorad(ang)) * spd;
			yspeed = -sin(degtorad(ang)) * spd;
		}
    }
    else {
        target = -1;
    }
    if object_is_ancestor(target.object_index, prtPickup) {
		if place_meeting(x, y, target) and target.grabbedBy < 0 {
	        item = target;
			if (object_is_ancestor(item.object_index, prtPickup) and item.grabbedBy < 0) item.grabbedBy = id;
	        target = -1;
		}
		else if !insideViewObj(target) {
			targetLocked = false;	
			target.targetedBy = -1;
	        target = -1;
		}
    }
    else if object_is_ancestor(target.object_index, prtEnemy) and (target.dead or target.dying) {
		if ((!insideViewObj(target) and !target.checkFullSprite) or (!insideViewObj_Spr(target) and target.checkFullSprite)) {
			targetLocked = false;	
		}
		target.targetedBy = -1;
        target = -1;
    }
}

if target < 0 and item > -1 and instance_exists(item) {   //Bringing item
    if instance_exists(item) and place_meeting(x, y, item) and (object_is_ancestor(item.object_index, prtPickup) and item.grabbedBy == id) {
        if instance_exists(prtPlayer) {
            var _targetAng = point_direction(x, y, sprite_get_xcenter_object(prtPlayer), sprite_get_ycenter_object(prtPlayer));
			var _targetDir = sign(angle_difference(_targetAng, ang));
			if ang != _targetAng {
				ang += turningSpd * _targetDir;
				if sign(angle_difference(_targetAng, ang)) != _targetDir
					ang = _targetAng;
			}
			xspeed = cos(degtorad(ang)) * spd;
			yspeed = -sin(degtorad(ang)) * spd;
        }
        item.x = x + sprite_get_xoffset(item.sprite_index);
        item.y = y + sprite_get_yoffset(item.sprite_index) - (8 - item.sprite_height / 2);
        if image_xscale == -1 {
            item.x -= item.sprite_width;
            if item.sprite_width > 8 {
                item.x += (8 - item.sprite_width / 2);
            }
			else if item.sprite_width <= 12 {
		        item.x += item.sprite_width / 2;
		    }
        }
        else if item.sprite_width <= 8 {
            item.x -= item.sprite_width / 2;
        }
		if item.sprite_height <= 8 {
			item.y += item.sprite_height / 2 + 2;
		}
		else if item.sprite_height <= 12 {
			item.y += item.sprite_height / 6;
		}
        item.yspeed = 0;
        item.xspeed = 0;
        with item if pickupID == -15 alarm[0] = 0;
		with item if pickupID == -15 alarm[1] = 0;
		with item if (flash and !visible) visible = true;
		with item flash = false;
    }
    else {
        item.targetedBy = -1;
		item = -1;
		if object_is_ancestor(item.object_index, prtPickup) item.grabbedBy = -1;
    }
}

//Facing direction
if xspeed < 0 {
    image_xscale = -1;
}
if xspeed > 0 {
    image_xscale = 1;
}

//Animation
if item < 0 or !instance_exists(item) {   //Not carrying any item
    if image_index >= 2 {
        image_index = 0;
    }
}
else if (object_is_ancestor(item.object_index, prtPickup) and item.grabbedBy == id) {
    if item.sprite_width > 8 { //Large items
        if image_index >= 4 or image_index < 2 {
            image_index = 2;
        }
    }
    else {  //Small items
        if image_index >= 6 or image_index < 4 {
            image_index = 4;
        }
    }
}

