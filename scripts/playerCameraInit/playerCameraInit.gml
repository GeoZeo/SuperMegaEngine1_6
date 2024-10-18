/// @description playerCameraInit()
function playerCameraInit() {
	//Initialize the camera
	//For the meanings of newSectionXOffset/newSectionYOffset, see playerSwitchSections
	var dist;


	//Left
	dist = 0;
	while !place_meeting(floor((x+newSectionXOffset)/16)*16 - dist, y+newSectionYOffset, objSectionBorderLeft)
	&& dist <= 16 * 200
	{
	    dist += 16;
	}

	if dist >= 16 * 200
	{
	    show_message("Got stuck on left");
	}

	sectionLeft = instance_place(floor((x+newSectionXOffset)/16)*16 - dist, y+newSectionYOffset, objSectionBorderLeft).x;


	//Right
	dist = 0;
	while !place_meeting(ceil((x+newSectionXOffset)/16)*16 + dist, y+newSectionYOffset, objSectionBorderRight)
	&& dist <= 16 * 200
	{
	    dist += 16;
	}

	if dist >= 16 * 200
	{
	    show_message("Got stuck on right");
	}

	sectionRight = instance_place(ceil((x+newSectionXOffset)/16)*16 + dist, y+newSectionYOffset, objSectionBorderRight).x + 16;


	//Top
	dist = 0;
	while !place_meeting(x+newSectionXOffset, floor((y+newSectionYOffset)/16)*16 - dist, objSectionBorderTop)
	&& dist <= 16 * 200
	{
	    dist += 16;
	}

	if dist >= 16 * 200
	{
	    show_message("Got stuck on top");
	}


	sectionTop = instance_place(x+newSectionXOffset, floor((y+newSectionYOffset)/16)*16 - dist, objSectionBorderTop).y;


	//Bottom
	dist = 0;
	while !place_meeting(x+newSectionXOffset, ceil((y+newSectionYOffset)/16)*16 + dist, objSectionBorderBottom)
	&& dist <= 16 * 200
	{
	    dist += 16;
	}

	if dist >= 16 * 200
	{
	    show_message("Got stuck on bottom");
	}

	sectionBottom = instance_place(x+newSectionXOffset, ceil((y+newSectionYOffset)/16)*16 + dist, objSectionBorderBottom).y + 16;
	
	
	//Set the correct camera center position
	if variable_instance_exists(id, "climbing") && (variable_instance_exists(id, "showReady") and !showReady) && room != rmWeaponGet
	{
		cameraXOffset = ((x + (round(image_xscale) * !climbing)) - global.viewX) / global.viewWidth;
		cameraYOffset = ((y + round(image_yscale)) - global.viewY) / global.viewHeight;
	}
	else
	{
		cameraXOffset = 0.5;
		cameraYOffset = 0.5;
	}



}
