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
					
				//transition to shooting state
					var _camLeft = camera_get_view_x(view_camera[0]);
					var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
					var _camTop = camera_get_view_y(view_camera[0]);
					var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
					
					//only add to timer if onscreen
					if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom {
						shootTimer++;
					}
					
					if shootTimer > cooldownTime {
						//go to shoot state 
						state = 1;
						
						//reset the timer
						shootTimer = 0;
					}
		break;
	
	//pause and shoot state
		case 1:
		#region
			//get player location
				if instance_exists(oPlayer) {
					moveDir = point_direction(x, y, oPlayer.x, oPlayer.y)
				}
				
			//set the correct speed
				moveSpeed = 0;
			
			//stop amimating
				image_index = 0;
				
			//set offsets for each direction
				if face = 0 {
					bulletXoff = 10;
					bulletYoff = -4;
				}
				if face = 1 {
					bulletXoff = 0;
					bulletYoff = -16;
				}
				if face = 2 {
					bulletXoff = -10;
					bulletYoff = -4;
				}
				if face = 3 {
					bulletXoff = 0;
					bulletYoff = 0;
				}
				
			//shoot
				shootTimer++;
				
				//create the bullet
				if shootTimer == 1 {
					bulletInst = instance_create_depth(x + bulletXoff, y + bulletYoff, depth, oEnemyFire);
					//play sound
					oSFX.fireBallSnd = true;
				} 
				
				//keep the bullet in the enemys hand
				if shootTimer <= windupTime && instance_exists(bulletInst) {
					bulletInst.x = x + bulletXoff;
					bulletInst.y = y + bulletYoff;
				}
				
				//shoot the bullet after the windup time is over
				if shootTimer == windupTime && instance_exists(bulletInst) {
					bulletInst.state = 1;
				}
				
				//recover and return to chasing
				if shootTimer > windupTime + recoverTime {
					//go back to chasing
					state = 0;
					
					//reset the timer
					shootTimer = 0;
				}
		break;
		#endregion
}

//move the enemy
#region
	
	//getting the speeds
		xSpeed = lengthdir_x(moveSpeed, moveDir);
		ySpeed = lengthdir_y(moveSpeed, moveDir);
	
	//get the correct face
	face = round(moveDir/90);
		if face == 4 {face = 0;};
		
		//set the enemys sprite
		mask_index = sprite[3];
		sprite_index = sprite[face];
		
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
		event_inherited();

