if numBossesDefeated() == 8 && !drawLogo {
	
	if !instance_exists(objFadeIn) {
	
		if !flashed {
			var flash = instance_create(0, 0, objFlash);
			with flash
			{
				backShader = instance_create(x, y, objBackTileShader);
				backShaderReset = instance_create(x, y, objBackTileShaderReset);
				frontShader = instance_create(x, y, objFrontTileShader);
				frontShaderReset = instance_create(x, y, objFrontTileShaderReset);
				
				backShader.shader = shStageSelectFlash;
				frontShader.shader = shStageSelectFlash;
			}
			
			playSFX(sfxThunder);
			flashed = true;
		}
	
		if !instance_exists(objFlash) {
			drawLogo = true;
		}
	
	}
}
else if (numBossesDefeated() < 8 or drawLogo) && !instance_exists(objFadeIn) {
	
	if playBGM { playMusicVolume(bgmStageSelect, 0.6); playBGM = false; }

	oldOption = option;

	if !selected {
	    //Moving the selection
	    var soundPlayed;
	    soundPlayed = false; //Prevents the menu move sound from playing twice when two buttons are pressed at the same time
	    if !instance_exists(objAchievementBox) {
			if global.keyRightPressed {
		        switch option {
		            case 0: option = 1; break;
		            case 1: option = 2; break;
		            case 2: option = 0; break;
		            case 3: option = 7; break;
		            case 4: option = 6; break;
		            case 5: option = 4; break;
		            case 6: option = 5; break;
		            case 7: option = 8; break;
		            case 8: option = 3; break;
		        }
        
		        if !soundPlayed {
		            playSFX(sfxMenuMove);
		            soundPlayed = true;
		        }
		    }
		    else if global.keyLeftPressed {
		        switch option {
		            case 0: option = 2; break;
		            case 1: option = 0; break;
		            case 2: option = 1; break;
		            case 3: option = 8; break;
		            case 4: option = 5; break;
		            case 5: option = 6; break;
		            case 6: option = 4; break;
		            case 7: option = 3; break;
		            case 8: option = 7; break;
		        }
        
		        if !soundPlayed {
		            playSFX(sfxMenuMove);
		            soundPlayed = true;
		        }
		    }
    
		    if global.keyDownPressed {
		        switch option {
		            case 0: option = 7; break;
		            case 1: option = 8; break;
		            case 2: option = 3; break;
		            case 3: option = 4; break;
		            case 4: option = 2; break;
		            case 5: option = 1; break;
		            case 6: option = 0; break;
		            case 7: option = 6; break;
		            case 8: option = 5; break;
		        }
        
		        if !soundPlayed {
		            playSFX(sfxMenuMove);
		            soundPlayed = true;
		        }
		    }
		    else if global.keyUpPressed {
		        switch option {
		            case 0: option = 6; break;
		            case 1: option = 5; break;
		            case 2: option = 4; break;
		            case 3: option = 2; break;
		            case 4: option = 3; break;
		            case 5: option = 8; break;
		            case 6: option = 7; break;
		            case 7: option = 0; break;
		            case 8: option = 1; break;
		        }
        
		        if !soundPlayed {
		            playSFX(sfxMenuMove);
		            soundPlayed = true;
		        }
		    }
    
		    //Going to the shop
		    if global.enableScrews && global.keySelectPressed {
		        var ID = instance_create(0, 0, objFadeout);
		        ID.type = "room";
		        ID.myRoom = rmShop;
				selected = true;
		    }
    
		    //Selecting a stage
		    if (global.keyPausePressed || global.keyJumpPressed) && option < 9 {
		        if option < 8 || numBossesDefeated() == 8 {
		            playSFX(sfxMenuSelect);
		        }
        
		        if option < 8 {
		            if object_get_parent(global.bosses[option]) == prtBoss {
		                var boss = instance_create(0, 0, global.bosses[option]);
		                selected = true;
		                global.introductionBoss = global.bosses[option];
                
		                var ID = instance_create(0, 0, objFadeout);
		                ID.type = "room";
                    
		                if !global.bossDefeated[option]
		                    ID.myRoom = rmIntroduction;
		                else
		                    ID.myRoom = boss.level;
		                with boss instance_destroy();
					
						//Reset fortress and boss rush progress
						if global.fortressStarted {
							for (var i = 0; i < global.numFortressLevels; i++) {
							    global.fortressLevelDone[i] = false;
							}
	
							global.currentFortressLevel = 0;
							global.fortressStarted = false;
						}
					
						if numRushBossesDefeated() > 0 {
							//Initialize all rush bosses as undefeated (this is the correct behavior)
							for(var i = 0; i < 8; i++) {
								global.bossRushDefeated[i] = false; 
							}

							//While there are not other bosses, let's overwrite this for testing
							//Comment the following lines when your game has 8 bosses
							for(var i = 0; i < 8; i++) {
								global.bossRushDefeated[i] = true;  //All rush bosses are defeated
							}
							global.bossRushDefeated[7] = false; //We have only Pharaoh Man
						}
		            }
					else {
						stopSFX(sfxMenuSelect);
						playSFX(sfxError);
					}
            
		        }
		        else {
		            if numBossesDefeated() >= 8 {
		                selected = true;
                
		                if global.fortressStarted
		                    global.destinationLevel = rmFortress;
		                else
		                    global.destinationLevel = rmWilyIntro;
                
		                var ID = instance_create(0, 0, objFadeout);
		                ID.type = "room";
		                ID.myRoom = global.destinationLevel;               
		            }
		        }
		    }
		}
	}
}


//Animation
if !instance_exists(objFlash) && !instance_exists(objAchievementBox) {
	imgIndex += imgSpd;
	showShop += imgSpd / 3;
	if imgIndex >= 2
		imgIndex -= 2;
	if showShop >= 3
		showShop -= 3;
}

