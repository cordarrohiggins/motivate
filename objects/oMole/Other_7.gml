// In the Animation End event
if (state == -1 && sprite_index == sMoleSpawn) {
    // spawn is done so switch into Idle
    state = 0;
    sprite_index = sMole;
    image_index = 0;
	mask_index = sMole;
}

// only run this code if we just finished the attack animation
if state == 1 && sprite_index == sMoleJump {
    //shoot
	shootTimer++;
	num_bullets  = irandom_range(3, 6);
				
	//create the bullet
	if shootTimer == 1 {
		// spawn your projectiles in a spread
		var angle_step = 360 / num_bullets;
		for (var i = 0; i < num_bullets; i++) {
			var a = i * angle_step;
			bulletInst = instance_create_depth(x, y, depth, oEnemyRock);
				
			// initialize its state‐machine variables:
			bulletInst.state = 1;
			bulletInst.moveDir = a;
			bulletInst.travel_max = 128;
		}
		//play sound
		oSFX.throwRockSnd = true;
	} 
			
	//go back to idle
	state = 0;
	sprite_index = sMole;
	image_index  = 0;
				
	//reset the timer
	shootTimer = 0;
}