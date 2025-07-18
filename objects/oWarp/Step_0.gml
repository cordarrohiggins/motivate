//put the player in the correct coordinates after the room transition has happened
if room == targetRoom {
	//new coordinates based on targetObj
		//get player to the right coordinates and correct facing direction
		oPlayer.x = targetObj.x;
		oPlayer.y = targetObj.y;
		oPlayer.face = targetObj.image_index;
		
		/*
		//make player face the right direction and update centerY since the players code is currently frozen by this object
		with(oPlayer) {
			sprite_index = sprite[face];
			aimDir = face * 90;
			centerY = y + centerYOffset;
		}
		*/
}

//destroy self when done with reverse animating
if image_speed == -1 && image_index < 1 {
	instance_destroy();	
}