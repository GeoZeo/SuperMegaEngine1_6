//Despawn the enemy if they go outside the section boundaries on their own.
if (((!insideView() and !checkFullSprite) or (!insideView_Spr() and checkFullSprite))
and !place_meeting(x, y, objEnemySpawnArea)) {

	mySectionArrowRight = place_meeting(x, y, objSectionArrowRight)
	mySectionArrowLeft = place_meeting(x, y, objSectionArrowLeft)
	mySectionArrowUp = place_meeting(x, y, objSectionArrowUp)
	mySectionArrowDown = place_meeting(x, y, objSectionArrowDown)
	mySectionBorderVertical = place_meeting(x-(16*sign(xspeed)), y, objSectionBorderVertical)
	
	if mySectionArrowRight
	|| mySectionArrowLeft
	|| mySectionArrowUp
	|| mySectionArrowDown
	|| mySectionBorderVertical {
		outsideSection = true;
	}
}

//"Die" (doesn't actually destroy the enemy though)
if healthpoints <= 0 {
    event_user(15);
    if canInitDeath {
        beenOutsideView = false;
		outsideSection = true;
        visible = false;
        dead = true;    //Enemies don't actually destroy themselves, they become invisible and all collision is neglected
        x = xstart;     
        y = ystart;
        canInitDeath = false;
        xspeed = 0;
        yspeed = 0;
    }   
}

//Respawning
if respawn {
    if beenOutsideView && (((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite)) || (mySpawnArea != noone and insideViewObj_Spr(mySpawnArea))) {
        visible = true;
        dead = false;
		dying = false;
        healthpoints = healthpointsStart;
        canInitDeath = true;
        beenOutsideView = false;
		deathChecked = false;
    }
}
else if dead {
    with mySpawnArea instance_destroy();
	with myActionArea instance_destroy();
	instance_destroy(); //If we can't respawn, there's no point to still be able to execute any code. Destroying the instance saves memory and processing power
}

if (((!((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite))) && (mySpawnArea == noone or !insideViewObj_Spr(mySpawnArea)) && (myActionArea == noone or !insideViewObj_Spr(myActionArea))) || outsideSection) and !neverDespawn {
    beenOutsideView = true;
    
    x = xstart;
    y = ystart;
    healthpoints = 0;
    dead = true;
    visible = false;
    xspeed = 0;
    yspeed = 0;

}

if ((!((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite))) && (mySpawnArea == noone or !insideViewObj_Spr(mySpawnArea))) and outsideSection
	outsideSection = false;
    
if dead {
    xspeed = 0;
    yspeed = 0;
    exit;
}

if !global.frozen and !dead and !dying {
	if instance_exists(prtPlayer) {
		player_x = prtPlayer.x;
		player_y = prtPlayer.y;
	}
}

