event_inherited();

dir = 0;
bulletSpeed = 5;
xSpeed = 0;
ySpeed = 0;

//cleanup
dirFix = false; //only needed in some cases, fixes if bullet spawns facing wrong way
maxDist = 225;
damage = 15;
destroy = false;
enemyDestroy = true; //if false, bullet travels through enemies 
oneForthBurst = false; //0.25 scaled bullet burst