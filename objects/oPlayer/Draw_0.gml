//draw the weapon behind the player
	if aimDir >= 0 && aimDir < 180 {
		draw_my_weapon();	
	}

//draw the player
	draw_self();

//draw the weapon in front of the player
	if aimDir >= 180 && aimDir < 360 {
		draw_my_weapon();	
	}