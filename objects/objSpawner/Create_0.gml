event_inherited();

obj = noone;
maxObjs = 3;
interval = 3 * room_speed;
counter = 0;
visible = false;
dx = 0;
dy = 0;
player_x = 0;
player_y = 0;
player_image_xscale = 1;
checkPlayerSpriteCenter = true;

//Area the player needs to be in for the spawner to be active
spawn_area_x1 = -1000000;
spawn_area_x2 = -1000000;
spawn_area_y1 = -1000000;
spawn_area_y2 = -1000000;

//You can set custom despawn thresholds for instances here
instance_spawn_area_x1 = -1000000;
instance_spawn_area_x2 = -1000000;
instance_spawn_area_y1 = -1000000;
instance_spawn_area_y2 = -1000000;

instance_action_area_x1 = -1000000;
instance_action_area_x2 = -1000000;
instance_action_area_y1 = -1000000;
instance_action_area_y2 = -1000000;

followCamera = false; //Endlessly spawn instances that come from the edge of the screen?
enum spawn_edges {BOTTOM, TOP, LEFT, RIGHT, BACK, FRONT};
spawn_edge = spawn_edges.FRONT;
view_incl = true;
centre_incl = false;

