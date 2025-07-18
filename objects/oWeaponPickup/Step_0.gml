//pause self
if screen_pause() == true {exit;};

//set the correct sprite
sprite_index = weapon.pickupSprite;

//float in place
floatDir += floatSpeed;
y = ystart + dsin(floatDir) * 2;

//does the player already have this weapon?
var _size = array_length(global.PlayerWeapons);
for (var i = 0; i < _size; i++) {
	//check if weapon is already in the list
	if weapon == global.PlayerWeapons[i] {
		//destroy self
		instance_destroy();
		exit;
	}
}

//add weapon to player's list
if place_meeting(x, y, oPlayer) {
	//add the weapon	
	array_push(global.PlayerWeapons, weapon);
	
	//play sound
	oSFX.weaponPickupSnd = true;
	
	//set as the players equiped weapon
	oPlayer.selectedWeapon = array_length(global.PlayerWeapons) - 1;
	
	//destory 
	instance_destroy();
}