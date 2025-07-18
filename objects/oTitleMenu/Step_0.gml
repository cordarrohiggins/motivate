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

//using the options
if accept_key {
	//play sound
	oSFX.selectSnd = true;
	
	_sml = menu_level;
	
	switch(menu_level) {
		//title menu
		case 0:
			switch(pos) {
				//go to load save screen
				case 0:
					menu_level = 1;
					break;
		
				//settings
				case 1:
					menu_level = 3;
					break;
		
				//quit game
				case 2:
					game_end();
					break;
			}
			break;
			
		//load save menu
		case 1:
			switch(pos) {
				//load save 1
				case 0:
					load_game(0);
					oSFX.loadSnd = true;

					global.loadChoice = 1;
					room_goto_next();
					break;
					
				//load save 2
				case 1:
					load_game(1);
					oSFX.loadSnd = true;
					
					global.loadChoice = 2;
					room_goto_next();
					break;
					
				//load save 3
				case 2:
					load_game(2);
					oSFX.loadSnd = true;
					
					global.loadChoice = 3;
					room_goto_next();
					break;
					
				//go to delete menu
				case 3:
					menu_level = 2;
					break;
					
				//back to previous menu
				case 4:
					menu_level = 0;
					break;
			}
			save_settings();
			break;
			
		//delete save menu
		case 2:
			switch(pos) {
				//delete save 1
				case 0:
					if (file_exists("savedata0.sav")) {
					    // delete the file
					    file_delete("savedata0.sav");
					}
					saveTime1 = "0000-00-00 00:00:00";
					option[1, 0] = "Load File 1 - " + saveTime1;
					option[2, 0] = "Delete File 1 - " + saveTime1;
					global.saveTime1 = saveTime1;
					break;
					
				//delete save 2
				case 1:
					if (file_exists("savedata1.sav")) {
					    // delete the file
					    file_delete("savedata1.sav");
					}
					saveTime2 = "0000-00-00 00:00:00";
					option[1, 1] = "Load File 2 - " + saveTime2;
					option[2, 1] = "Delete File 2 - " + saveTime2;
					global.saveTime2 = saveTime2;
					break;
					
				//delete save 3
				case 2:
					if (file_exists("savedata2.sav")) {
					    // delete the file
					    file_delete("savedata2.sav");
					}
					saveTime3 = "0000-00-00 00:00:00";
					option[1, 2] = "Load File 3 - " + saveTime3;
					option[2, 2] = "Delete File 3 - " + saveTime3;
					global.saveTime3 = saveTime3;
					break;
					
				//back to previous menu
				case 3:
					menu_level = 1;
					break;
					
			}
			save_settings();
			break;
		
		//settings menu
		case 3:
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
					option[3, 0] = "Master Volume - " + string(masterNum) + "%";
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
					option[3, 1] = "Sound Effects Volume - " + string(sfxNum) + "%";
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
					option[3, 2] = "Music Volume - " + string(musicNum) + "%";
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
					option[3, 3] = "Screen Shake Intensity - " + global.ScreenShakeName;
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
		case 3:
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
					option[3, 0] = "Master Volume - " + string(masterNum) + "%";
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
					option[3, 1] = "Sound Effects Volume - " + string(sfxNum) + "%";
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
					option[3, 2] = "Music Volume - " + string(musicNum) + "%";
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
					option[3, 3] = "Screen Shake Intensity - " + global.ScreenShakeName;
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
		case 3:
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
					option[3, 0] = "Master Volume - " + string(masterNum) + "%";
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
					option[3, 1] = "Sound Effects Volume - " + string(sfxNum) + "%";
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
					option[3, 2] = "Music Volume - " + string(musicNum) + "%";
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
					option[3, 3] = "Screen Shake Intensity - " + global.ScreenShakeName;
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