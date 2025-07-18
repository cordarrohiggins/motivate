//create the warp object when the player touches this
if !instance_exists(oWarp) && place_meeting(x, y, oPlayer) {
	//create the warp object and set its target room and coordinate object
	with(instance_create_depth(0, 0, 0, oWarp)) {
		targetRoom = other.targetRoom;
		targetObj = other.targetObj;
		
		//play sound
		oSFX.roomSwitchSnd = true;
	}
}