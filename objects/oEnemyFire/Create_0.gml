// Inherit the parent event
event_inherited();

damage = 2;

moveDir = 0;
moveSpeed = 2;
xSpeed = 0;
ySpeed = 0;

//state machine
/*
  0 - not moving, aim, wait to shoot
  1 - shoot towards the player
*/
state = 0; 

//clean up
destroy = false;
playerDestroy = true;