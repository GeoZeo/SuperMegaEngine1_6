/// @description  mergeBlocksVertical(type)
function mergeBlocksVertical(argument0) {
	var type = argument0;
	var next;

	with type {
	    if instance_exists(self) {
	        next = instance_position(x, y + sprite_height, type);
	        while(next > - 1 && image_xscale == next.image_xscale && object_index == next.object_index && !object_is_ancestor(next.object_index, prtSolidGimmick)) {
	            image_yscale += next.image_yscale;
	            with next instance_destroy();
	            next = instance_position(x, y + sprite_height, type);
	        }
	    }
	}



}
