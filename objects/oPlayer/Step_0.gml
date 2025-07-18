//get inputs
#region
var rightKey = global.rightKey;
var leftKey = global.leftKey;
var upKey = global.upKey
var downKey = global.downKey;
var shootKey = global.shootKey;
var swapKeyPressed = global.swapKeyPressed;
var escKeyPressed = global.escKeyPressed;

#endregion

//pause menu
if escKeyPressed {
	if !instance_exists(oPauseMenu) {
		oSFX.pauseSnd = true;
		instance_create_depth(0, 0, 0, oPauseMenu);
		audio_pause_all();
	} else {
		oSFX.unpauseSnd = true;
		instance_destroy(oPauseMenu);
		audio_resume_all();
	}
}

//update visuals for room warping
if instance_exists(oWarp) {
	image_index = 0;
	sprite_index = sprite[face];
	aimDir = face * 90;
	centerY = y + centerYOffset;
}

//pause self
if screen_pause() == true {exit;};

//player movement
#region
	//get direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0, 0, _horizKey, _vertKey);
	
	//get x/y speeds
	var _speed = 0;
	var _inputLevel = point_distance(0, 0, _horizKey, _vertKey);
	_inputLevel = clamp(_inputLevel, 0, 1);
	_speed = moveSpeed * _inputLevel;
	
	xSpeed = lengthdir_x(_speed, moveDir);
	ySpeed = lengthdir_y(_speed, moveDir);
	
	//collision
	if place_meeting(x + xSpeed, y, oWall) {
		xSpeed = 0;
	}
	if place_meeting(x, y + ySpeed, oWall) {
		ySpeed = 0;
	}
	
	//move the player
	x += xSpeed;
	y += ySpeed;
	
	//depth
	depth = -bbox_bottom; //negatives are placed above positives
#endregion

//player aiming
#region
	centerY = y + centerYOffset;
	
	//aim
	aimDir = point_direction(x, centerY, mouse_x, mouse_y);
#endregion

//get damaged
#region
if get_damaged(oDamagePlayer, true) {
	//hit screen
	instance_create_depth(0, 0, 0, oHitScreen);
	
	//play sound
	oSFX.playerHitSnd = true;
	oSFX.playerDamageSnd = true;
	
	//screen pause
	create_screen_pause(20);
	
	//shake the screen
	screen_shake(6);
}
	
#endregion

//sprite control
#region
		//make sure the player is facing the correct direction
		face = round(aimDir/90);
		if face == 4 {face = 0;};
		
		//animate
		if xSpeed == 0 && ySpeed == 0 {
			image_index = 0;	
		}
		
		//set the players sprite
		mask_index = sprite[3];
		sprite_index = sprite[face];
#endregion

//weapon swapping
#region
	var _playerWeapons = global.PlayerWeapons;

	//cycle through weapons 
	if swapKeyPressed {
		//change the selection and wrap around
		selectedWeapon++;
		
		if selectedWeapon >= array_length(_playerWeapons) {
			selectedWeapon = 0;	
		}
	}
	
	//set the new weapon
		weapon = _playerWeapons[selectedWeapon];
	
#endregion

//shoot the weapon
#region
	if shootTimer > 0 {
		shootTimer -= 1;	
	}
	if shootKey && shootTimer <= 0 {
		//reset the timer
		shootTimer = weapon.cooldown;
		
		//create the bullet
		var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist - 3, aimDir);
		
		var _spread = weapon.spread;
		var _spreadDiv = _spread / max(weapon.bulletNum - 1, 1); //use max() in case it divides by zero
		
		var _weaponTipX = x + _xOffset;
		var _weaponTipY = centerY + _yOffset;
		
		//create weapon flash
		if weapon.sprite == sBottle  {
			//creates a smaller flash
			create_animated_vfx(sShootFlash, _weaponTipX, _weaponTipY, depth, aimDir, 0.25, 0.25);
		} else {
			create_animated_vfx(sShootFlash, _weaponTipX, _weaponTipY, depth, aimDir);
		}
		
		//make sound
		if weapon.sprite == sPistol  {
			oSFX.pistolSnd = true;
		} else if weapon.sprite = sBottle {
			oSFX.bottleSnd = true;	
		} else if weapon.sprite = sShotgun {
			oSFX.shotgunSnd = true;	
		} else if weapon.sprite = sSniper {
			oSFX.sniperSnd = true;	
		}
		
		//create the correct number of bullets
		for (var i = 0; i < weapon.bulletNum; i++) {
			var _bulletInst = instance_create_depth(_weaponTipX, _weaponTipY, depth, weapon.bulletObj);
		
			//change the bullet direction
			with(_bulletInst) {
				dir = other.aimDir - _spread/2 + _spreadDiv * i;
				
				//turn the bullet to the right direction at creation if necessary
				if dirFix ==   true {
					image_angle = dir;	
				}
			}
		}
	}
#endregion

//death / game over
if hp <= 0 {
	//create game over object
	instance_create_depth(0, 0, -10000, oGameOverScreen);
	
	//death vfx
	create_animated_vfx(sSmallBoom, x, y, depth);
	oSFX.playerDeathSnd = true;
	oSFX.gameOverSnd = true;
	
	//destroy yourself
	instance_destroy();
}