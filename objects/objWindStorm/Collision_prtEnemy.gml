if (object_is_ancestor(other.object_index, prtBoss) && !object_is_ancestor(other.object_index, prtFortressBoss))
|| object_is_ancestor(other.object_index, prtMiniBoss) {
    checkDeath = true;
}

event_inherited();

if !other.dead && !other.dying && other.healthpoints <= 0 && !object_is_ancestor(other.object_index, prtBoss) && !object_is_ancestor(other.object_index, prtMiniBoss) && !object_is_ancestor(other.object_index, prtFortressBoss) {
    var windID;
    windID = instance_create(sprite_get_xcenter_object(other), sprite_get_ycenter_object(other), objEnemyWindStorm);
    windID.enemySpr = other.sprite_index;
    windID.enemyImg = other.image_index;
    windID.enemyXScale = other.image_xscale;
    windID.enemyYScale = other.image_yscale;
    windID.enemyAngle = other.image_angle;
    windID.image_index = image_index;
    windID.image_speed = image_speed;
    windID.image_xscale = image_xscale;
    windID.contactDamage = other.contactDamage;
        
    other.dead = false;
	other.dying = false;
}

