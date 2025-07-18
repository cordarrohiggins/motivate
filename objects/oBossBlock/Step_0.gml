//create the warp object when the player touches this
if instance_exists(oBossSpawn) && place_meeting(x, y, oPlayer) {
	//spawn the boss at the oBossSpawn
	if !instance_exists(bossSpawned) {
		instance_create_depth(oBossSpawn.x, oBossSpawn.y, oBossSpawn.depth, bossSpawned);
		instance_destroy();
	}
}