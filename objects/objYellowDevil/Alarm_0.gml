/// @description  Create block
var block_id = instance_number(objYellowDevilBlock);
var block = instance_create(__view_get( e__VW.XView, 0 ) - 100, __view_get( e__VW.YView, 0 ) + blockY[block_id] * 16 + offsetY, objYellowDevilBlock);
block.block_id = block_id;
block.col = blockX[block_id];
block.row = blockY[block_id];
block.xpos = blockX[block_id] * 16 + offsetX;
block.ypos = blockY[block_id] * 16 + offsetY;
block.delay = block_delay;

if block_id < blocks - 1 {
    alarm[0] = room_speed * block_delay;
}

