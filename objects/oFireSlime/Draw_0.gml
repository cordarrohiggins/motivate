draw_self();	

//draw hp
	//fix for every enemy having the same health no matter what
	if bsHealthFix == 0 {
		hp = 125;
		maxHp = 125;
		//only will run once
		bsHealthFix++;
	}
	var _healthPercent = hp/maxHp;
	var _hpImage = _healthPercent * (sprite_get_number(sEnemyHealth) - 1);
	draw_sprite_ext(sEnemyHealth, _hpImage, x, y - sprite_height - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);