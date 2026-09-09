if (insideView() || activated) && !finished && (!instance_exists(prtPlayer) or (!prtPlayer.showReady and !prtPlayer.teleporting and !prtPlayer.landing))
{	
	switch (current_type)
	{
		case filter_types.BLEND:
			var currentBlend = __background_get(e__BG.Blend, 0);
		
			if currentBlend != colour
			{
				with objBackgroundFX
				{
					if id != other.id 
					{
						finished = false;
						BGs_i = 0;
					}
				}
		
				transitionTimer++;
				if transitionTimer >= transitionTime
				{
					transitionTimer = 0;
					__background_set(e__BG.Blend, 0, make_color_rgb(color_get_red(currentBlend) + rInc, color_get_green(currentBlend) + gInc, color_get_blue(currentBlend) + bInc));
					if __background_get(e__BG.Blend, 0) == colour
					{
				
						finished = true;
						activated = false;
				
						with objBackgroundFX
						{
							var _currentBlend = __background_get(e__BG.Blend, 0);
							var blendCol = make_color_rgb(color_get_red(_currentBlend), color_get_green(_currentBlend), color_get_blue(_currentBlend));

							rInc = (color_get_red(colour) - color_get_red(blendCol)) / blendDiv;
							gInc = (color_get_green(colour) - color_get_green(blendCol)) / blendDiv;
							bInc = (color_get_blue(colour) - color_get_blue(blendCol)) / blendDiv;
						}
					}
				}
			}
			break;
		case filter_types.ALPHA:
			var currentAlpha = __background_get(e__BG.Alpha, 0);
			
			if currentAlpha != targetAlpha
			{
				with objBackgroundFX
				{
					if id != other.id 
					{
						finished = false;
						BGs_i = 0;
					}
				}
		
				transitionTimer++;
				if transitionTimer >= transitionTime
				{
					transitionTimer = 0;
					__background_set(e__BG.Alpha, 0, currentAlpha + AlphaIncrement);
					if __background_get(e__BG.Alpha, 0) == 0
					{
						__background_set(e__BG.Visible, 0, false);
					}
					else
					{
						__background_set(e__BG.Visible, 0, true);
					}
					
					if __background_get(e__BG.Alpha, 0) == targetAlpha
					{
						finished = true;
						activated = false;
				
						with objBackgroundFX
						{
							var _currentAlpha = __background_get(e__BG.Alpha, 0);

							AlphaIncrement = (targetAlpha - _currentAlpha) / blendDiv;
						}
					}
				}
			}
			break;
		case filter_types.CHANGE:
			if array_length_1d(BGs) > 0
			{
				with objBackgroundFX
				{
					if id != other.id 
					{
						finished = false;
						BGs_i = 0;
					}
				}
					
				transitionTimer++;
				if transitionTimer >= transitionTime
				{
					transitionTimer = 0;
					__background_set(e__BG.Index, 0, BGs[BGs_i])
					BGs_i++;
					
					if BGs_i > array_length_1d(BGs) - 1
					{
						finished = true;
						activated = false;
					}
				}
			}
			break;
	}
}
else
{
	transitionTimer = 0;
}
