function instance_number_alive(argument0) {
	//instance_number_alive(obj)
	count = 0;
	with argument0 {
	    if !dead {
	        other.count++;
	    }
	}
	return count;



}
