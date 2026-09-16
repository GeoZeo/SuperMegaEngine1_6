event_inherited();

if !global.frozen and !dead {
    xspeed = dir * spd;
    
    x -= xspeed * update_rate;
	
	with prtPlayer
	{
		//Push them down if they're at a standstill prior to being dragged off the conveyor
		if !ground && place_meeting(x - sign(other.xspeed),y+1, other.id) && bbox_bottom <= other.bbox_top && (global.yspeed + global.yforce) >= 0
		{
			x += sign(other.xspeed);
			y++;
		}
	}
}

