if global.frozen == false
{
    //Run step code for current control mode
	playerStepMode();

}
else
{	
    image_speed = 0;
	
	//Death delay (if applicable)
	playerDeathTimer();
}

