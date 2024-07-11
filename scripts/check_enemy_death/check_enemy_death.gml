function check_enemy_death() {
	//check_enemy_death()
	if !deathChecked {
		if healthpoints <= 0 && object_get_parent(object_index) != prtMiniBoss && object_get_parent(object_index) != prtBoss && object_get_parent(object_index) != prtFortressBoss {
		    if canSpawnItem {
				if !instantItemSpawn {
					var myExplosion = instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objItemExplosion);
				}
				else {
					instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
					randomDrop();
				}
			}
			else {
				instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
			}
			
			deathChecked = true;
		}
	}



}
