// Inherit the parent event
event_inherited();

hp = 100;
moveSpeed = 0;
chaseSpeed = 0.5;
moveDir = 0;
xSpeed = 0;
ySpeed = 0;

face = 3;
sprite[0] = sSlimeRight;
sprite[1] = sSlimeUp;
sprite[2] = sSlimeLeft;
sprite[3] = sSlimeDown;

//state machine
/*
 -1 - spawn from spawner
  0 - moving towards player
*/
state = 0;
	//spawn from spawner state
	fadeSpeed = 1/15;
	emergeSpeed = 0.25;
		