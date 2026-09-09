if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

if !global.frozen {
	
	if sprite_get_number(global.spriteShop) > 1 {
		megaImg += global.speedShop;
		if megaImg >= sprite_get_number(global.spriteShop) {
			megaImg = 0;
		}
	}
	else {
		megaImg = 0;
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
	
	var _skipped = false;
	
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
	
	if npc.isScroll && dialogue_is_scroll &&
	((current_dialogue_array != -1 and text_character_index <= string_length(current_dialogue_array[dialogue_index])) or
	 npc.idlePhase and npc.idleDialogue != -1 and text_character_index <= string_length(npc.idleDialogue)) {
		var _scroll_frames = iif(global.keyJump, scroll_frames_fast, scroll_frames_default);
		scroll_timer++;
		
		var _len;
		if current_dialogue_array != -1
			_len = string_length(current_dialogue_array[dialogue_index]);
		else if npc.idlePhase and npc.idleDialogue != -1
			_len = string_length(npc.idleDialogue);
			
		if global.keyPausePressed {
			text_character_index = _len + 1;
			arrowTimer = 0;
			_skipped = true;
		}
			
		if scroll_timer >= _scroll_frames {
			scroll_timer = 0;
			if !global.keyJump {
				scroll_speed_current = scroll_speed_default;
			}
			else {
				if scroll_speed_current < scroll_speed_max {
					scroll_speed_current += scroll_accel;
					if scroll_speed_current >= scroll_speed_max {
						scroll_speed_current = scroll_speed_max;
					}
				}
			}
			text_character_index += scroll_speed_current;
				
			if text_character_index > _len {
				arrowTimer = 0;
			}
		}
	}
	
	if !(npc.isScroll && dialogue_is_scroll) {
		text_character_index = -1;
	}
	
	if current_dialogue_array != -1
		scrolling = text_character_index >= 0 && text_character_index <= string_length(current_dialogue_array[dialogue_index]);
	else if npc.idlePhase && npc.idleDialogue != 1
		scrolling = text_character_index >= 0 && text_character_index <= string_length(npc.idleDialogue);
	else
		scrolling = false;
		
	if text_character_index < 0 scrolling = false;
	
	if (npc.goodbyePhase or isFinished) && !scrolling && dialogue_index >= array_length_1d(current_dialogue_array) - 1
		npc.playEnterAnim = true;
		
	if !npc.welcomePhase && !scrolling
		showCursor = true;
	
	var total_items_ = array_length_1d(global.items);
	var total_items = 0;
	for (var i = 0; i < total_items_; i++) {
	    if global.items[i].buyable {
	        total_items++;
	    }
	}
	var items_per_row = ceil(total_items / 2);

	if ((showInfo and npc.idleDialogue != -1) ||
	(in_dialogue and !(npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1))) {
		arrowTimer++;
		if arrowTimer >= 30 arrowTimer = 0;
	}
	if showCursor && (!in_dialogue or npc.goodbyePhase or isFinished) && (!scrolling or npc.idlePhase or npc.goodbyePhase or isFinished) && !showInfo { 
		cursorCounter++;
	}
	else {
		cursorSprite = 0;
		cursorCounter = 0;
	}
	if cursorCounter == 10 {
	    cursorSprite = 1 - cursorSprite;
	    cursorCounter = 0;
	}

	if !isFinished {
		if global.keyLeftPressed {
			if (!showInfo or npc.idleDialogue == -1) &&
			!scrolling &&
			(!in_dialogue || (npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1)) {
			    if !npc.surePhase {
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
					npc.sureTalkPhase = false;
				}
				if !scrolling npc.idlePhase = false;
			    playSFX(sfxMenuMove);
				h_as_timer = h_as_rate;
				h_as_init_timer = 0;
			}
		}
		else if global.keyRightPressed {
			if (!showInfo or npc.idleDialogue == -1) &&
			!scrolling &&
			(!in_dialogue || (npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1)) {
			    if !npc.surePhase {
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
					npc.sureTalkPhase = false;
				}
				if !scrolling npc.idlePhase = false;
			    playSFX(sfxMenuMove);
				h_as_timer = h_as_rate;
				h_as_init_timer = 0;
			}
		}
		if global.keyDownPressed {
			if (!showInfo or npc.idleDialogue == -1) &&
			!scrolling &&
			(!in_dialogue || (npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1)) {
				if !npc.surePhase {
					if !scrolling npc.idlePhase = false;
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
					v_as_timer = v_as_rate;
					v_as_init_timer = 0;
				}
			}
		}
		else if global.keyUpPressed {
			if (!showInfo or npc.idleDialogue == -1) &&
			!scrolling &&
			(!in_dialogue || (npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1)) {
			    if !npc.surePhase {
					if !scrolling npc.idlePhase = false;
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
					v_as_timer = v_as_rate;
					v_as_init_timer = 0;
				}
			}
		}
		if cfgEnableDelayedAutoShifting {
			if (!showInfo or npc.idleDialogue == -1) &&
			!scrolling &&
			(!in_dialogue || (npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1)) {
				if global.keyLeft {
					h_as_init_timer++;
					if h_as_init_timer >= h_as_delay {
						h_as_init_timer = h_as_delay;
						h_as_timer++;
						if h_as_timer >= h_as_rate {
						    if !npc.surePhase {
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
								npc.sureTalkPhase = false;
							}
							if !scrolling npc.idlePhase = false;
						    playSFX(sfxMenuMove);
		
							h_as_timer = 0;
						}
					}
				}
				else if global.keyRight {
				    h_as_init_timer++;
					if h_as_init_timer >= h_as_delay {
						h_as_init_timer = h_as_delay;
						h_as_timer++;
						if h_as_timer >= h_as_rate {
							if !npc.surePhase {
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
								npc.sureTalkPhase = false;
							}
							if !scrolling npc.idlePhase = false;
						    playSFX(sfxMenuMove);
		
							h_as_timer = 0;
						}
					}
				}
				if global.keyDown {
					if !npc.surePhase {
						if !scrolling npc.idlePhase = false;
						v_as_init_timer++;
						if v_as_init_timer >= v_as_delay {
							v_as_init_timer = v_as_delay;
							v_as_timer++;
							if v_as_timer >= v_as_rate {
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
			
								v_as_timer = 0;
							}
						}
					}
				}
				else if global.keyUp {
				    if !npc.surePhase {
						if !scrolling npc.idlePhase = false;
						v_as_init_timer++;
						if v_as_init_timer >= v_as_delay {
							v_as_init_timer = v_as_delay;
							v_as_timer++;
							if v_as_timer >= v_as_rate {
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
			
								v_as_timer = 0;
							}
						}
					}
				}
			}
		}
	}
	if option > total_items {
	    option = 0;
	}
	if option < 0 {
	    option = total_items;
	}

	if !isFinished {
		if global.keyShootPressed {
			if (!showInfo or npc.idleDialogue == -1) &&
			!scrolling &&
			(!in_dialogue || (npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1)) {
				if !npc.surePhase {
					if !scrolling npc.idlePhase = false;
					if option != total_items {
						option = total_items;
						playSFX(sfxMenuMove);
					}
					else {
						playSFX(sfxMenuSelect);
						stopSFX(sfxMenuMove);
						option = total_items;
						if array_length_1d(npc.goodbyeDialogues) > 0 {
							npc.idlePhase = false;
							npc.goodbyePhase = true;
							for (var i = 0; i < array_length_1d(npc.names); i++) {
								npc.enterBools[i] = false;
							}
							if npc.isScroll && npc.goodbyeIsScroll {
								text_character_index = 0;
								dialogue_is_scroll = true;
								scrolling = true;
							}
							else {
								text_character_index = -1;
								dialogue_is_scroll = false;
								scrolling = false;
								npc.playEnterAnim = true;
							}
							arrowTimer = 0;
						}
						else {
							isFinished = true;
							npc.playEnterAnim = true;
					        //var ID = instance_create(0, 0, objFadeout);
					        //ID.type = "room";
					        //ID.myRoom = rmStageSelect;
						}
				    }
				}
				else {
					if array_length_1d(npc.cancelDialogues) > 0 {
						dialogue_index = 0;
						npc.cancelPhase = true;
						for (var i = 0; i < array_length_1d(npc.names); i++) {
							npc.enterBools[i] = false;
						}
						if npc.isScroll && npc.cancelIsScroll {
							text_character_index = 0;
							dialogue_is_scroll = true;
							scrolling = true;
						}
						else {
							text_character_index = -1;
							dialogue_is_scroll = false;
							scrolling = false;
						}
						arrowTimer = 0;
					}
					else if npc.idleDialogue != -1 {
						npc.idlePhase = true;
						for (var i = 0; i < array_length_1d(npc.names); i++) {
							npc.enterBools[i] = false;
						}
						if npc.isScroll && npc.idleIsScroll {
							text_character_index = 0;
							dialogue_is_scroll = true;
							scrolling = true;
						}
						else {
							text_character_index = -1;
							dialogue_is_scroll = false;
							scrolling = false;
						}
					}
					npc.surePhase = false;
					playSFX(sfxMenuSelect);
				}
				h_as_timer = h_as_rate;
				h_as_init_timer = 0;
				v_as_timer = v_as_rate;
				v_as_init_timer = 0;
			}
		}
		else if global.keySelectPressed {
			if !in_dialogue && !scrolling && npc.idleDialogue != -1 {
				showInfo = true;
				npc.idlePhase = false;
				arrowTimer = 0;
			}
		}
		else if global.keyJumpPressed || (global.keyPausePressed and !_skipped) {
			if (!showInfo or npc.idleDialogue == -1) &&
			!scrolling &&
			(!in_dialogue || (npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1)) {
			    h_as_timer = h_as_rate;
				h_as_init_timer = 0;
				v_as_timer = v_as_rate;
				v_as_init_timer = 0;
				if npc.surePhase && !isSure {
					if array_length_1d(npc.cancelDialogues) > 0 {
						dialogue_index = 0;
						npc.idlePhase = false;
						npc.cancelPhase = true;
						for (var i = 0; i < array_length_1d(npc.names); i++) {
							npc.enterBools[i] = false;
						}
						arrowTimer = 0;
						if npc.isScroll && npc.cancelIsScroll {
							text_character_index = 0;
							dialogue_is_scroll = true;
							scrolling = true;
						}
						else {
							text_character_index = -1;
							dialogue_is_scroll = false;
							scrolling = false;
						}
					}
					else if npc.idleDialogue != -1 {
						npc.idlePhase = true;
						for (var i = 0; i < array_length_1d(npc.names); i++) {
							npc.enterBools[i] = false;
						}
						if npc.isScroll && npc.idleIsScroll {
							text_character_index = 0;
							dialogue_is_scroll = true;
							scrolling = true;
						}
						else {
							text_character_index = -1;
							dialogue_is_scroll = false;
							scrolling = false;
						}
					
					}
					npc.surePhase = false;
					playSFX(sfxMenuSelect);
				}
				else {
					dialogue_index = 0;
					total = 0;
					item_index = -1;
					for (var i = 0; i < total_items_; i++) {
					    if !global.items[i].buyable {
					        continue;
					    }
					    if option == total {
					        item_index = i;
					    }
					    total++;
					}
					if option < total_items && item_index > -1 {
				        if npc.surePhase show_debug_message("Trying to buy item #" + string(item_index) + " / " + global.items[item_index].eqName);
				        with global.items[item_index] {
							with other.npc event_user(0);
				            if count < maxUnits && global.screws >= price {
								if other.npc.surePhase {
					                count++;
					                global.screws -= price;
									other.counterSpeed = abs(global.screws - other.screws) / 6;
					                event_user(1);
					                playSFX(sfxPurchase);
					                print("Buying " + eqName);
									other.npc.surePhase = false;
									if array_length_1d(other.npc.thankingDialogues) > 0 {
										other.npc.idlePhase = false;
										other.npc.thankingPhase = true;
										for (var i = 0; i < array_length_1d(other.npc.names); i++) {
											other.npc.enterBools[i] = false;
										}
										arrowTimer = 0;
										if other.npc.isScroll && other.npc.thankingIsScroll {
											other.text_character_index = 0;
											other.dialogue_is_scroll = true;
											other.scrolling = true;
										}
										else {
											other.text_character_index = -1;
											other.dialogue_is_scroll = false;
											other.scrolling = false;
										}
									}
									else if other.npc.idleDialogue != -1 {
										other.npc.idlePhase = true;
										for (var i = 0; i < array_length_1d(other.npc.names); i++) {
											other.npc.enterBools[i] = false;
										}
										if other.npc.isScroll && other.npc.idleIsScroll {
											other.text_character_index = 0;
											other.dialogue_is_scroll = true;
											other.scrolling = true;
										}
										else {
											other.text_character_index = -1;
											other.dialogue_is_scroll = false;
											other.scrolling = false;
										}
									}
								}
								else {
									other.npc.idlePhase = false;
									other.npc.surePhase = true;
									other.npc.sureTalkPhase = true;
									other.isSure = true;
									for (var i = 0; i < array_length_1d(other.npc.names); i++) {
										other.npc.enterBools[i] = false;
									}
									arrowTimer = 0;
									if other.npc.isScroll && other.npc.sureIsScroll {
										other.text_character_index = 0;
										other.dialogue_is_scroll = true;
										other.scrolling = true;
									}
									else {
										other.text_character_index = -1;
										other.dialogue_is_scroll = false;
										other.scrolling = false;
									}
									if other.npc.selectSFX > -1 playSFX(other.npc.selectSFX);
								}
				            }            
				            else {
				                print("Couldn't buy " + eqName);
				                playSFX(sfxError);
							
								if !other.scrolling other.npc.idlePhase = false;
							
								if count >= maxUnits {
									if array_length_1d(other.npc.tooManyDialogues) > 0 {
										other.npc.idlePhase = false;
										other.npc.tooManyPhase = true;
										for (var i = 0; i < array_length_1d(other.npc.names); i++) {
											other.npc.enterBools[i] = false;
										}
										if other.npc.isScroll && other.npc.tooManyIsScroll {
											other.text_character_index = 0;
											other.dialogue_is_scroll = true;
											other.scrolling = true;
										}
										else {
											other.text_character_index = -1;
											other.dialogue_is_scroll = false;
											other.scrolling = false;
										}
										arrowTimer = 0;
									}
								}
								else if global.screws < price {
									if array_length_1d(other.npc.notEnoughDialogues) > 0 {
										other.npc.idlePhase = false;
										other.npc.notEnoughPhase = true;
										for (var i = 0; i < array_length_1d(other.npc.names); i++) {
											other.npc.enterBools[i] = false;
										}
										if other.npc.isScroll && other.npc.notEnoughIsScroll {
											other.text_character_index = 0;
											other.dialogue_is_scroll = true;
											other.scrolling = true;
										}
										else {
											other.text_character_index = -1;
											other.dialogue_is_scroll = false;
											other.scrolling = false;
										}
										arrowTimer = 0;
									}
								}
				            }
				        }
				    }
				    else {
				        playSFX(sfxMenuSelect);
						stopSFX(sfxMenuMove);
						option = total_items;
						if array_length_1d(npc.goodbyeDialogues) > 0 {
							npc.idlePhase = false;
							npc.goodbyePhase = true;
							for (var i = 0; i < array_length_1d(npc.names); i++) {
								npc.enterBools[i] = false;
							}
							if npc.isScroll && npc.goodbyeIsScroll {
								text_character_index = 0;
								dialogue_is_scroll = true;
								scrolling = true;
							}
							else {
								text_character_index = -1;
								dialogue_is_scroll = false;
								scrolling = false;
								npc.playEnterAnim = true;
							}
							arrowTimer = 0;
						}
						else {
							isFinished = true;
							npc.playEnterAnim = true;
					        //var ID = instance_create(0, 0, objFadeout);
					        //ID.type = "room";
					        //ID.myRoom = rmStageSelect;
						}
				    }
				}
			}
			else if !(scrolling or npc.idlePhase) {
				if showInfo && npc.idleDialogue != -1 {
					h_as_timer = h_as_rate;
					h_as_init_timer = 0;
					v_as_timer = v_as_rate;
					v_as_init_timer = 0;
				
					showInfo = false;
					npc.idlePhase = true;
					for (var i = 0; i < array_length_1d(npc.names); i++) {
						npc.enterBools[i] = false;
					}
					if npc.isScroll && npc.idleIsScroll {
						text_character_index = 0;
						dialogue_is_scroll = true;
						scrolling = true;
					}
					else {
						text_character_index = -1;
						dialogue_is_scroll = false;
						scrolling = false;
					}
				}
				else {
					h_as_timer = h_as_rate;
					h_as_init_timer = 0;
					v_as_timer = v_as_rate;
					v_as_init_timer = 0;
			
					if current_dialogue_array != -1 {
						dialogue_index++;
					
						if global.keyJumpPressed && !global.keyPausePressed {
							text_character_index = 0;
						}
						else if dialogue_index < array_length_1d(current_dialogue_array) {
						
							text_character_index = string_length(current_dialogue_array[dialogue_index]) + 1;
						}
						if dialogue_index >= array_length_1d(current_dialogue_array) {
							if !npc.goodbyePhase {
								dialogue_index = 0;
				
								npc.welcomePhase = false;
								npc.surePhase = false;
								npc.thankingPhase = false;
								npc.cancelPhase = false;
								npc.notEnoughPhase = false;
								npc.noStockPhase = false;
								npc.tooManyPhase = false;
								npc.goodbyePhase = false;
						
								if npc.idleDialogue != -1 {
									npc.idlePhase = true;
									if npc.isScroll && npc.idleIsScroll {
										text_character_index = 0;
										dialogue_is_scroll = true;
										scrolling = true;
									}
									else {
										text_character_index = -1;
										dialogue_is_scroll = false;
										scrolling = false;
									}
								}
							}
							else {
								dialogue_index--;
								text_character_index = string_length(current_dialogue_array[dialogue_index]) + 1;
								isFinished = true;
								//playEnterAnim = true;
								//var ID = instance_create(0, 0, objFadeout);
						        //ID.type = "room";
						        //ID.myRoom = rmStageSelect;
							}
						}
						else {
							scrolling = (dialogue_is_scroll && text_character_index <= string_length(current_dialogue_array[dialogue_index]));
						}
					}
				}
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

