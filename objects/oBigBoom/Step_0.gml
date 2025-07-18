//pause self
if screen_pause() == true {exit;};

//create damage objects
if createdDamageObjects == false {
	
	//create an object to damage enemies
	enemyDamageInst = instance_create_depth(x, y, 0, oDamageEnemy);
	with(enemyDamageInst) {
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	//create an object to damage the player
	playerDamageInst = instance_create_depth(x, y, 0, oDamagePlayer);
	with(playerDamageInst) {
		damage = 5;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	//set created varible to true to stop more damage objects from being created
	createdDamageObjects = true;
}

//get rid of the damage objects once they are done
if floor(image_index) > 2 {
	//destroy
	if instance_exists(enemyDamageInst) {
		instance_destroy(enemyDamageInst);	
	}
	if instance_exists(playerDamageInst) {
		instance_destroy(playerDamageInst);	
	}
}