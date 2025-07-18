load_settings();

saveTime1 = global.saveTime1;
saveTime2 = global.saveTime2;
saveTime3 = global.saveTime3;

shakeChoice = global.ScreenShakeAmount;
shakeSelection = global.ScreenShakeName;
masterVol = global.MASTER_VOL;
masterNum = global.MASTER_CHOICE;
sfxVol = global.SFX_VOL;
sfxNum = global.SFX_CHOICE;
musicVol = global.MUSIC_VOL;
musicNum = global.MUSIC_CHOICE;

width = 64;
height = 104;

op_border = 8;
op_space = 16;

pos = 0;

//pause menu
option[0, 0] = "Start Game";
option[0, 1] = "Settings";
option[0, 2] = "Quit Game";

//load save menu
option[1, 0] = "Load File 1 - " + saveTime1;
option[1, 1] = "Load File 2 - " + saveTime2;
option[1, 2] = "Load File 3 - " + saveTime3;
option[1, 3] = "Delete Save Files";
option[1, 4] = "Back";

//load save menu
option[2, 0] = "Delete File 1 - " + saveTime1;
option[2, 1] = "Delete File 2 - " + saveTime2;
option[2, 2] = "Delete File 3 - " + saveTime3;
option[2, 3] = "Back";

//settings menu
option[3, 0] = "Master Volume - " + string(masterNum) + "%";
option[3, 1] = "Sound Effects Volume - " + string(sfxNum) + "%";
option[3, 2] = "Music Volume - " + string(musicNum) + "%";
option[3, 3] = "Screen Shake Intensity - " + shakeSelection;
option[3, 4] = "Back";

op_length = 0;
menu_level = 0;