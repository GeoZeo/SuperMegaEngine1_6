/// @description  Event: onDeath - called when the enemy is killed
if alive {
	//Death animation
	alive = false;
	canInitDeath = false;
	hitbox_left = 0;
	hitbox_top = 0;
	hitbox_right = 0;
	hitbox_bottom = 0;
	contactDamage = 0;
	nullifyDeath(false);
	dying = true;
	xspeed = 0;
	yspeed = 0;
	visible = false;
}

