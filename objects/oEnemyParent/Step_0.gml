//recieve damage
	get_damaged(oDamageEnemy);

//death
	if hp <= 0 {
		//add to the total enemies killed
		if !instance_exists(oCripMole) {
			if room_get_name(room) == "rm_level1" {
				global.enemyKillCount1++;
			} else if room_get_name(room) == "rm_level2" {
				global.enemyKillCount2++;
			} else if room_get_name(room) == "rm_level3" {
				global.enemyKillCount3++;
			} else if room_get_name(room) == "rm_level4" {
				global.enemyKillCount4++;
			} else if room_get_name(room) == "rm_level5" {
				global.enemyKillCount5++;
			}
		}
		
		//determine if we should drop an item
		var _chance = irandom(100);
		
		if _chance < 10 {
			instance_create_depth(x, y, depth, oHeart);
		}
		
		//death vfx
		create_animated_vfx(sSmallBoom, x, y, depth);
		
		//destroy self
		instance_destroy();	
	}