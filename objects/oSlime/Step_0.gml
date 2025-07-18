//pause self
if screen_pause() == true {exit;};

//code commands
var _wallCollisions = true;
var _getDamage = true;

//state machine
switch(state) {
	//spawn in from spawnerslime object
	case -1:
		//fade in
		if image_alpha < 1 {
			//don't walk while fading in
			moveSpeed = 0;
			moveDir = 270;
			image_alpha += fadeSpeed;
		}
		
		//walk out
		_wallCollisions = false;
		_getDamage = false;
		
		if image_alpha >= 1 {
			//set the right speed and direction
			moveSpeed = emergeSpeed;
			moveDir = 270;
		}
		
		//switch to chasing state after out of spawner
		if !place_meeting(x, y, oWall) {
			state = 0;	
		}
		
	break; 
	
	//chase state
	case 0:
		//chase player code here
			//get player location
			if instance_exists(oPlayer) {
				moveDir = point_direction(x, y, oPlayer.x, oPlayer.y)
			}
			
			//set correct speed
			moveSpeed = chaseSpeed;
	break;
	
}

//move the enemy
#region
	//getting the speeds
		xSpeed = lengthdir_x(moveSpeed, moveDir);
		ySpeed = lengthdir_y(moveSpeed, moveDir);
	
	//get the correct face
	face = round(moveDir/90);
		if face == 4 {face = 0;};
		
		//set the sprite
		mask_index = sprite[3];
		sprite_index = sprite[face]; 
		
		/* code for only having one sprite that flips
		if moveDir > 90 && moveDir < 270 {face = -1;} else {face = 1;};
		*/
		
	//collision
		//wall collision
		if _wallCollisions == true {
			if place_meeting(x + xSpeed, y, oWall) {
				xSpeed = 0;
			}
			if place_meeting(x, y + ySpeed, oWall) {
				ySpeed = 0;
			}
		}
		//enemy collisions
		if place_meeting(x + xSpeed, y, oEnemyParent) {
			xSpeed = 0;
		}
		if place_meeting(x, y + ySpeed, oEnemyParent) {
			ySpeed = 0;
		}
	
	//moving
		x += xSpeed;
		y += ySpeed;
		
	//depth
	depth = -y; //negatives are placed above positives
#endregion

// Inherit the parent event
	//getting damaged and dying
	if _getDamage == true {
		event_inherited();
	}