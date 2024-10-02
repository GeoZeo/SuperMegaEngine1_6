if (instance_exists(objFadeout)) exit;

if !global.frozen {
	var total_items_ = array_length_1d(global.items);
	var total_items = 0;
	for (var i = 0; i < total_items_; i++) {
	    if global.items[i].buyable {
	        total_items++;
	    }
	}
	var items_per_row = ceil(total_items / 2);

	npcImg += 0.1;
	if npcImg >= 2 {
	    npcImg = 0;
	}
	if floor(megaImg) == 0 {
	    megaImg += 1 / global.blinkTimerMax;
	}
	else {
	    megaImg += 1 / global.blinkDuration;
	}
	if megaImg >= 2 {
	    megaImg = 0;
	}
	if !surePhase { cursorCounter++; }
	else { cursorSprite = 0; cursorCounter = 0; }
	if cursorCounter == 10 {
	    cursorSprite = 1 - cursorSprite;
	    cursorCounter = 0;
	}

	if global.keyRightPressed || global.keySelectPressed {
	    if !surePhase {
			option++;
		    if option == items_per_row {
		        option = 0;
		    }
		    else if option == total_items {
		        option = items_per_row;
		    }
		}
		else {
			isSure = !isSure;
		}
	    playSFX(sfxMenuMove);
	}
	if global.keyDownPressed {
	    if option < items_per_row {
	        option += items_per_row;
	        if option > total_items {
	            option = total_items;
	        }
	    }
		else if option == total_items {
			option = 0;
		}
	    else {
	        option = total_items;
	    }
	    playSFX(sfxMenuMove);
	}
	if global.keyLeftPressed {
	    if !surePhase {
			option--;
		    if option == -1 {
		        option = items_per_row - 1;
		    }
		    else if option == items_per_row - 1 {
		        option = total_items - 1;
		    }
		}
		else {
			isSure = !isSure;
		}
	    playSFX(sfxMenuMove);
	}
	if global.keyUpPressed {
	    if option >= items_per_row && option < total_items {
	        option -= items_per_row;
	    }
	    else if option < items_per_row {
	        option = total_items;
	    }
	    else {
	        option = total_items - 1;
	    }
	    playSFX(sfxMenuMove);
	}
	if option > total_items {
	    option = 0;
	}
	if option < 0 {
	    option = total_items;
	}

	if global.keyShootPressed {
		if !surePhase {
			if option != total_items {
				option = total_items;
				playSFX(sfxMenuMove);
			}
			else {
		        playSFX(sfxMenuSelect);
		        var ID = instance_create(0, 0, objFadeout);
		        ID.type = "room";
		        ID.myRoom = rmStageSelect;
		    }
		}
		else {
			surePhase = false;
			playSFX(sfxMenuSelect);
		}
	}
	else if global.keyJumpPressed || global.keyPausePressed {
	    if surePhase && !isSure {
			surePhase = false;
			playSFX(sfxMenuSelect);
		}
		else {
			if option < total_items && item_index > -1 {
		        if surePhase show_debug_message("Trying to buy item #" + string(item_index) + " / " + global.items[item_index].eqName);
		        with global.items[item_index] {
		            if count < maxUnits && global.screws >= price {
						if other.surePhase {
			                count++;
			                global.screws -= price;
							other.counterSpeed = abs(global.screws - other.screws) / 6;
			                event_user(1);
			                playSFX(sfxPurchase);
			                print("Buying " + eqName);
							other.surePhase = false;
						}
						else {
							other.surePhase = true;
							other.isSure = true;
							playSFX(sfxMenuSelect);
						}
		            }            
		            else {
		                print("Couldn't buy " + eqName);
		                playSFX(sfxError);
		            }
		        }
		    }
		    else {
		        playSFX(sfxMenuSelect);
		        var ID = instance_create(0, 0, objFadeout);
		        ID.type = "room";
		        ID.myRoom = rmStageSelect;
		    }
		}
	}
	
	if screws < global.screws {
		screws += counterSpeed;
		if screws >= global.screws {
			screws = global.screws;
			counterSpeed = 0;
		}
	}
	else if screws > global.screws {
		screws -= counterSpeed;
		if screws <= global.screws {
			screws = global.screws;
			counterSpeed = 0;
		}
	}
	else {
		counterSpeed = 0;
	}
	if counterSpeed == 0 && screws != global.screws {
		screws = global.screws;
	}
}

