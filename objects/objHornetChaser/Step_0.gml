event_inherited();

if target < 0 and item < 0 and !place_meeting(x, y, objItemExplosion) {    //Choose target

	var myEnemy, myPickup;

    image_xscale *= 2;
    image_yscale *= 2;
	myPickup = instance_place(x, y, prtPickup)
	if (myPickup > -1 && insideViewObj(myPickup) && myPickup.targetable && (object_is_ancestor(myPickup.object_index, prtPickup) and myPickup.grabbedBy != self)) target = myPickup	//If touching an item
    image_xscale /= 2;
    image_yscale /= 2;

    //Find a target, either an enemy or an item, whichever's closest.
    if target < 0 {
        var n = 1;
        while target < 0 or (object_is_ancestor(target.object_index, prtEnemy) and target.dead) or (object_is_ancestor(target.object_index, prtPickup) and target.grabbedBy == self) or !insideViewObj(target) or !target.targetable  {
            if n > instance_number(prtEnemy) + instance_number(prtPickup) {
                target = -1;
                break;
            }
			myEnemy = instance_nth_nearest(x, y, prtEnemy, n);
			var e_dx = sprite_get_xcenter_object(myEnemy) - x;
	        var e_dy = sprite_get_ycenter_object(myEnemy) - y;
	        var e_len = sqrt(e_dx*e_dx + e_dy*e_dy);
			
			myPickup = instance_nth_nearest(x, y, prtPickup, n);
			var p_dx = sprite_get_xcenter_object(myPickup) - x;
	        var p_dy = sprite_get_ycenter_object(myPickup) - y;
	        var p_len = sqrt(p_dx*p_dx + p_dy*p_dy);
			
			if ((abs(e_len) <= abs(p_len)
			or (myPickup < 0 or (!insideViewObj(myPickup) or !myPickup.targetable)
			or (object_is_ancestor(myPickup.object_index, prtPickup) and myPickup.grabbedBy == self)))
			&& !myEnemy.dead && insideViewObj(myEnemy) && myEnemy.targetable) {
				target = myEnemy;
			}
			else if insideViewObj(myPickup) && myPickup.targetable
			&& (object_is_ancestor(myPickup.object_index, prtPickup)
			and myPickup.grabbedBy != self) {
			
				target = myPickup;
			}
            n++;
        }
    }
}

if target > -1 {    //Chasing
    if instance_exists(target) {
		if (object_is_ancestor(target.object_index, prtPickup) and target.grabbedBy == self) {
			target = -1;
		}
		else {
			var dx = sprite_get_xcenter_object(target) - x;
	        var dy = sprite_get_ycenter_object(target) - y;
	        var len = sqrt(dx*dx + dy*dy);
	        xspeed = dx * spd / len;
	        yspeed = dy * spd / len;
		}
    }
    else {
        target = -1;
    }
    if object_is_ancestor(target.object_index, prtPickup) and place_meeting(x, y, target)
	and target.grabbedBy != self {
        item = target;
		if (object_is_ancestor(item.object_index, prtPickup) and item.grabbedBy < 0) item.grabbedBy = self;
        target = -1;
    }
    else if object_is_ancestor(target.object_index, prtEnemy) and target.dead {
        target = -1;
    }
}

if target < 0 and item > -1 {   //Bringing item
    if instance_exists(item) and place_meeting(x, y, item) and (object_is_ancestor(item.object_index, prtPickup) and item.grabbedBy == self) {
        if instance_exists(prtPlayer) {
            var dx = sprite_get_xcenter_object(prtPlayer) - x;
            var dy = sprite_get_ycenter_object(prtPlayer) - y;
            var len = sqrt(dx*dx + dy*dy);
            xspeed = dx * spd / len;
            yspeed = dy * spd / len;
        }
        item.x = x + sprite_get_xoffset(item.sprite_index);
        item.y = y + sprite_get_yoffset(item.sprite_index) - (8 - item.sprite_height / 2);
        if image_xscale == -1 {
            item.x -= item.sprite_width;
            if item.sprite_width > 8 {
                item.x += (8 - item.sprite_width / 2);
            }
			else if item.sprite_width <= 8 {
		        item.x += item.sprite_width / 2;
		    }
        }
        else if item.sprite_width <= 8 {
            item.x -= item.sprite_width / 2;
        }
		if item.sprite_height <= 8 {
			item.y += item.sprite_height / 2 + 2;
		}
        item.yspeed = 0;
        item.xspeed = 0;
        with item if pickupID == -15 alarm[0] = 0;
		with item if pickupID == -15 alarm[1] = 0;
		with item if (flash and !visible) visible = true;
		with item flash = false;
    }
    else {
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
if item < 0 {   //Not carrying any item
    if image_index >= 2 {
        image_index = 0;
    }
}
else if (object_is_ancestor(item.object_index, prtPickup) and item.grabbedBy == self) {
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

