////Fading in/out
//if textAlphaIncrease {
//    if textAlpha < 1 {
//        textAlphaTimer++;
//        if textAlphaTimer >= textAlphaInterval {
//            textAlphaTimer = 0;
//            textAlpha += textAlphaIncreaseAmount;
//			if textAlpha >= 1 {
//				textAlpha = 1;
//			}
//        }
//    }
//    else {
//        textAlphaTimer = 0;
//    }
//}
//else {
//    if textAlpha > 0 {
//        textAlphaTimer++;
//        if textAlphaTimer >= textAlphaInterval {
//            textAlphaTimer = 0;
//            textAlpha -= textAlphaIncreaseAmount;
//			if textAlpha <= 0 {
//				textAlpha = 0;
//			}
//        }
//    }   
//    else {
//        textAlphaTimer = 0;
//        room_goto(rmOpening);
//    } 
//}

var _fadeInExists = instance_exists(objFadeIn) and !objFadeIn.reverse;
var _fadeOutExists = instance_exists(objFadeout) or (instance_exists(objFadeIn) and objFadeIn.reverse);

//Proceed to the next screen ("phase")
proceedTimer++;
if (global.keyJumpPressed or global.keyPausePressed) && can_skip
&& (!_fadeInExists or skip_fade_in) && (!_fadeOutExists or skip_fade_out) {
	proceedTimer = proceedTimerMax;
	if !fade_out_skip {
		if ds_queue_size(phrases) > 0 {
			with objFadeIn instance_destroy();
			var fadeIn = instance_create(0, 0, objFadeIn);
			fadeIn.deactivate = false;
			phrase = ds_queue_dequeue(phrases);
			proceedTimer = 0;
			drawBuildNum = false;
			fadingOut = false;
		}
		else {
			room_goto(rmOpening);
		}
	}
	else {
		if _fadeInExists {
			with objFadeIn {
				other.proceedTimer -= (((1 / blackAlphaDecrease) * blackAlphaTimerMax) * blackAlpha) - blackAlphaTimer;
			}
		}
		else if _fadeOutExists {
			skipNext = true;
		}
	}
}
if proceedTimer >= proceedTimerMax {
	if !fadingOut {
		with objFadeIn instance_destroy();
		var fadeIn = instance_create(0, 0, objFadeIn);
		with fadeIn {
			deactivate = false;
			blackAlpha = 0;
			blackAlphaDecrease = -0.2;
			reverse = true;
		}
		fadingOut = true;
	}
	
	with objFadeIn {
		if !reverse {
			with other {
				if ds_queue_size(phrases) > 0 {
					phrase = ds_queue_dequeue(phrases);
					proceedTimer = 0;
					drawBuildNum = false;
					fadingOut = false;
					
					if skipNext {
						if ds_queue_size(phrases) > 0 {
							phrase = ds_queue_dequeue(phrases);
							proceedTimer = 0;
							drawBuildNum = false;
							fadingOut = false;
							skipNext = false;
						}
						else {
							room_goto(rmOpening);
						}
					}
				}
				else {
					room_goto(rmOpening);
				}
			}
		}
	}
}

