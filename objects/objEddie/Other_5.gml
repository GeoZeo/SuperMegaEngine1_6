if global.eddieInstance == id global.eddieInstance = -1;

if called && itemsLeft >= itemsCalled
{
	objEddieEquip.count++;
	if objEddieEquip.count >= objEddieEquip.maxUnits
		objEddieEquip.count = objEddieEquip.maxUnits;
}