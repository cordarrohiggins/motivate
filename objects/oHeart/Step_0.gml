//pause self
if screen_pause() == true {exit;};

//float in place
floatDir += floatSpeed;
y = ystart + dsin(floatDir) * 2;

//get collected by player
if place_meeting(x, y, oPlayer) {
	//heal the player
	oPlayer.hp += heal;
	
	//play sound
	oSFX.heartPickupSnd = true;
	
	//destroy self
	instance_destroy();
}