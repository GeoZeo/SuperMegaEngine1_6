function check_enemy_death() {
	//check_enemy_death()
	if !deathChecked {
		if healthpoints <= 0 && object_get_parent(object_index) != prtMiniBoss && object_get_parent(object_index) != prtBoss && object_get_parent(object_index) != prtFortressBoss {
		    if canSpawnItem {
				if !instantItemSpawn && other.object_index != objHornetChaser {
					var myExplosion = instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objItemExplosion);
				}
				else {
					instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
					randomDrop();
					
					if other.object_index == objHornetChaser {
						with other {
							var myItem = instance_position(other.x - 8, other.y - 8, prtPickup)
							if myItem >= 0 && myItem.id_of_origin == other {
								target = myItem;
								myItem.targetedBy = object_index;
							}
						}
					}
				}
			}
			else {
				instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
			}
			
			deathChecked = true;
		}
	}



}
