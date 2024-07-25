/// @description Creates an instance of a given object at a given position.
/// @param x The x position the object will be created at.
/// @param y The y position the object will be created at.
/// @param obj The object to create an instance of.
function instance_create(argument0, argument1, argument2) {
	var myDepth = object_get_depth( argument2 );
	var myInstance = instance_create_depth( argument0, argument1, myDepth, argument2 );
	if instance_exists(myInstance)
	{
		if id > -1 && id != noone 
		{
			myInstance.id_of_origin = id;
			myInstance.index_of_origin = object_index;
		}
	}
	
	return myInstance;
		



}
