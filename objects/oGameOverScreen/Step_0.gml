//get shoot kep input
var shootKey = global.shootKey;

//stop music
set_song_ingame(noone, 0, 0);

//fade in
alpha += alphaSpeed;
alpha = clamp(alpha, 0, 1);

//restart
if shootKey && alpha >= 1 {
	//create the warp object when the player touches this
	if !instance_exists(oWarp) {
		//create the warp object and set its target room and coordinate object
		with(instance_create_depth(0, 0, 0, oWarp)) {
			targetRoom = other.targetRoom;
			targetObj = other.targetObj;
		}
	}	
	
	global.newGame = true;
	room_restart();
}
