/// @description playerStepMode()
function playerStepMode() {
	//Selects which series of step functions to call based on the player's current control mode (e.g: default, Beat, etc.)
	
	if !((instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)
	/*||...*/) //Add other conditions here (e.g: for Rush Jet Adaptor and/or Treble Boost maybe idk?).
	{
		//Default control scheme
		
		//Shooting (before sprite handling to update the sprites properly)
	    playerShoot();
    
	    //Handle the sprites
	    playerHandleSprites();
	
		//Check for ground
		playerCheckGround();
	
		//Crush the player if necessary
		playerCrush();
		
		//Roll back speed to undo it being set to 0 by collisions
		if rollbackMovement playerRollbackSpeed();
    
	    //General step event code
	    playerStep();
    
	    //Collision code
	    playerCollision();
    
	    //Handles moving platform collision
	    playerMovingPlatform();
	
		//Spikes
		playerSpikes();
	
		//Prepares jumping/moving platform variables for subsequent code/the next frame
		playerCollisionEnd();
    
	    //Pausing
	    playerPause();
    
	    //Camera
	    playerCamera();
    
	    //Moving from one section to the next, if possible
	    playerSwitchSections();
    
	    //Quick weapon switching
	    playerSwitchWeapons();
	}
	else
	{
		//Beat
		if instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime
		{
			//Shooting (before sprite handling to update the sprites properly)
		    playerShoot();
    
		    //Handle the sprites
		    playerHandleSprites();
			
			//Check for ground
			playerCheckGround();
			
			//Crush the player if necessary
			playerCrush();
			
			//Roll back speed to undo it being set to 0 by collisions
			playerRollbackSpeed();
			
			//General step event code
			beatStep();
			
			//Collision code
		    beatCollision();
    
		    //Handles moving platform collision
		    beatMovingPlatform();
			
			//Prepares jumping/moving platform variables for subsequent code/the next frame
			playerCollisionEnd();
			
			//Pausing
		    playerPause();
    
		    //Camera
		    playerCamera();
    
		    //Moving from one section to the next, if possible
		    playerSwitchSections();
    
		    //Quick weapon switching
		    playerSwitchWeapons();
		}
		//Add else if statements for other conditions here (e.g: for Rush Jet Adaptor and/or Treble Boost maybe idk?).
		//else if ...
		//{
			
		//}
	}
	
	
	
}