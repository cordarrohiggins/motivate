//room_goto_next();

if global.saveTime1 == "0000-00-00 00:00:00" && global.loadChoice == 1 { 
	global.newGame = true;
	room_goto_next();
} else if global.saveTime2 == "0000-00-00 00:00:00" && global.loadChoice == 2 { 
	global.newGame = true;
	room_goto_next();
} else if global.saveTime3 == "0000-00-00 00:00:00" && global.loadChoice == 3 { 
	global.newGame = true;
	room_goto_next();
} else {
	var _gotoRoom = asset_get_index(global.statData.save_rm);
	room_goto(_gotoRoom);
}