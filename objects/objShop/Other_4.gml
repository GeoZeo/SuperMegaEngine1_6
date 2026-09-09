if array_length_1d(npc.welcomeDialogues) <= 0 {
	npc.welcomePhase = false;
	if npc.idleDialogue != -1 {
		npc.idlePhase = true;
		if npc.isScroll && npc.idleIsScroll {
			showCursor = false;
		}
	}
}
else {
	showCursor = false;
}

var in_dialogue = 
	npc.welcomePhase or npc.surePhase or
	npc.thankingPhase or npc.notEnoughPhase or
	npc.noStockPhase or npc.tooManyPhase or
	npc.goodbyePhase or npc.cancelPhase
;
	
current_dialogue_array = -1;
if npc.welcomePhase current_dialogue_array = npc.welcomeDialogues;
if npc.surePhase current_dialogue_array = npc.sureDialogues;
if npc.thankingPhase current_dialogue_array = npc.thankingDialogues;
if npc.cancelPhase current_dialogue_array = npc.cancelDialogues;
if npc.notEnoughPhase current_dialogue_array = npc.notEnoughDialogues;
if npc.noStockPhase current_dialogue_array = npc.noStockDialogues;
if npc.tooManyPhase current_dialogue_array = npc.tooManyDialogues;
if npc.goodbyePhase current_dialogue_array = npc.goodbyeDialogues;
	
dialogue_is_scroll = npc.isScroll &&
	((npc.welcomePhase and npc.welcomeIsScroll) or (npc.idlePhase and npc.idleIsScroll) or
	(npc.surePhase and npc.sureIsScroll) or (npc.thankingPhase and npc.thankingIsScroll) or 
	(npc.cancelPhase and npc.cancelIsScroll) or (npc.notEnoughPhase and npc.notEnoughIsScroll) or 
	(npc.noStockPhase and npc.noStockIsScroll) or (npc.tooManyPhase and npc.tooManyIsScroll) or 
	(npc.goodbyePhase and npc.goodbyeIsScroll))
;

if !(npc.isScroll && dialogue_is_scroll) {
	text_character_index = -1;
}

var _displayName =
	npc.displayName &&
	((npc.welcomePhase and npc.welcomeName) or
	(npc.surePhase and npc.sureName) or
	(npc.cancelPhase and npc.cancelName) or
	(npc.thankingPhase and npc.thankingName) or
	(npc.notEnoughPhase and npc.notEnoughName) or
	(npc.noStockPhase and npc.noStockName) or
	(npc.tooManyPhase and npc.tooManyName) or
	(npc.goodbyePhase and npc.goodbyeName) or
	(npc.idleDialogue != -1 and !showInfo and npc.idleName))
;

if _displayName {
		
	var _name = "";
	if npc.welcomePhase _name = npc.names[npc.welcomeTalkIndex];
	if npc.idlePhase _name = npc.names[npc.idleTalkIndex];
	if npc.surePhase _name = npc.names[npc.sureTalkIndex];
	if npc.thankingPhase _name = npc.names[npc.thankingTalkIndex];
	if npc.cancelPhase _name = npc.names[npc.cancelTalkIndex];
	if npc.notEnoughPhase _name = npc.names[npc.notEnoughTalkIndex];
	if npc.noStockPhase _name = npc.names[npc.noStockTalkIndex];
	if npc.tooManyPhase _name = npc.names[npc.tooManyTalkIndex];
	if npc.goodbyePhase _name = npc.names[npc.goodbyeTalkIndex];
		
	if current_dialogue_array != -1 && dialogue_index = 0 && array_length_1d(current_dialogue_array) > 0
		if !string_contains(current_dialogue_array[dialogue_index], _name + ":\n") || string_pos(_name + ":\n", current_dialogue_array[dialogue_index]) != 1
			current_dialogue_array[dialogue_index] = string_insert(_name + ":\n", current_dialogue_array[dialogue_index], 0);
	if npc.idlePhase && npc.idleDialogue != -1
		if !string_contains(npc.idleDialogue, _name + ":\n") || string_pos(_name + ":\n", npc.idleDialogue) != 1
			npc.idleDialogue = string_insert(_name + ":\n", npc.idleDialogue, 0);
		
}
	
if current_dialogue_array != -1
	scrolling = text_character_index >= 0 && text_character_index <= string_length(current_dialogue_array[dialogue_index]);
else if npc.idlePhase && npc.idleDialogue != 1
	scrolling = text_character_index >= 0 && text_character_index <= string_length(npc.idleDialogue);
else
	scrolling = false;
		
if text_character_index < 0 scrolling = false;

with npc {
	
	for (var i = 0; i < array_length_1d(names); i++)
	{
		var _scrolling = false;
		with other _scrolling = scrolling;
		
		if playEnterAnim && enterSprites[i] != sprNothing
		{
			enterBools[i] = true;
		}
		if enterSprites[i] == sprNothing
		{
			enterBools[i] = false;
		}
	
		if i + 1 >= array_length_1d(names)
			playEnterAnim = false;
	
		if enterSprites[i] != sprNothing && enterBools[i]
		{
			waitTimers[i] = 0;
			
			currentSprites[i] = enterSprites[i];
			currentSpriteSpeeds[i] = enterSpriteSpeeds[i] * iif(goodbyePhase or objShop.isFinished, -1, 1);
			var _startInd = 0;
			if goodbyePhase or other.isFinished {
				_startInd = sprite_get_number(currentSprites[i]) - 1;
			}
			else {
				_startInd = 0;
			}
			imageIndices[i] = _startInd;
		}
		else if talkAnimBools[i] && talkSprites[i] > -1 && talkSprites[i] != sprNothing &&
		(idlePhase or ((other.dialogue_index < array_length_1d(other.current_dialogue_array) - 1) or lastLineTalkBools[i]) or array_length_1d(other.current_dialogue_array) == 1) &&
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
		
			currentSprites[i] = talkSprites[i];
			currentSpriteSpeeds[i] = talkSpriteSpeeds[i];
			imageIndices[i] = 0;
		}
		else
		{
			if (waitTimers[i] == -1 or waitTimes[i] == -1) || waitTimers[i] + 1 < waitTimes[i] {
				currentSprites[i] = defaultSprites[i];
				currentSpriteSpeeds[i] = defaultSpriteSpeeds[i];
				imageIndices[i] = 0;
			}
		
			if waitTimers[i] != -1 && waitTimes[i] != -1 {
				if !(waitTimers[i] < waitTimes[i] && currentSprites[i] == defaultSprites[i]) {
					if currentSprites[i] = defaultSprites[i] && waitTransitSprites[i] != sprNothing {
						if imageIndices[i] >= sprite_get_number(currentSprites[i]) || imageIndices[i] == 0 {
							currentSprites[i] = waitTransitSprites[i];
							currentSpriteSpeeds[i] = waitTransitSpriteSpeeds[i];
							imageIndices[i] = 0;
						}
					}
					else if currentSprites[i] = waitTransitSprites[i] || (currentSprites[i] = defaultSprites[i] and waitTransitSprites[i] == sprNothing) {
						if imageIndices[i] >= sprite_get_number(currentSprites[i]) || imageIndices[i] == 0 {
							currentSprites[i] = waitSprites[i];
							currentSpriteSpeeds[i] = waitSpriteSpeeds[i];
							imageIndices[i] = 0;
						}
					}
				}
			}
		}
	}
}

