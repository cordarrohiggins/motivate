//get cam coordinates
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);

//central HUD coordinates
	var _border = 4;
	var _hudX = _camX + _border;
	var _hudY = _camY + _border;

//draw the players hp
	if instance_exists(oPlayer) {
		draw_sprite(sHealthBar, 0 , _hudX, _hudY);

		for(var i = 0; i < playerMaxHp; i++) {
			//show current hp
			var _img = 1;
			if i+1 <= playerHp {
				_img = 2;	
			}
	
			var _sep = 3;
			draw_sprite(sHealthBar, _img, _hudX + _sep*i, _hudY);
		}
	}

//draw the enemy kill count
var _enemyCountOffset = 18;
var _ecHudX = _hudX;
var _ecHudY = _hudY + _enemyCountOffset;

//draw the box
draw_sprite(sEnemyCountHud, 0, _ecHudX, _ecHudY);

//draw the text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fntROGFonts);

	if room_get_name(room) == "rm_level1" {
		//the current enemy kill count
		draw_text(_ecHudX + 18, _ecHudY - 1, string(global.enemyKillCount1));
		//total enemies in level count
		draw_text(_ecHudX + 45, _ecHudY - 1, "/" + string(global.enemyRoomMax));
	} else if room_get_name(room) == "rm_level2" {
		//the current enemy kill count
		draw_text(_ecHudX + 18, _ecHudY - 1, string(global.enemyKillCount2));
		//total enemies in level count
		draw_text(_ecHudX + 45, _ecHudY - 1, "/" + string(global.enemyRoomMax));
	} else if room_get_name(room) == "rm_level3" {
		//the current enemy kill count
		draw_text(_ecHudX + 18, _ecHudY - 1, string(global.enemyKillCount3));
		//total enemies in level count
		draw_text(_ecHudX + 45, _ecHudY - 1, "/" + string(global.enemyRoomMax));
	} else if room_get_name(room) == "rm_level4" {
		//the current enemy kill count
		draw_text(_ecHudX + 18, _ecHudY - 1, string(global.enemyKillCount4));
		//total enemies in level count
		draw_text(_ecHudX + 45, _ecHudY - 1, "/" + string(global.enemyRoomMax));
	} else if room_get_name(room) == "rm_level5" {
		//the current enemy kill count
		draw_text(_ecHudX + 18, _ecHudY - 1, string(global.enemyKillCount5));
		//total enemies in level count
		draw_text(_ecHudX + 45, _ecHudY - 1, "/" + string(global.enemyRoomMax));
	}	
	
//Draw the boss’s health bar + name
//Find the boss instance
var _boss = instance_find(oCripMole, 0);
if (_boss != noone) {
    //Health fraction
    var _healthPercent = _boss.hp/_boss.maxHp;
	var _hpImage = _healthPercent * (sprite_get_number(sBossHealth) - 1);

    //Camera + view dimensions
    var _viewW = camera_get_view_width(view_camera[0]);
    var _viewH = camera_get_view_height(view_camera[0]);

    //Sprite dims & margins
    var _barW = sprite_get_width(sBossHealth) * 2;
    var _barH = sprite_get_height(sBossHealth) * 2;
    var _bossBorder = 16; //px from bottom
    var _textPad = 12; //px between bar & name

    //Compute bottom-center screen coords
    var _centerX = _camX + _viewW * 0.5;
    var _barX = _centerX - _barW * 0.5;
    var _barY = _camY + _viewH - _bossBorder - _barH;
    var _nameY = _barY - _textPad;

    // Draw the bar sub-image
    draw_sprite_ext(sBossHealth, _hpImage, _barX, _barY, 2, 2, image_angle, image_blend, image_alpha);

    //Draw the boss’s name above it
    draw_set_font(fntROGFonts);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
	_boss.boss_name = "Crip Mole";
    draw_text(_centerX, _nameY, _boss.boss_name);

    //Reset alignment for the rest of your HUD
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}