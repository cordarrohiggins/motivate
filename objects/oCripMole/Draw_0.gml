draw_self();	

//draw hp
	//fix for every enemy having the same health no matter what
	if bsHealthFix == 0 {
		hp = 2500;
		maxHp = 2500;
		//only will run once
		bsHealthFix++;
	}
	
	//draw_sprite(sEnemyHealth, _hpImage, x, y - sprite_height - 1);