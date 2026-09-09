for (var i = 0; i < array_length_1d(names); i++)
{
	var _scrolling = false;
	with objShop _scrolling = scrolling;
	
	if playEnterAnim && enterSprites[i] != sprNothing
	{
		enterBools[i] = true;
	}
	else if enterSprites[i] == sprNothing
	{
		enterBools[i] = false;
	}
	
	if i + 1 >= array_length_1d(names)
		playEnterAnim = false;
	
	var _round = iif(currentSpriteSpeeds[i] >= 0, floor(imageIndices[i]), ceil(imageIndices[i]));
	var _prev_round = iif(currentSpriteSpeeds[i] >= 0, floor(imageIndices[i] - currentSpriteSpeeds[i]), ceil(imageIndices[i] - currentSpriteSpeeds[i]));
	
	if enterSprites[i] != sprNothing && enterBools[i]
	{
		waitTimers[i] = 0;
		
		if _prev_round != _round {
			var _oldSprite = currentSprites[i];
			currentSprites[i] = enterSprites[i];
			currentSpriteSpeeds[i] = enterSpriteSpeeds[i] * iif(goodbyePhase or objShop.isFinished, -1, 1);
		
				
			if currentSprites[i] != _oldSprite {
				var _startInd = 0;
				if goodbyePhase or objShop.isFinished {
					_startInd = sprite_get_number(currentSprites[i]) - 1;
				}
				else {
					_startInd = 0;
				}
				imageIndices[i] = _startInd;
			}
		}
	}
	else if talkAnimBools[i] && talkSprites[i] > -1 && talkSprites[i] != sprNothing &&
	(idlePhase or ((objShop.dialogue_index < array_length_1d(objShop.current_dialogue_array) - 1) or lastLineTalkBools[i]) or array_length_1d(objShop.current_dialogue_array) == 1) &&
	(((welcomePhase and welcomeTalkAnim and welcomeTalkIndex == i) and ((!isScroll or !welcomeIsScroll) or _scrolling)) ||
	((idlePhase and idleTalkAnim and idleTalkIndex == i) and ((!isScroll or !idleIsScroll) or _scrolling)) ||
	((surePhase and sureTalkAnim and sureTalkPhase and sureTalkIndex == i) and ((!isScroll or !sureIsScroll) or _scrolling)) ||
	((thankingPhase and thankingTalkAnim and thankingTalkIndex == i) and ((!isScroll or !thankingIsScroll) or _scrolling)) ||
	((cancelPhase and cancelTalkAnim and cancelTalkIndex == i) and ((!isScroll or !cancelIsScroll) or _scrolling)) ||
	((notEnoughPhase and notEnoughTalkAnim and notEnoughTalkIndex == i) and ((!isScroll or !notEnoughIsScroll) or _scrolling)) ||
	((noStockPhase and noStockTalkAnim and noStockTalkIndex == i) and ((!isScroll or !noStockIsScroll) or _scrolling)) ||
	((tooManyPhase and tooManyTalkAnim and tooManyTalkIndex == i) and ((!isScroll or !tooManyIsScroll) or _scrolling)) ||
	((goodbyePhase and goodbyeTalkAnim and goodbyeTalkIndex == i) and ((!isScroll or !goodbyeIsScroll) or _scrolling)))
	{
		waitTimers[i] = 0;
		
		var _oldSprite = currentSprites[i];
		currentSprites[i] = talkSprites[i];
		currentSpriteSpeeds[i] = talkSpriteSpeeds[i];
		
		if currentSprites[i] != _oldSprite
			imageIndices[i] = 0;
	}
	else
	{
		if (waitTimers[i] == -1 or waitTimes[i] == -1) || waitTimers[i] + 1 < waitTimes[i] {
			if _prev_round != _round {
				var _oldSprite = currentSprites[i];
				currentSprites[i] = defaultSprites[i];
				currentSpriteSpeeds[i] = defaultSpriteSpeeds[i];
		
				if currentSprites[i] != _oldSprite
					imageIndices[i] = 0;
			}
		}
		
		if waitTimers[i] != -1 && waitTimes[i] != -1 {
			if waitTimers[i] < waitTimes[i] && currentSprites[i] == defaultSprites[i] {
				waitTimers[i]++;
			}
			else {
				if currentSprites[i] = defaultSprites[i] && waitTransitSprites[i] != sprNothing {
					if _prev_round != _round &&
					imageIndices[i] >= sprite_get_number(currentSprites[i]) || imageIndices[i] == 0 {
						var _oldSprite = currentSprites[i];
						currentSprites[i] = waitTransitSprites[i];
						currentSpriteSpeeds[i] = waitTransitSpriteSpeeds[i];
		
						if currentSprites[i] != _oldSprite
							imageIndices[i] = 0;
					}
				}
				else if currentSprites[i] = waitTransitSprites[i] || (currentSprites[i] = defaultSprites[i] and waitTransitSprites[i] == sprNothing) {
					if _prev_round != _round &&
					imageIndices[i] >= sprite_get_number(currentSprites[i]) || imageIndices[i] == 0 {
						var _oldSprite = currentSprites[i];
						currentSprites[i] = waitSprites[i];
						currentSpriteSpeeds[i] = waitSpriteSpeeds[i];
		
						if currentSprites[i] != _oldSprite
							imageIndices[i] = 0;
					}
				}
			}
		}
	}
}

