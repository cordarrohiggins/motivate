//pause self
if screen_pause() == true {exit;};

//spawn enemy
	timer++;
	
	//reset timer when enemy limits are reached
	if instance_number(oEnemyParent) >= global.activeEnemyMax {
		timer = 0;	
	}
	if room_get_name(room) == "rm_level1" {
		if global.totalEnemiesSpawned1 >= global.enemyRoomMax {
			timer = 0;
			face = 1;
			sprite_index = sprite[face];
		}
	} else if room_get_name(room) == "rm_level2" {
		if global.totalEnemiesSpawned2 >= global.enemyRoomMax {
			timer = 0;
			face = 1;
			sprite_index = sprite[face];
		}
	} else if room_get_name(room) == "rm_level3" {
		if global.totalEnemiesSpawned3 >= global.enemyRoomMax {
			timer = 0;
			face = 1;
			sprite_index = sprite[face];
		}
	} else if room_get_name(room) == "rm_level4" {
		if global.totalEnemiesSpawned4 >= global.enemyRoomMax {
			timer = 0;
			face = 1;
			sprite_index = sprite[face];
		}
	} else if room_get_name(room) == "rm_level5" {
		if global.totalEnemiesSpawned5 >= global.enemyRoomMax {
			timer = 0;
			face = 1;
			sprite_index = sprite[face];
		}
	}

	if timer >= spawnTime && !place_meeting(x, y + 16, oEnemyParent){
		//create an enemy 
		var _inst = instance_create_depth(x, y, depth-1, oFireSlime);
		with(_inst) {
			//make enemy invisible at first
			image_alpha = 0;
			state = -1;
		}
	
		//reset the timer
		timer = 0;
		spawnTime = irandom_range(13, 15) * 60;
	}