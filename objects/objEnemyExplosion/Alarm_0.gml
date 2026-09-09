instance_destroy();

var n_enemy = instance_create(my_x, my_y, my_enemy);
n_enemy.respawn = false;
n_enemy.player_x = my_player_x;
n_enemy.player_y = my_player_y;
with n_enemy event_user(1);

