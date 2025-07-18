//pause self
if screen_pause() == true {exit;};

//move
	xSpeed = lengthdir_x(bulletSpeed, dir);
	ySpeed = lengthdir_y(bulletSpeed, dir);
	
	x += xSpeed;
	y += ySpeed;
	
	//depth
	depth = -y;
	
//cleanup
#region
	//hit confirm destroy
	if hitConfirm == true && enemyDestroy == true {
		destroy = true; 
	}

	//destroy
	if destroy == true {
		//shot burst
		if oneForthBurst == true {
			create_animated_vfx(sShootBurst, x, y, depth - 25, 0, 0.25, 0.25);
		} else {
			create_animated_vfx(sShootBurst, x, y, depth - 25);
		}
		
		//destroy
		instance_destroy();
	}
	
	//collision
	if place_meeting(x, y, oSolidWall) {
		destroy = true;
	}
	
	//bullet out of range
	if point_distance(xstart, ystart, x, y) > maxDist {
		destroy = true;
	}
#endregion