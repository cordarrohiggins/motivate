get_damaged(oDamageParent);

//show damage
var _healthPercent = 1 - (hp/maxHp);
image_index = _healthPercent * (image_number);

if hp <= 0 {
	//destroy vfx
	create_animated_vfx(sSmallBoom, x + 8, y + 16, depth);
	
	//sound
	oSFX.crateBreakSnd = true;
	
	//create broken crate
	instance_create_depth(x, y, depth, oBrokenCrate);
	
	//destroy
	instance_destroy();
}