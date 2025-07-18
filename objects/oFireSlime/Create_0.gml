// Inherit the parent event
event_inherited();

hp = 125;
moveSpeed = 0;
chaseSpeed = 0.3;
moveDir = 0;
xSpeed = 0;
ySpeed = 0;

face = 3;
sprite[0] = sFireSlimeRight;
sprite[1] = sFireSlimeUp;
sprite[2] = sFireSlimeLeft;
sprite[3] = sFireSlimeDown;

//state machine
/*
 -1 - spawn from spawner
  0 - moving towards player
  1 - pause and shoot towards the player
*/
state = 0;
	//spawn from spawner state
	fadeSpeed = 1/15;
	emergeSpeed = 0.25;

	//shooting state
	cooldownTime = 5*60;
	shootTimer = irandom(cooldownTime);
	windupTime = 60;
	recoverTime = 45;
	bulletInst = noone;
	
	bulletXoff = 0;
	bulletYoff = 0;