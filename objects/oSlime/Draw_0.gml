//draw self but flipped the right way
//draw_sprite_ext(sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha);
draw_self();	

//draw hp
	//fix for every enemy having the same health no matter what
	if bsHealthFix == 0 {
		hp = 100;
		maxHp = 100;
		//only will run once
		bsHealthFix++;
	}
	var _healthPercent = hp/maxHp;
	var _hpImage = _healthPercent * (sprite_get_number(sEnemyHealth) - 1);
	draw_sprite_ext(sEnemyHealth, _hpImage, x, y - sprite_height - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);