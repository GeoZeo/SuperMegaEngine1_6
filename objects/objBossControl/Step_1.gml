//Changed to a Begin Step event to fix an issue where MM would fire a charge shot/needle the moment the boss door closes.
if instance_exists(prtPlayer) && prtPlayer.visible && x >= global.viewX && x <= global.viewX+global.viewWidth-1
&& y >= global.viewY && y <= global.viewY+global.viewHeight-1 && !insideViewAny_Spr(objArenaStartingPoint) && (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime)
{	
	var _groundChecked = prtPlayer.ground || !checkForGround;
	
	if ((myBoss > -1 and (bossID > -1 and bossID < array_length_1d(global.bossDefeated) and !global.bossDefeated[bossID])) || (myBoss > -1 and (bossPersistent or bossIsClone)))
	&& !(room == cfgInitialStage && global.initialStageClear) //Comment this line out if you want the initial stage boss to be refightable
	{
		if bossTimer < bossTime && _groundChecked
		{
			bossTimer++;
			if bossTimer >= bossTime
			{
				bossTimer = bossTime;
			}	
		}
	

	    //Locks the player and activates the boss (but won't make the boss move yet, it just performs its starting pose)
	    //Also plays the boss music
	    if canInitDeactivation == true
	    {
			if bossTimer >= bossTime && _groundChecked
			{	
				canInitDeactivation = false;
			}
			
			if !prtPlayer.locked
				playerLockMovement();
				
			with objPauseMenu instance_destroy();
			stopSFX(sfxPause);
				
			stopSFX(global.bgm);
			
			if bossTimer >= bossTime && _groundChecked
			{
				myBoss.startIntro = true;
        
				with prtPlayer.weapons[global.currentWeapon] stopSFX(chargeSFX);
				with prtPlayer.weapons[global.currentWeapon] stopSFX(chargedSFX);
		
			    if music != -1
				{
					if musicVolume != -1 && musicLoopPointStart != -1
				        playMusicVolumeLoopPoint(music, musicVolume, musicLoopPointStart, musicLoopPointEnd);
				    else if musicVolume != -1
				        playMusicVolume(music, musicVolume);
				    else if musicLoopPointStart != -1
				        playMusicLoopPoint(music, musicLoopPointStart, musicLoopPointEnd);
				    else
				        playMusicDefault(music);
				}
			}
	    }
    
	    if bossTimer >= bossTime && _groundChecked
		{
			//Preparing to fill the health bar
			if canFillHealthBar == true
			{
			    healthBarTimer += 1;
			    if healthBarTimer >= healthBarTimerMax
			    {
			        healthBarTimer = 0;
			        canFillHealthBar = false;
			        fillingHealthBar = true;
			        stopSFX(sfxEnergyRestore);
			        loopSFX(sfxEnergyRestore);
			        drawHealthBar = true;
            
			    }
			}
    
    
			//Filling the health bar
			if fillingHealthBar == true
			{
			    healthBarTimer += 1;
			    if healthBarTimer >= 3
			    {
			        global.bossHealth += 1;
			        healthBarTimer = 0;
			    }
        
			    if global.bossHealth >= myBoss.healthpointsStart
			    {
			        global.bossHealth = myBoss.healthpointsStart;
			        stopSFX(sfxEnergyRestore);
			        playerFreeMovement();
			        myBoss.startFight = true;
			        myBoss.healthpoints = myBoss.healthpointsStart;
			        fillingHealthBar = false;
			    }
			}
		}
	}
	else
	{
		//If there is no boss to fight, we don't activate the boss and instead just warp out.
		if canInitDeactivation == true
		{
			if _groundChecked canInitDeactivation = false;
			
			if endLevel
			{
				if !prtPlayer.locked
				{
					playerLockMovement();
				
					if !cfgChargeWhileLocked && !cfgContinueChargeAnimWhileLocked //Optional
						playerLockMovement(true);
				}
				
				with objPauseMenu instance_destroy();
				stopSFX(sfxPause);
			
				stopSFX(global.bgm);
				
				if _groundChecked alarm[0] = 240;
			}
			else
			{
				var warp = true;
				instance_activate_object(objBossDoor);
				with objBossDoor
				{
					if insideView() && ((dir == 1 && prtPlayer.x > x) or (dir == -1 && prtPlayer.x <= x)) {
						canOpen = true;
						warp = false;
					}
				}
				instance_activate_object(objBossDoorH);
				with objBossDoorH
				{
					if insideView() && ((dir == 1 && prtPlayer.y > y) or (dir == -1 && prtPlayer.y <= y)) {
						canOpen = true;
						warp = false;
					}
				}
				instance_activate_object(objTeleport);
				with objTeleport
				{
					if insideView() {
						on = true;
						warp = false;
					}
				}
				 
				if warp {
					
					if !prtPlayer.locked
					{
						playerLockMovement();
				
						if !cfgChargeWhileLocked && !cfgContinueChargeAnimWhileLocked //Optional
							playerLockMovement(true);
					}
			
					stopSFX(global.bgm);
					
					var myTeleport = instance_create(mask_get_xcenter_object(prtPlayer), mask_get_ycenter_object(prtPlayer), objTeleport);
					with myTeleport {
						image_xscale = 1/16;
						image_yscale = 1/16;
						toX = other.toX;
						toY = other.toY;
						drawLED = false;
						on = false;
						alarm[2] = 180;
					}
				}
				else {
					
					if (!is_string(endMusic) and endMusic > -1) || (is_string(endMusic) and endMusic != noone) {
						
						var myPlayer = instance_create(x, y, objMusicPlayer)
						with myPlayer
						{
							myBGM = other.endMusic;
							myVolume = other.endMusicVolume;
							myLoopStart = other.endMusicLoopPointStart;
							myLoopEnd = other.endMusicLoopPointEnd;
							destroyOnActivation = other.endMusicDestroyOnActivate;
							
							event_user(0);
						}
					}
					else if triggerNearestMusicPlayer {
						with instance_nearest(x, y, objMusicPlayer) event_user(0);
					}
				}
			}
		}
	}
}

