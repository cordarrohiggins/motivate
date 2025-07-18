//remove menu if player dies or something etc
if !instance_exists(oPlayer) {
	instance_destroy();
	exit;
}

//settings and quitting

//get imputs
var up_key = keyboard_check_pressed(vk_up);
var down_key = keyboard_check_pressed(vk_down);
var left_key = keyboard_check_pressed(vk_left);
var right_key = keyboard_check_pressed(vk_right);
var w_key = keyboard_check_pressed(ord("W"));
var s_key = keyboard_check_pressed(ord("S"));
var a_key = keyboard_check_pressed(ord("A"));
var d_key = keyboard_check_pressed(ord("D"));

var accept_key = keyboard_check_pressed(vk_enter);

//store number of options
op_length = array_length(option[menu_level]);

//move through the menu
pos += down_key - up_key;
pos += s_key - w_key;
if pos >= op_length {
	pos = 0;
}
if pos < 0 {
	pos = op_length - 1;	
}

if up_key || down_key || s_key || w_key {
	//play sound
	oSFX.selectSnd = true;	
}

var _sml = menu_level;

//using the options by pressing enter
if accept_key {
	//play sound
	oSFX.selectSnd = true;	
	
	_sml = menu_level;
	
	switch(menu_level) {
		//pause menu
		case 0:
			switch(pos) {
				//continue game
				case 0:
					audio_resume_all();
					instance_destroy();
					break;
				
				//save game
				case 1:
					load_settings();
					menu_level = 1;
					break;
				
				//settings
				case 2:
					menu_level = 2;
					break;
		
				//quit game
				case 3:
					instance_deactivate_all(true);
					audio_stop_all();
					room_goto(0);
					//game_end();
					break;
			}
			break;
		
		//save menu
		case 1:
			switch(pos) {
				//save to file 1
				case 0:
					saveTime1 = date_datetime_string(date_current_datetime());
					option[1, 0] = "Save to File 1 - " + saveTime1;
					global.saveTime1 = saveTime1;
					
					save_game(0);
					oSFX.saveSnd = true;
					save_settings();
					break;
					
				//save to file 2
				case 1:
					saveTime2 = date_datetime_string(date_current_datetime());
					option[1, 1] = "Save to File 2 - " + saveTime2;
					global.saveTime2 = saveTime2;
					
					save_game(1);
					oSFX.saveSnd = true;
					save_settings();
					break;
					
				//save to file 3
				case 2:
					saveTime3 = date_datetime_string(date_current_datetime());
					option[1, 2] = "Save to File 3 - " + saveTime3;
					global.saveTime3 = saveTime3;
					
					save_game(2);
					oSFX.saveSnd = true;
					save_settings();
					break;
					
				//back to previous menu
				case 3:
					menu_level = 0;
					break;
			}
			break;
		
		//settings menu
		case 2:
			switch(pos) {
				//master volume
				case 0:
					masterNum = masterNum + 10;
					if masterNum > 100 {
						masterNum = 0;	
					}
					if masterNum < 0 {
						masterNum = 100;	
					}
					global.MASTER_CHOICE = masterNum;
					
					global.MASTER_VOL = masterNum / 100;
					option[2, 0] = "Master Volume - " + string(masterNum) + "%";
					break;
				
				//sound effect volume
				case 1:
					sfxNum = sfxNum + 10;
					if sfxNum > 100 {
						sfxNum = 0;	
					}
					if sfxNum < 0 {
						sfxNum = 100;	
					}
					global.SFX_CHOICE = sfxNum;
					
					global.SFX_VOL = sfxNum / 100;
					option[2, 1] = "Sound Effects Volume - " + string(sfxNum) + "%";
					break;
				
				//music volume
				case 2:
					musicNum = musicNum + 10;
					if musicNum > 100 {
						musicNum= 0;	
					}
					if musicNum < 0 {
						musicNum = 100;	
					}
					global.MUSIC_CHOICE = musicNum;
					
					global.MUSIC_VOL = musicNum / 100;
					option[2, 2] = "Music Volume - " + string(musicNum) + "%";
					break;
					
				//screen shake intensity
				case 3:
					shakeChoice += 0.5;
					if shakeChoice > 2 {
						shakeChoice = 0;	
					}
					if shakeChoice < 0 {
						shakeChoice = 2;	
					}
					if shakeChoice == 0 {
						global.ScreenShakeAmount = 0;
						global.ScreenShakeName = "Off";	
					} else if shakeChoice == 0.5 {
						global.ScreenShakeAmount = 0.5;
						global.ScreenShakeName = "Light";	
					} else if shakeChoice == 1 {
						global.ScreenShakeAmount = 1;
						global.ScreenShakeName = "Normal";	
					} else if shakeChoice == 1.5 {
						global.ScreenShakeAmount = 1.5;
						global.ScreenShakeName = "Heavy";	
					} else if shakeChoice == 2 {
						global.ScreenShakeAmount = 2;
						global.ScreenShakeName = "Intense";	
					}
					option[2, 3] = "Screen Shake Intensity - " + global.ScreenShakeName;
					break;
					
				//back to previous menu
				case 4:
					menu_level = 0;
					break;
			}
			save_settings();
			break;
	}
	//set position back
	if _sml != menu_level {
		pos = 0;	
	}
	
	//correct option length
	op_length = array_length(option[menu_level]);
}
	
//using the options by pressing right arrow key
if right_key || d_key {
	//play sound
	oSFX.selectSnd = true;	
	
	_sml = menu_level;
	
	switch(menu_level) {
		//settings menu
		case 2:
			switch(pos) {
				//master volume
				case 0:
					masterNum = masterNum + 10;
					if masterNum > 100 {
						masterNum = 0;	
					}
					if masterNum < 0 {
						masterNum = 100;	
					}
					global.MASTER_CHOICE = masterNum;
					
					global.MASTER_VOL = masterNum / 100;
					option[2, 0] = "Master Volume - " + string(masterNum) + "%";
					break;
					
				//sound effect volume
				case 1:
					sfxNum = sfxNum + 10;
					if sfxNum > 100 {
						sfxNum = 0;	
					}
					if sfxNum < 0 {
						sfxNum = 100;	
					}
					global.SFX_CHOICE = sfxNum;
					
					global.SFX_VOL = sfxNum / 100;
					option[2, 1] = "Sound Effects Volume - " + string(sfxNum) + "%";
					break;
				
				//music volume
				case 2:
					musicNum = musicNum + 10;
					if musicNum > 100 {
						musicNum= 0;	
					}
					if musicNum < 0 {
						musicNum = 100;	
					}
					global.MUSIC_CHOICE = musicNum;
					
					global.MUSIC_VOL = musicNum / 100;
					option[2, 2] = "Music Volume - " + string(musicNum) + "%";
					break;
					
				//screen shake intensity
				case 3:
					shakeChoice += 0.5;
					if shakeChoice > 2 {
						shakeChoice = 0;	
					}
					if shakeChoice < 0 {
						shakeChoice = 2;	
					}
					if shakeChoice == 0 {
						global.ScreenShakeAmount = 0;
						global.ScreenShakeName = "Off";	
					} else if shakeChoice == 0.5 {
						global.ScreenShakeAmount = 0.5;
						global.ScreenShakeName = "Light";	
					} else if shakeChoice == 1 {
						global.ScreenShakeAmount = 1;
						global.ScreenShakeName = "Normal";	
					} else if shakeChoice == 1.5 {
						global.ScreenShakeAmount = 1.5;
						global.ScreenShakeName = "Heavy";	
					} else if shakeChoice == 2 {
						global.ScreenShakeAmount = 2;
						global.ScreenShakeName = "Intense";	
					}
					option[2, 3] = "Screen Shake Intensity - " + global.ScreenShakeName;
					break;
			}
			save_settings();
			break;
	}
	
	//set position back
	if _sml != menu_level {
		pos = 0;	
	}
	
	//correct option length
	op_length = array_length(option[menu_level]);
}

//using the options by pressing left arrow key
if left_key || a_key {
	//play sound
	oSFX.selectSnd = true;	
	
	_sml = menu_level;
	
	switch(menu_level) {
		//settings menu
		case 2:
			switch(pos) {
				//master volume
				case 0:
					masterNum = masterNum - 10;
					if masterNum > 100 {
						masterNum = 0;	
					}
					if masterNum < 0 {
						masterNum = 100;	
					}
					global.MASTER_CHOICE = masterNum;
					
					global.MASTER_VOL = masterNum / 100;
					option[2, 0] = "Master Volume - " + string(masterNum) + "%";
					break;
					
				//sound effect volume
				case 1:
					sfxNum = sfxNum - 10;
					if sfxNum > 100 {
						sfxNum = 0;	
					}
					if sfxNum < 0 {
						sfxNum = 100;	
					}
					global.SFX_CHOICE = sfxNum;
					
					global.SFX_VOL = sfxNum / 100;
					option[2, 1] = "Sound Effects Volume - " + string(sfxNum) + "%";
					break;
				
				//music volume
				case 2:
					musicNum = musicNum - 10;
					if musicNum > 100 {
						musicNum= 0;	
					}
					if musicNum < 0 {
						musicNum = 100;	
					}
					global.MUSIC_CHOICE = musicNum;
					
					global.MUSIC_VOL = musicNum / 100;
					option[2, 2] = "Music Volume - " + string(musicNum) + "%";
					break;
					
				//screen shake intensity
				case 3:
					shakeChoice -= 0.5;
					if shakeChoice > 2 {
						shakeChoice = 0;	
					}
					if shakeChoice < 0 {
						shakeChoice = 2;	
					}
					if shakeChoice == 0 {
						global.ScreenShakeAmount = 0;
						global.ScreenShakeName = "Off";	
					} else if shakeChoice == 0.5 {
						global.ScreenShakeAmount = 0.5;
						global.ScreenShakeName = "Light";	
					} else if shakeChoice == 1 {
						global.ScreenShakeAmount = 1;
						global.ScreenShakeName = "Normal";	
					} else if shakeChoice == 1.5 {
						global.ScreenShakeAmount = 1.5;
						global.ScreenShakeName = "Heavy";	
					} else if shakeChoice == 2 {
						global.ScreenShakeAmount = 2;
						global.ScreenShakeName = "Intense";	
					}
					option[2, 3] = "Screen Shake Intensity - " + global.ScreenShakeName;
					break;
			}
			save_settings();
			break;
	}
	
	//set position back
	if _sml != menu_level {
		pos = 0;	
	}
	
	//correct option length
	op_length = array_length(option[menu_level]);
}