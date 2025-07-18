//pause self
if screen_pause() == true {exit;};

//state machine
switch(state) {
	//wait for enemy to shoot state
	case 0:
		//aim for the player
		if instance_exists(oPlayer) {
			moveDir = point_direction(x, y, oPlayer.x, oPlayer.y);
		}
		
		//set depth to make more visible
		depth = -y - 50;
	break;
	
	//shoot and travel
	case 1:
		//movement
		xSpeed = lengthdir_x(moveSpeed, moveDir);
		ySpeed = lengthdir_y(moveSpeed, moveDir);
		x += xSpeed;
		y += ySpeed;
		
		//updated depth
		depth = -y;
	break;
}

//clean up
	//out of room bounds
	var _pad = 16; //insures object only deletes once completely off screen
	if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height + _pad {
		destroy = true;	
	}
	
	//destroy instance
	if destroy == true {
		//shot burst
		create_animated_vfx(sShootBurst, x, y, depth - 25);
		
		//destroy
		instance_destroy();	
	}
	
	//wall colision
	if place_meeting(x, y, oSolidWall) {
		destroy = true;
	}
	
	//player collision
	if place_meeting(x, y, oPlayer) && playerDestroy == true {
		destroy = true;	
	}