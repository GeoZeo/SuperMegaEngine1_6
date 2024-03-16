//Changed to a Begin Step event to fix an issue where MM would fire a charge shot/needle the moment the boss door closes.
if instance_exists(prtPlayer) && prtPlayer.visible && x >= __view_get( e__VW.XView, 0 ) && x <= __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-1
&& y >= __view_get( e__VW.YView, 0 ) && y <= __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-1
{
	if (myBoss > -1 and (bossID > -1 and bossID < array_length(global.bossDefeated) and !global.bossDefeated[bossID])) || (myBoss > -1 and bossPersistent)
	{
		if bossTimer < bossTime && prtPlayer.ground //Comment out " && prtPlayer.ground" if you want the timer to tick regardless of whether or not MM is on the ground.
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
			if bossTimer >= bossTime// && prtPlayer.ground //Again, comment out " && prtPlayer.ground" if you don't want it.
			{	
				canInitDeactivation = false;
			}
			
			if !prtPlayer.locked
				playerLockMovement();
				
			stopSFX(global.bgm);
			
			if bossTimer >= bossTime// && prtPlayer.ground //Again, comment out " && prtPlayer.ground" if you don't want it.
			{
				myBoss.startIntro = true;
        
				with prtPlayer.weapons[global.currentWeapon] stopSFX(chargeSFX);
				with prtPlayer.weapons[global.currentWeapon] stopSFX(chargedSFX);
		
			    if musicVolume != -1 && musicLoopPointStart != -1
			        playMusicVolumeLoopPoint(music, musicVolume, musicLoopPointStart, musicLoopPointEnd);
			    else if musicVolume != -1
			        playMusicVolume(music, musicVolume);
			    else if musicLoopPointStart != -1
			        playMusicLoopPoint(music, musicLoopPointStart, musicLoopPointEnd);
			    else
			        playMusic(music);
			}
	    }
    
	    if bossTimer >= bossTime// && prtPlayer.ground //Again, comment out " && prtPlayer.ground" if you don't want it.
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
        
			    if global.bossHealth >= 28
			    {
			        global.bossHealth = 28;
			        stopSFX(sfxEnergyRestore);
			        playerFreeMovement();
			        myBoss.startFight = true;
			        myBoss.healthpoints = 28;
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
			/*if prtPlayer.ground*/ canInitDeactivation = false; //Again, get rid of the prtPlayer.ground "if" statements if you don't want this to be affected by whether or not MM is on the ground.
			
			if endLevel
			{
				if !prtPlayer.locked
				{
					playerLockMovement();
				
					if !cfgChargeWhileLocked && !cfgContinueChargeAnimWhileLocked //Optional
						playerLockMovement(true);
				}
			
				stopSFX(global.bgm);
				
				/*if prtPlayer.ground*/ alarm[1] = 240;
			}
			else
			{
				 instance_activate_object(objBossDoor);
				 with objBossDoor
				 {
					if insideView()
						canOpen = true;
				 }
				 instance_activate_object(objBossDoorH);
				 with objBossDoorH
				 {
					if insideView()
						canOpen = true;
				 }
			}
		}
	}
}

