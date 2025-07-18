if room_get_name(room) == "rm_level1" {
	if (global.enemyKillCount1 == global.enemyRoomMax) {
		oSFX.levelEndSnd = true;
		instance_destroy();	
	}
} else if room_get_name(room) == "rm_level2" {
	if (global.enemyKillCount2 == global.enemyRoomMax) {
		oSFX.levelEndSnd = true;
		instance_destroy();	
	}
} else if room_get_name(room) == "rm_level3" {
	if (global.enemyKillCount3 == global.enemyRoomMax) {
		oSFX.levelEndSnd = true;
		instance_destroy();	
	}
} else if room_get_name(room) == "rm_level4" {
	if (global.enemyKillCount4 == global.enemyRoomMax) {
		oSFX.levelEndSnd = true;
		instance_destroy();	
	}
} else if room_get_name(room) == "rm_level5" {
	if (global.enemyKillCount5 == global.enemyRoomMax) {
		oSFX.levelEndSnd = true;
		instance_destroy();	
	}
}