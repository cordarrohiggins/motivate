// In the Animation End event
if (state == -1 && sprite_index == sCripSlowRise) {
    // spawn is done so switch into Idle
    state = 0;
    sprite_index = sCripMole;
    image_index = 0;
	mask_index = sCripMole;
}

//launch circle attack
if state == 1 && sprite_index == sCripFastRise {
    //shoot
	shootTimer++;
	num_bullets = irandom_range(8, 16);
				
	//create the bullets
	if shootTimer == 1 {
		// spawn your projectiles in a spread
		var angle_step = 360 / num_bullets;
		for (var i = 0; i < num_bullets; i++) {
			var a = i * angle_step;
			bulletInst = instance_create_depth(x, y, depth, oEnemyRock);
				
			// initialize its state‐machine variables:
			bulletInst.state = 1;
			bulletInst.moveDir = a;
			bulletInst.travel_max = 200;
			bulletInst.image_xscale = 2;
			bulletInst.image_yscale = 2;
		}
		//play sound
		oSFX.throwRockSnd = true;
	} 
			
	//go back to idle
	state = 0;
	sprite_index = sCripMole;
	image_index  = 0;
	mask_index = sCripMole;
				
	//reset the timer
	shootTimer = 0;
}
//fall animation before circle attack
if state == 1 && sprite_index == sCripSlowFall {
	oSFX.cripMoleCircleSnd = true;
	sprite_index = sCripFastRise;
	image_index  = 0;
	mask_index = sCripFastRise;
}


//launch direct attack
if state == 2 && sprite_index == sCripFastRise {
    //shoot
	shootTimer++;
	num_bullets = 1;
				
	//create the bullet
	if shootTimer == 1 {
		// spawn your projectile
		//get player location
		if instance_exists(oPlayer) {
			var a = point_direction(x, y, oPlayer.x, oPlayer.y)
			bulletInst = instance_create_depth(x, y, depth, oEnemyRock);
				
			// initialize its state‐machine variables:
			bulletInst.state = 1;
			bulletInst.moveDir = a;
			bulletInst.travel_max = 250;
			bulletInst.image_xscale = 3;
			bulletInst.image_yscale = 3;
			bulletInst.damage = 6;
			
			//play sound
			oSFX.throwRockSnd = true;
		}
	} 
	
	//go back to idle
	state = 0;
	sprite_index = sCripMole;
	image_index = 0;
	mask_index = sCripMole;
				
	//reset the timer
	shootTimer = 0;
}
//fall animation before direct attack
if state == 2 && sprite_index == sCripSlowFall {
	oSFX.cripMoleDirectSnd = true;
	sprite_index = sCripFastRise;
	image_index  = 0;
	mask_index = sCripFastRise;
}

//teleport/dig to player
if state == 3 && sprite_index == sCripSlowFall {
    //shoot
	shootTimer++;
				
	//teleport/dig
	if shootTimer == 1 {
		x = oPlayer.x + irandom_range(5, 15);
		y = oPlayer.y + irandom_range(5, 15);
	} 
			
	//go back to spawn animation
	state = -1;
	sprite_index = sCripSlowRise;
	image_index = 0;
	mask_index = sCripSlowRise;
	oSFX.cripMoleDigSnd = true;
				
	//reset the timer
	shootTimer = 0;
}

//summon moles
if state == 4 && sprite_index == sCripSummon {
    //shoot
	shootTimer++;
	num_bullets = irandom_range(1, 5);
	
	var _distance = 0;
	// only let moles spawn around boss if close to the middle
    if point_distance(x, y, oBossSpawn.x, oBossSpawn.y) <= 200 {
        _distance = 50;
    } else {
		_distance = 0;
		num_bullets = 1;
	}
			
	oSFX.cripMoleSummon2Snd = true;
	
	//create the moles
	if shootTimer == 1 {
		// spawn the moles in a spread
		var angle_step = 360 / num_bullets;
		for (var i = 0; i < num_bullets; i++) {
			var a = i * angle_step;
			// compute the offset spawn position
	        var spawn_x = x + lengthdir_x(_distance, a);
	        var spawn_y = y + lengthdir_y(_distance, a);
			
			bulletInst = instance_create_depth(spawn_x, spawn_y, depth, oMole);
		}
	} 
			
	//go to teleport/dig
	state = 3;
	sprite_index = sCripSlowFall;
	image_index = 0;
	mask_index = sCripSlowFall;
	oSFX.cripMoleDigSnd = true;
				
	//reset the timer
	shootTimer = 0;
}

//hide 
if state == 5 && sprite_index == sCripHole {
	//go back to spawn animation
	state = -1;
	sprite_index = sCripSlowRise;
	image_index  = 0;
	mask_index = sCripSlowRise;
	oSFX.cripMoleDigSnd = true;
}
//go down to hide
if state == 5 && sprite_index == sCripSlowFall {
	sprite_index = sCripHole;
	image_index  = 0;
	mask_index = sCripHole;
}