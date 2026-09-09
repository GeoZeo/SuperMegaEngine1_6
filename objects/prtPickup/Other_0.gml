//This means it's dropped by an enemy
if variable_instance_exists(id, "index_of_origin") and (object_is_ancestor(index_of_origin, prtEnemy) or index_of_origin == objItemExplosion or index_of_origin == objEddie)
    instance_destroy();

