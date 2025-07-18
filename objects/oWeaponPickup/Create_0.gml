depth = -y;

//floating
floatDir = 0;
floatSpeed = 6;

weapon = global.WeaponList.sniper;

//does the player already have this weapon?
var _size = array_length(global.PlayerWeapons);
for (var i = 0; i < _size; i++) {
	//check if weapon is already in the list
	if weapon == global.PlayerWeapons[i] {
		//destroy self
		instance_destroy();
	}
}