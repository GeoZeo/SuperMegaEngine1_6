/// @description  mergeBlocks()
function mergeBlocks() {
	mergeBlocksHorizontal(objSolid);
	mergeBlocksHorizontal(objTopSolid);
	mergeBlocksHorizontal(objIce);
	mergeBlocksHorizontal(objSpike);
	mergeBlocksHorizontal(objWater);
	mergeBlocksHorizontal(objSectionArrowUp);
	mergeBlocksHorizontal(objSectionArrowDown);

	mergeBlocksVertical(objSolid);
	//mergeBlocksVertical(objTopSolid); This causes collisions inside globs of bunched-together topsolids to not work.
	mergeBlocksVertical(objIce);
	mergeBlocksVertical(objSpike);
	mergeBlocksVertical(objWater);
	mergeBlocksVertical(objLadder);
	mergeBlocksVertical(objSectionArrowLeft);
	mergeBlocksVertical(objSectionArrowRight);



}
