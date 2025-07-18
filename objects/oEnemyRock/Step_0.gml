//pause self
if screen_pause() == true {exit;};

//state machine
switch(state) {
	//wait for enemy to shoot state
	case 0:
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
		
		// auto-destroy after traveling travel_max pixels
        if point_distance(start_x, start_y, x, y) >= travel_max {
            destroy = true;
        }
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
		if image_xscale == 2 {
			create_animated_vfx(sShootBurst, x, y, depth - 25, 0, 2, 2);
		} else if image_xscale == 3 {
			create_animated_vfx(sShootBurst, x, y, depth - 25, 0, 3, 3);
		} else {
			create_animated_vfx(sShootBurst, x, y, depth - 25, 0, 1, 1);
		}
		
		oSFX.rockBreakSnd = true;
		
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