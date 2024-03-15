/// @description  mergeBlocksHorizontal(type)
function mergeBlocksHorizontal(argument0) {
	var type = argument0;
	var next;

	with type {
	    if instance_exists(self) {
	        next = instance_position(x + sprite_width, y, type);
	        while(next > - 1 && image_yscale == next.image_yscale && object_index == next.object_index && !object_is_ancestor(next.object_index, prtSolidGimmick)) {
	            image_xscale += next.image_xscale;
	            with next instance_destroy();
	            next = instance_position(x + sprite_width, y, type);
	        }
	    }
	}



}
