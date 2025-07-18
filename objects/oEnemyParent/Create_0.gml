event_inherited();

get_damaged_create();

if room_get_name(room) == "rm_level1" {
	global.totalEnemiesSpawned1++;
} else if room_get_name(room) == "rm_level2" {
	global.totalEnemiesSpawned2++;
} else if room_get_name(room) == "rm_level3" {
	global.totalEnemiesSpawned3++;
} else if room_get_name(room) == "rm_level4" {
	global.totalEnemiesSpawned4++;
} else if room_get_name(room) == "rm_level5" {
	global.totalEnemiesSpawned5++;
}
