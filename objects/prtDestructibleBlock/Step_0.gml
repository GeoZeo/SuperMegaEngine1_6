if !dead {
    visible = true;
	isHit = false;

}

//This code fixes a bug where off-screen destructible blocks can be destroyed with your weapons
//if they happen to be right outside a screen border.
if insideView() {
	solid = true;
	canPlayerInteract = true;
	
}
else {
	solid = false;
	canPlayerInteract = false;
	
}