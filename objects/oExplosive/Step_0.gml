get_damaged(oDamageParent);

//show damage
var _healthPercent = 1 - (hp/maxHp);
image_index = _healthPercent * (image_number);


if hp <= 0 {
	//create explosion
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oBigBoom);
	with (_boomInst) {
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	//sound 
	oSFX.barrelExplosionSnd = true;
	
	//screen pause
	create_screen_pause(3);
	
	//screen shake
	screen_shake(8);
	
	//create broken crate
	instance_create_depth(x, y, depth, oBrokenExplosive);
	
	//destroy
	instance_destroy();
}