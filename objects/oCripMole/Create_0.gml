// Inherit the parent event
event_inherited();

damage = 4;

hp = 2500;
moveSpeed = 0;
chaseSpeed = 1;
moveDir = 0;
xSpeed = 0;
ySpeed = 0;

sprite[0] = sCripSlowRise;
sprite[1] = sCripMole;
sprite[2] = sCripSlowFall;
sprite[3] = sCripFastRise;
sprite[4] = sCripSummon;
sprite[5] = sCripHole;

oSFX.cripMoleDigSnd = true;
oSFX.cripMoleSpawnSnd = true;

//state machine
/*
 -1 - spawn from ground
  0 - idle
  1 - launch circle attack
  2 - launch direct attack
  3 - teleport/dig to player
  4 - summon moles
  5 - hide
*/
state = -1;
	//spawn from spawner state
	mask_index = sCripSlowRise;
	
	//shooting state
	num_bullets = 0;
	attack_range = 225;

	cooldownTime = 6*60;
	shootTimer = irandom(cooldownTime);
	bulletInst = noone;