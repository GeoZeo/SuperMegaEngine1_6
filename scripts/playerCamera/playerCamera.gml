/// @description playerCamera()
function playerCamera() {
	//Handles the camera
	//Call it in prtPlayer
	
	var _xOffset = round(image_xscale) * !climbing;
	var _yOffset = round(image_yscale);
	
	//Set the correct camera center position (horizontal)
	if sectionLeft != sectionRight - global.viewWidth && cameraXOffset != 0.5
	{
		if global.viewX >= sectionRight - global.viewWidth || global.viewX <= sectionLeft
		{
			if (global.viewX >= sectionRight - global.viewWidth and x - old_x > 0 and x < round(global.viewX + (global.viewWidth / 2)) - 2)
			|| (global.viewX <= sectionLeft and x - old_x < 0 and x > round(global.viewX + (global.viewWidth / 2)) + 2)
			{
				if (x - global.viewX) / global.viewWidth != cameraXOffset
					cameraXOffset = (x - global.viewX) / global.viewWidth;
			}
			else if (global.viewX >= sectionRight - global.viewWidth and x >= round(global.viewX + (global.viewWidth / 2)))
			|| (global.viewX <= sectionLeft and x <= round(global.viewX + (global.viewWidth / 2)))
			{
				cameraXOffset = 0.5;
			}
		}
		if (sign(image_xscale) != sign(prevXScale))
		{
			if ((x <= round(global.viewX + (global.viewWidth / 2) - (1 + (_xOffset * (x == old_x)))) and image_xscale > 0)
			or (x >= round(global.viewX + (global.viewWidth / 2) + (1 + (_xOffset * (x == old_x)))) and image_xscale < 0))
			{
				cameraXOffset += image_xscale / global.viewWidth;
				if (image_xscale > 0 and cameraXOffset >= 0.5)
				|| (image_xscale < 0 and cameraXOffset <= 0.5)
				{
					cameraXOffset = 0.5;
				}
			}
		}
	}
	else
	{
		cameraXOffset = 0.5;
	}
	
	//Set the correct camera center position (vertical)
	if sectionTop != sectionBottom - global.viewHeight && cameraYOffset != 0.5
	{
		if global.viewY >= sectionBottom - global.viewHeight || global.viewY <= sectionTop
		{
			if (global.viewY >= sectionBottom - global.viewHeight and y - old_y > 0 and y < round(global.viewY + (global.viewHeight / 2)) - 2)
			|| (global.viewY <= sectionTop and y - old_y < 0 and y > round(global.viewY + (global.viewHeight / 2)) + 2)
			{
				if (y - global.viewY) / global.viewHeight != cameraYOffset
					cameraYOffset = (y - global.viewY) / global.viewHeight;
			}
			else if (global.viewY >= sectionBottom - global.viewHeight and y >= round(global.viewY + (global.viewHeight / 2)))
			|| (global.viewY <= sectionTop and y <= round(global.viewY + (global.viewHeight / 2)))
			{
				cameraYOffset = 0.5;
			}
		}
		if (sign(image_yscale) != sign(prevXScale))
		{
			if ((y <= round(global.viewY + (global.viewHeight / 2) - (1 + (_yOffset * (y == old_y)))) and image_yscale > 0)
			or (y >= round(global.viewY + (global.viewHeight / 2) + (1 + (_yOffset * (y == old_y)))) and image_yscale < 0))
			{
				cameraYOffset += image_yscale / global.viewHeight;
				if (image_yscale > 0 and cameraYOffset >= 0.5)
				|| (image_yscale < 0 and cameraYOffset <= 0.5)
				{
					cameraYOffset = 0.5;
				}
			}
		}
	}
	else
	{
		cameraYOffset = 0.5;
	}
	
	//Follow the player
	global.viewX = round(x - (global.viewWidth * cameraXOffset)) + _xOffset;
	global.viewY = round(y - (global.viewHeight * cameraYOffset)) + _yOffset;

	//Stop at section borders
	if global.viewX > sectionRight - global.viewWidth
	    global.viewX = sectionRight - global.viewWidth;
	else if global.viewX < sectionLeft
	    global.viewX = sectionLeft;
    
	if global.viewY > sectionBottom - global.viewHeight
	    global.viewY = sectionBottom - global.viewHeight
	else if global.viewY < sectionTop
	    global.viewY = sectionTop;
    
    
	//Stop at room borders
	if global.viewX > room_width - global.viewWidth
	    global.viewX = room_width - global.viewWidth;
	else if global.viewX < 0
	    global.viewX = 0;
    
	if global.viewY > room_height - global.viewHeight
	    global.viewY = room_height - global.viewHeight;
	else if global.viewY < 0
	    global.viewY = 0;



}
