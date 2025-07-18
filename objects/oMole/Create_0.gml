// Inherit the parent event
event_inherited();

hp = 175;
moveSpeed = 0;
chaseSpeed = 0;
moveDir = 0;
xSpeed = 0;
ySpeed = 0;

sprite[0] = sMoleSpawn;

oSFX.moleDigSnd = true;

//state machine
/*
 -1 - spawn from ground
  0 - idle
  1 - launch attack
*/
state = -1;
	//spawn from spawner state
	mask_index = sMoleSpawn;

	//shooting state
	num_bullets = irandom_range(3, 6);
	attack_range = 160;

	cooldownTime = 10*60;
	shootTimer = irandom(cooldownTime);
	bulletInst = noone;