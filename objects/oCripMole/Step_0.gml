//pause self
if screen_pause() == true {exit;};

//code commands
var _getDamage = true;
var _wallCollisions = true;

//state machine
switch(state) {
	//spawn in
	case -1:
		damage = 4;
		
		//be immune
		_getDamage = false;
	
		// do nothing - wait for the animation to finish
        break;
	
	//idle state
	case 0:
		damage = 8;
	
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
			var _attackChoice = irandom_range(1, 5);
			state = _attackChoice;
			shootTimer = 0; //reset the timer
			
			if _attackChoice == 1 {
				//circle rock attack
				state = 1;
				oSFX.cripMoleDigSnd = true;
				sprite_index = sCripSlowFall;
				image_index  = 0; //restart the attack animation
				mask_index = sCripSlowFall;
			} else if _attackChoice == 2 {
				//direct rock attack
				state = 2;
				oSFX.cripMoleDigSnd = true;
				sprite_index = sCripSlowFall;
				image_index  = 0; //restart the attack animation
				mask_index = sCripSlowFall;
			} else if _attackChoice == 3 {
				//teleport/dig attack
				state = 3;
				oSFX.cripMoleDigSnd = true;
				sprite_index = sCripSlowFall;
				image_index  = 0; //restart the attack animation
				mask_index = sCripSlowFall;
			} else if _attackChoice == 4 {
				//summon other moles attack
				state = 4;
				oSFX.cripMoleSummon1Snd = true;
				sprite_index = sCripSummon;
				image_index  = 0; //restart the attack animation
				mask_index = sCripSummon;
			} else if _attackChoice == 5 {
				//hide
				state = 5;
				oSFX.cripMoleDigSnd = true;
				sprite_index = sCripSlowFall;
				image_index  = 0; //restart the attack animation
				mask_index = sCripSlowFall;
			}
		}
		
		break;
	
	//pause and shoot in a circle state
	case 1:
		//do nothing here; wait for the animation to finish
		break;
		
	//pause and shoot directly state
	case 2:
		//do nothing here; wait for the animation to finish
		break;
		
	//teleport/dig state
	case 3:
		//do nothing here; wait for the animation to finish
		break;
		
	//summon state
	case 4:
		//do nothing here; wait for the animation to finish
		break;
		
	//hide state
	case 5:
		damage = 0;
		//be immune
		_getDamage = false;
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