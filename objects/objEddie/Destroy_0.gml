if called && !delivered 
{
	objEddieEquip.count++;
	if objEddieEquip.count >= objEddieEquip.maxUnits
		objEddieEquip.count = objEddieEquip.maxUnits;
}