if neverDespawn == false
{
    //"Die" (when a gimmick disappears; doesn't actually destroy the gimmick though)
    if healthpoints <= 0
    {   
        if canInitDeath == true
        {
            beenOutsideView = false;
            visible = false;
            dead = true;    //Enemies don't actually destroy themselves, they become invisible and all collision is neglected
            x = xstart;     //This is done to allow them to still execute code (for respawning)
            y = ystart;
            canInitDeath = false;
			canPlayerInteract = false;
            
            xspeed = 0;
            yspeed = 0;
        }   
    }
    
    //Respawning
    if respawn == true
    {
        if beenOutsideView == true
        {
            if insideView()
            {
                visible = true;
				solid = true;
                dead = false;
                healthpoints = 1;
                canInitDeath = true;
				canPlayerInteract = true;
                beenOutsideView = false;
            }
        }
    }
    else
    {
        if dead == true
            instance_destroy(); //If we can't respawn, there's no point to still be able to execute any code. Destroying the instance saves memory and processing power
    }
    
    if !insideView()
    {
        beenOutsideView = true;
		canPlayerInteract = false;
        
        x = xstart;
        y = ystart;
        healthpoints = 0;
        dead = true;
        visible = false;
		solid = false;
        
        xspeed = 0;
        yspeed = 0;
    }
        
        
    if dead == true
    {
        exit;
    }
}

