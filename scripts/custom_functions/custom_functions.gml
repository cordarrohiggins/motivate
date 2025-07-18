//drawing the player's weapon
	function draw_my_weapon() {
		//draw the weapon
		//get the weapon off the players body
		var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y(weaponOffsetDist - 4, aimDir);
	
		//flip the wepon upright
		var _weaponYscl1 = 1;
		if aimDir > 90 && aimDir < 270 {
			_weaponYscl1 = -1;	
		}

		draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl1, aimDir, c_white, image_alpha); //c_white means blending with nothing	
	}

//vfx
	function screen_pause() {
		//pause self
		if instance_exists(oScreenPause) {
			image_speed = 0;
			return true;
		} else {
			image_speed = 1;
			return false;
		}
	}
	
	function create_screen_pause(_time = 3){
		with(instance_create_depth(0, 0, 0, oScreenPauseTimed)) {
			timer = _time;	
		}
	}
	
	function screen_shake(_amount = 4) {
		_amount *= global.ScreenShakeAmount;
		
		with(oCamera) {
			xShakeAmount = _amount;
			yShakeAmount = _amount;
		}
	}
	
	function create_animated_vfx(_sprite, _x, _y, _depth, _rot = 0, _xScale = 1, _yScale = 1) {
		with(instance_create_depth(_x, _y, _depth, oAnimatedVFX)) {
			sprite_index = _sprite;
			image_angle = _rot;
			image_xscale = _xScale;
			image_yscale = _yScale;
		}
	}

//damage calculation
	//damage create event
	function get_damaged_create(_hp = 100, _iframes = false) {
		maxHp = _hp;
		hp = _hp;
		
		//get the iframes
		if _iframes == true {
			iframeTimer = 0;
			iframeNumber = 90; //how many frames you are invincible
		}

		//create the damage list
		if _iframes == false {
			damageList = ds_list_create();
		}
	}
	
	//damage clean up event
	function get_damaged_cleanup() {
		//Do not need if using iframes
		
		// only proceed if this instance actually ever got a damageList
		    if (variable_instance_exists(id, "damageList")) {
		        if (ds_exists(damageList, ds_type_list)) {
		            ds_list_destroy(damageList);
		        }
		        // optional: zap it so you don’t accidentally reuse it later
		        damageList = undefined;
		    }
		//old code
		//delete our damage list data structure to free memory
			//ds_list_destroy(damageList);
	}
	
	//damage step event
	function get_damaged(_damagedObj, _iframes = false) {
		//special exit for iframe timer
		if _iframes == true && iframeTimer > 0 {
			iframeTimer--;
			
			if iframeTimer mod 5 == 0 {
				if image_alpha == 1 {
					image_alpha = 0.5;
				} else {
					image_alpha = 1;	
				}
			}
			
			//clamp hp
			hp = clamp(hp, 0, maxHp);
			
			//exit by returning the function as false
			return false;
		}
		
		//make sure the iframe blinking stops
		if _iframes == true {
			image_alpha = 1;
		}
		
		//recieve damage
		var _hitConfirm = false;
		if place_meeting(x, y, _damagedObj) {
			//getting a list of the damage inst
				//create a ds list and copy instances to it
				var _instList = ds_list_create();
		
				instance_place_list(x, y, _damagedObj, _instList, false);
		
				//get size of list
				var _listSize = ds_list_size(_instList);
			
				//loop through the list
				for(var i = 0; i < _listSize; i++) {
					var _inst = ds_list_find_value(_instList, i);
					
					//check if this instance is already in the damage list
					if _iframes == true || ds_list_find_index(damageList, _inst) == -1 {
						//add the new damage instance to the damage list
						if _iframes == false {
							ds_list_add(damageList, _inst);
						}
							
						//take damage from specific instance
						hp -= _inst.damage;
						_hitConfirm = true;
							
						//tell the damage instance it has impacted
						_inst.hitConfirm = true;
						
						//create an impact visual
						if _inst.hitVFX == true {
							create_animated_vfx(sShootBurst, _inst.x, _inst.y, _inst.depth - 25);
						}
					}
				}
					
				//set iframes if we were hit
				if _iframes == true && _hitConfirm == true {
					iframeTimer = iframeNumber;
				}
			
				//free memory by destroying the ds list
				ds_list_destroy(_instList);
		}

	//clear the damage list of objects that don't exist anymore or aren't touching anymore
		if _iframes == false {
			var _damageListSize = ds_list_size(damageList);
			for (var i = 0; i < _damageListSize; i++) {
				//if not touching the damage instance anymore, remove it from the list and set the loop back 1 position
				var _inst = ds_list_find_value(damageList, i);
				if !instance_exists(_inst) || !place_meeting(x, y, _inst) {
					ds_list_delete(damageList, i);
					i--;
					_damageListSize--;
				}
			}
		}
		
		//clamp hp
		hp = clamp(hp, 0, maxHp);
		
		//return hitconfirm variable value 
		return _hitConfirm;
	}
	
//music functions
	//_song = set to any song / set to noone to stop music
	//_fadeOutCurrentSong = time in frames, the current song will take to fade out
	//_fadeIn = time in frames, the target song will take to fade in
	function set_song_ingame(_song, _fadeOutCurrentSong = 0, _fadeIn = 0) {
		with(oMusicManager) {
			targetSongAsset = _song;
			endFadeOutTime = _fadeOutCurrentSong;
			startFadeInTime = _fadeIn;
		}
	}
	
	
	
	
	