// Inherit the parent event
event_inherited();

damage = 4;

moveDir = 0;
moveSpeed = 4;
xSpeed = 0;
ySpeed = 0;

start_x = x;
start_y = y;
travel_max = 0; //how many pixels before it auto-dies

//state machine
/*
  0 - not moving, aim, wait to shoot
  1 - shoot around the enemy
*/
state = 0; 

//clean up
destroy = false;
playerDestroy = true;