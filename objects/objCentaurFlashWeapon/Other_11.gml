/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

attackID = instance_create(prtPlayer.x, sprite_get_ycenter_object(prtPlayer), objCentaurFlash);

with attackID
{
	backShader = instance_create(x, y, objBackTileShader);
	backShaderReset = instance_create(x, y, objBackTileShaderReset);
	frontShader = instance_create(x, y, objFrontTileShader);
	frontShaderReset = instance_create(x, y, objFrontTileShaderReset);
}

