/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

ammo += consumption;    //Return amount decreased by parent

if instance_number(objRushCoil) < 1 {
    var tpY, airIncrease;
    tpY = 0;
    if prtPlayer.ground
        airIncrease = 0;
    else
        airIncrease = 20; //When in the air, the upwards range is reduced because Rush could otherwise spawn above ceilings
    
    
    while !(!position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objSolid) && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformSolid)
    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objTopSolid) && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
    && (position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid)
    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough)))
    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
    && !(position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoor)
    && tpY <= 12+52 {
        tpY++;
    }
    
    if position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid)
    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid)
    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid)
    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough) {
        if position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid) {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.y-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale =prtPlayer.image_xscale;
        }
        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid) {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.bbox_top-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale =prtPlayer.image_xscale;
        }
        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid) {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.y-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale =prtPlayer.image_xscale;
        }
        else {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.bbox_top-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale =prtPlayer.image_xscale;
        }
    }
    else if !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objSolid)
    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformSolid)
    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objTopSolid)
    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
    && !position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objBossDoor)
    && (position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid)
    || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) || position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough)) {
        if position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.y-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale = prtPlayer.image_xscale;
        }
        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid) {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.bbox_top-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale = prtPlayer.image_xscale;
        }
        else if position_meeting(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.y-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale = prtPlayer.image_xscale;
        }
        else {
            var solidID = instance_position(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough);
            attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, solidID.bbox_top-16, objRushCoil);
            attackID.shouldLand = true;
            attackID.image_xscale = prtPlayer.image_xscale;
        }
    }
    else {
        attackID = instance_create(prtPlayer.x+prtPlayer.image_xscale*26, sprite_get_ycenter_object(prtPlayer), objRushCoil);
        attackID.shouldLand = false;
        attackID.image_xscale = prtPlayer.image_xscale;
    }
    prtPlayer.isShoot = false;
}
else {
    with objMegaBusterWeapon event_user(1);
}

