//global items and things
	//all in other places currently

skipRoomSave = false;

if !file_exists("settingsdata.sav") {
	global.settingsData = {
		save_1 : 0,
		save_2 : 0,
		save_3 : 0,
		save_master : 0,
		save_masterChoice : 0,
		save_sfx : 0,
		save_sfxChoice : 0,
		save_music : 0,
		save_musicChoice : 0,
		save_shake : 0,	
		save_shakeChoice : 0,
	}
	
	global.saveTime1 = "0000-00-00 00:00:00";
	global.saveTime2 = "0000-00-00 00:00:00";
	global.saveTime3 = "0000-00-00 00:00:00";
	global.MASTER_VOL = 1;
	global.MASTER_CHOICE = 100;
	global.SFX_VOL = 1;
	global.SFX_CHOICE = 100;
	global.MUSIC_VOL = 1;
	global.MUSIC_CHOICE = 100;
	global.ScreenShakeAmount = 1;
	global.ScreenShakeName = "Normal";
	
	save_settings();
}

global.statData = {
	save_x : 0,
	save_y : 0,
	save_rm : 0,
}

global.levelData = {
	level_1 : 0,
	level_2 : 0,
	level_3 : 0,
	level_4 : 0,
	level_5 : 0,
}

global.settingsData = {
	save_1 : 0,
	save_2 : 0,
	save_3 : 0,
	save_master : 0,
	save_masterChoice : 0,
	save_sfx : 0,
	save_sfxChoice : 0,
	save_music : 0,
	save_musicChoice : 0,
	save_shake : 0,	
	save_shakeChoice : 0,
}