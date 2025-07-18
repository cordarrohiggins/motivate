//pause self
if screen_pause() == true {exit;};

//code commands
var _wallCollisions = true;
var _getDamage = true;

//state machine
switch(state) {
	//spawn in
	case -1:
		//be immune
		_getDamage = false;
	
		// do nothing - wait for the animation to finish
        break;
	
	//idle state
	case 0:
		//transition to shooting state
		var _camLeft = camera_get_view_x(view_camera[0]);
		var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera[0]);
		var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
					
		//only add to timer if onscreen
		if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom {
			shootTimer++;
		}
					
		// check if the player is in range to attack
		if distance_to_object(oPlayer) < attack_range && shootTimer > cooldownTime {
			//go to shoot state 
			state = 1;
					
			//reset the timer
			shootTimer = 0;
			
			oSFX.moleDigSnd = true;
			
			sprite_index = sMoleJump;
			image_index = 0; // restart the attack animation
			mask_index = sMoleJump;
		}

		break;
	
	//pause and shoot state
	case 1:
		//do nothing here; wait for the animation to finish
				
		break;
}

//move the enemy
#region
	
	//getting the speeds
		xSpeed = lengthdir_x(moveSpeed, moveDir);
		ySpeed = lengthdir_y(moveSpeed, moveDir);
		
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