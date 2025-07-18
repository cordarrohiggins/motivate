//room saving
function save_room() {
	//get the individual count of each savable object
	var _crateNum = instance_number(oCrate);
	var _brokenCrateNum = instance_number(oBrokenCrate);
	var _explosiveNum = instance_number(oExplosive);
	var _brokenExplosiveNum = instance_number(oBrokenExplosive);
	
	var _slimeNum = instance_number(oSlime);
	var _fireSlimeNum = instance_number(oFireSlime);
	var _moleNum = instance_number(oMole);
	
	var _bossBlockNum = instance_number(oBossBlock);
	var _cripMoleNum = instance_number(oCripMole);
	
	var _weaponNum = instance_number(oWeaponPickup);
	var _heartNum = instance_number(oHeart);
	
	var _killCount1 = global.enemyKillCount1;
	var _totalCount1 = global.totalEnemiesSpawned1;
	var _killCount2 = global.enemyKillCount2;
	var _totalCount2 = global.totalEnemiesSpawned2;
	var _killCount3 = global.enemyKillCount3;
	var _totalCount3 = global.totalEnemiesSpawned3;
	var _killCount4 = global.enemyKillCount4;
	var _totalCount4 = global.totalEnemiesSpawned4;
	var _killCount5 = global.enemyKillCount5;
	var _totalCount5 = global.totalEnemiesSpawned5;
	
	var _roomStruct = {
		crateNum : _crateNum,
		crateData : array_create(_crateNum),
		brokenCrateNum : _brokenCrateNum,
		brokenCrateData : array_create(_brokenCrateNum),
		
		explosiveNum : _explosiveNum,
		explosiveData : array_create(_explosiveNum),
		brokenExplosiveNum : _brokenExplosiveNum,
		brokenExplosiveData : array_create(_brokenExplosiveNum),
		
		slimeNum : _slimeNum,
		slimeData : array_create(_slimeNum),
		fireSlimeNum : _fireSlimeNum,
		fireSlimeData : array_create(_fireSlimeNum),
		moleNum : _moleNum,
		moleData : array_create(_moleNum),
		
		bossBlockNum : _bossBlockNum,
		bossBlockData : array_create(_bossBlockNum),
		cripMoleNum : _cripMoleNum,
		cripMoleData : array_create(_cripMoleNum),
		
		weaponNum : _weaponNum,
		weaponData : array_create(_weaponNum),
		heartNum : _heartNum,
		heartData : array_create(_heartNum),
		
		killCount1 : _killCount1,
		totalCount1 : _totalCount1,
		killCount2 : _killCount2,
		totalCount2 : _totalCount2,
		killCount3 : _killCount3,
		totalCount3 : _totalCount3,
		killCount4 : _killCount4,
		totalCount4 : _totalCount4,
		killCount5 : _killCount5,
		totalCount5 : _totalCount5,
	}
	
	//get the data from the different savable objects
		//crates
		for (var i = 0; i < _crateNum; i++) {
			var _inst = instance_find(oCrate, i);
			
			_roomStruct.crateData[i] = {
				x : _inst.x,
				y : _inst.y,
				hp : _inst.hp,
			}
		}
		//broken crates
		for (var i = 0; i < _brokenCrateNum; i++) {
			var _inst = instance_find(oBrokenCrate, i);
			
			_roomStruct.brokenCrateData[i] = {
				x : _inst.x,
				y : _inst.y,
			}
		}
		
		//explosives
		for (var i = 0; i < _explosiveNum; i++) {
			var _inst = instance_find(oExplosive, i);
			
			_roomStruct.explosiveData[i] = {
				x : _inst.x,
				y : _inst.y,
				hp : _inst.hp,
			}
		}
		//broken explosives
		for (var i = 0; i < _brokenExplosiveNum; i++) {
			var _inst = instance_find(oBrokenExplosive, i);
			
			_roomStruct.brokenExplosiveData[i] = {
				x : _inst.x,
				y : _inst.y,
			}
		}
		
		//slime
		for (var i = 0; i < _slimeNum; i++) {
			var _inst = instance_find(oSlime, i);
			
			_roomStruct.slimeData[i] = {
				x : _inst.x,
				y : _inst.y,
				//cant save hp
				face : _inst.face,
			}
		}
		//fire slime
		for (var i = 0; i < _fireSlimeNum; i++) {
			var _inst = instance_find(oFireSlime, i);
			
			_roomStruct.fireSlimeData[i] = {
				x : _inst.x,
				y : _inst.y,
				//cant save hp
				face : _inst.face,
			}
		}
		//mole
		for (var i = 0; i < _moleNum; i++) {
			var _inst = instance_find(oMole, i);
			
			_roomStruct.moleData[i] = {
				x : _inst.x,
				y : _inst.y,
				//cant save hp
			}
		}
		
		//boss block
		for (var i = 0; i < _bossBlockNum; i++) {
			var _inst = instance_find(oBossBlock, i);
			
			_roomStruct.bossBlockData[i] = {
				x : _inst.x,
				y : _inst.y,
				bossSpawned : _inst.bossSpawned,
				//cant save hp
			}
		}
		//crip mole
		for (var i = 0; i < _cripMoleNum; i++) {
			var _inst = instance_find(oCripMole, i);
			
			_roomStruct.cripMoleData[i] = {
				x : _inst.x,
				y : _inst.y,
				//cant save hp
			}
		}
		
		//weapon pickups
		for (var i = 0; i < _weaponNum; i++) {
			var _inst = instance_find(oWeaponPickup, i);
			
			_roomStruct.weaponData[i] = {
				x : _inst.x,
				y : _inst.y,
				weapon : _inst.weapon,
			}
		}
		//heart pickups
		for (var i = 0; i < _heartNum; i++) {
			var _inst = instance_find(oHeart, i);
			
			_roomStruct.heartData[i] = {
				x : _inst.x,
				y : _inst.y,
			}
		}
		
	//Store the room specific struct in global.levelData's variable meant for that level
	if room == rm_level1 {global.levelData.level_1 = _roomStruct;};
	if room == rm_level2 {global.levelData.level_2 = _roomStruct;};
	if room == rm_level3 {global.levelData.level_3 = _roomStruct;};
	if room == rm_level4 {global.levelData.level_4 = _roomStruct;};
	if room == rm_level5 {global.levelData.level_5 = _roomStruct;};
}
	
function load_room() {
	var _roomStruct = 0;
	
	//get the correct struct for the room you're in
	if room == rm_level1 {_roomStruct = global.levelData.level_1;};
	if room == rm_level2 {_roomStruct = global.levelData.level_2;};
	if room == rm_level3 {_roomStruct = global.levelData.level_3;};
	if room == rm_level4 {_roomStruct = global.levelData.level_4;};
	if room == rm_level5 {_roomStruct = global.levelData.level_5;};
	
	//EXIT if roomStruct isn't a struct
	if !is_struct(_roomStruct) {exit;};
	
	//get rid of the default room editor objects
	//then create new objects with all of the data we've saved
	
	//if no extra data : instance_create_depth(_roomStruct.crateData[i].x, _roomStruct.crateData[i].y, depth, oCrate);
	//if needs extra data : with (instance_create_depth(_roomStruct.crateData[i].x, _roomStruct.crateData[i].y, depth, oCrate)) {
	//					 		hp = _roomStruct.crateData[i].hp;
	//						}
	
		//crates
		if instance_exists(oCrate) {instance_destroy(oCrate);};
		for (var i = 0; i < _roomStruct.crateNum; i++) {
			with (instance_create_depth(_roomStruct.crateData[i].x, _roomStruct.crateData[i].y, depth, oCrate)) {
				hp = _roomStruct.crateData[i].hp;
			}
		}
		//broken crates
		if instance_exists(oBrokenCrate) {instance_destroy(oBrokenCrate);};
		for (var i = 0; i < _roomStruct.brokenCrateNum; i++) {
			instance_create_depth(_roomStruct.brokenCrateData[i].x, _roomStruct.brokenCrateData[i].y, depth, oBrokenCrate);
		}
		//explosives
		if instance_exists(oExplosive) {instance_destroy(oExplosive);};
		for (var i = 0; i < _roomStruct.explosiveNum; i++) {
			with (instance_create_depth(_roomStruct.explosiveData[i].x, _roomStruct.explosiveData[i].y, depth, oExplosive)) {
				hp = _roomStruct.explosiveData[i].hp;
			}
		}
		//broken explosives
		if instance_exists(oBrokenExplosive) {instance_destroy(oBrokenExplosive);};
		for (var i = 0; i < _roomStruct.brokenExplosiveNum; i++) {
			instance_create_depth(_roomStruct.brokenExplosiveData[i].x, _roomStruct.brokenExplosiveData[i].y, depth, oBrokenExplosive);
		}
		
		//slimes
		if instance_exists(oSlime) {instance_destroy(oSlime);};
		for (var i = 0; i < _roomStruct.slimeNum; i++) {
			with (instance_create_depth(_roomStruct.slimeData[i].x, _roomStruct.slimeData[i].y, depth, oSlime)) {
				//cant save hp
				face = _roomStruct.slimeData[i].face;
			}
		}
		//fire slimes
		if instance_exists(oFireSlime) {instance_destroy(oFireSlime);};
		for (var i = 0; i < _roomStruct.fireSlimeNum; i++) {
			with (instance_create_depth(_roomStruct.fireSlimeData[i].x, _roomStruct.fireSlimeData[i].y, depth, oFireSlime)) {
				//cant save hp
				face = _roomStruct.fireSlimeData[i].face;
			}
		}
		//moles
		if instance_exists(oMole) {instance_destroy(oMole);};
		for (var i = 0; i < _roomStruct.moleNum; i++) {
			with (instance_create_depth(_roomStruct.moleData[i].x, _roomStruct.moleData[i].y, depth, oMole)) {
				//cant save hp
			}
		}
		
		//boss blocks
		if instance_exists(oBossBlock) {instance_destroy(oBossBlock);};
		for (var i = 0; i < _roomStruct.bossBlockNum; i++) {
			with (instance_create_depth(_roomStruct.bossBlockData[i].x, _roomStruct.bossBlockData[i].y, depth, oBossBlock)) {
				bossSpawned = _roomStruct.bossBlockData[i].bossSpawned;
			}
		}
		//crip moles
		if instance_exists(oCripMole) {instance_destroy(oCripMole);};
		for (var i = 0; i < _roomStruct.cripMoleNum; i++) {
			with (instance_create_depth(_roomStruct.cripMoleData[i].x, _roomStruct.cripMoleData[i].y, depth, oCripMole)) {
				//cant save hp
			}
		}
		
		//weapon pickup
		if instance_exists(oWeaponPickup) {instance_destroy(oWeaponPickup);};
		for (var i = 0; i < _roomStruct.weaponNum; i++) {
			with (instance_create_depth(_roomStruct.weaponData[i].x, _roomStruct.weaponData[i].y, depth, oWeaponPickup)) {
				weapon = _roomStruct.weaponData[i].weapon;
			}
		}
		//heart pickups
		if instance_exists(oHeart) {instance_destroy(oHeart);};
		for (var i = 0; i < _roomStruct.heartNum; i++) {
			instance_create_depth(_roomStruct.heartData[i].x, _roomStruct.heartData[i].y, depth, oHeart);
		}
		
		global.enemyKillCount1 = _roomStruct.killCount1;
		global.totalEnemiesSpawned1 = _roomStruct.totalCount1;
		global.enemyKillCount2 = _roomStruct.killCount2;
		global.totalEnemiesSpawned2 = _roomStruct.totalCount2;
		global.enemyKillCount3 = _roomStruct.killCount3;
		global.totalEnemiesSpawned3 = _roomStruct.totalCount3;
		global.enemyKillCount4 = _roomStruct.killCount4;
		global.totalEnemiesSpawned4 = _roomStruct.totalCount4;
		global.enemyKillCount5 = _roomStruct.killCount5;
		global.totalEnemiesSpawned5 = _roomStruct.totalCount5;
}
	
//overall saving
function save_game(_fileNum = 0) {
	var _saveArray = array_create(0);
	
	//save the room you're in
	save_room();
	
	//set and save stat related stuff
	global.statData.save_x = oPlayer.x;
	global.statData.save_y = oPlayer.y;
	global.statData.save_depth = oPlayer.depth;
	global.statData.save_hp = oPlayer.hp;
	global.statData.save_face = oPlayer.face;
	global.statData.save_selected = oPlayer.selectedWeapon;
	global.statData.save_weapons = global.PlayerWeapons;
	global.statData.save_rm = room_get_name(room);
	
	array_push(_saveArray, global.statData);
	
	//save all the room data
	array_push(_saveArray, global.levelData);
	
	//actual saving
	var _filename = "savedata" + string(_fileNum) + ".sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
		
	buffer_delete(_buffer);
}

function load_game(_fileNum = 0) {
	//loading our saved data
		var _filename = "savedata" + string(_fileNum) + ".sav";
		if !file_exists(_filename) exit;
	
		//load the buffer, get the JSON, delete the buffer to free memory
		var _buffer = buffer_load(_filename);
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
	
		//unstringify and get the data array
		var _loadArray = json_parse(_json);
	
	//set the data in out game to match our loaded data
		global.statData = array_get(_loadArray, 0);
		global.levelData = array_get(_loadArray, 1);
		
		global.PlayerWeapons = global.statData.save_weapons;
	
	//use our data to get back to where we were in the game
		//go to the correct room
		var _loadRoom = asset_get_index(global.statData.save_rm);
		room_goto(_loadRoom);
			//make sure our oSaveLoad doesn't save the room we're exiting from
			oSaveLoad.skipRoomSave = true;
		
		//create the player object
		if instance_exists(oPlayer) {instance_destroy(oPlayer);};
		with (instance_create_depth(global.statData.save_x, global.statData.save_y, global.statData.save_depth, oPlayer)) {
			hp = global.statData.save_hp;
			face = global.statData.save_face;
			selectedWeapon = global.statData.save_selected;
		}
		
		//manually load the room
		load_room();
		remove_extra_pistols();
}

//settings save
function save_settings() {
	var _saveArray = array_create(0);
	
	//set and save stat related stuff
	global.settingsData.save_1 = global.saveTime1;
	global.settingsData.save_2 = global.saveTime2;
	global.settingsData.save_3 = global.saveTime3;
	global.settingsData.save_master = global.MASTER_VOL;
	global.settingsData.save_masterChoice = global.MASTER_CHOICE;
	global.settingsData.save_sfx = global.SFX_VOL;
	global.settingsData.save_sfxChoice = global.SFX_CHOICE;
	global.settingsData.save_music = global.MUSIC_VOL;
	global.settingsData.save_musicChoice = global.MUSIC_CHOICE;
	global.settingsData.save_shake = global.ScreenShakeAmount;
	global.settingsData.save_shakeChoice = global.ScreenShakeName;
	
	array_push(_saveArray, global.settingsData);
	
	//actual saving
	var _filename = "settingsdata.sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
		
	buffer_delete(_buffer);
}

function load_settings() {
	//loading our saved data
		var _filename = "settingsdata.sav";
		if !file_exists(_filename) exit;
	
		//load the buffer, get the JSON, delete the buffer to free memory
		var _buffer = buffer_load(_filename);
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
	
		//unstringify and get the data array
		var _loadArray = json_parse(_json);
	
	//set the data in out game to match our loaded data
		global.settingsData = array_get(_loadArray, 0);
		
		global.saveTime1 = global.settingsData.save_1;
		global.saveTime2 = global.settingsData.save_2;
		global.saveTime3 = global.settingsData.save_3;
		global.MASTER_VOL = global.settingsData.save_master;
		global.MASTER_CHOICE = global.settingsData.save_masterChoice;
		global.SFX_VOL = global.settingsData.save_sfx;
		global.SFX_CHOICE = global.settingsData.save_sfxChoice;
		global.MUSIC_VOL = global.settingsData.save_music;
		global.MUSIC_CHOICE = global.settingsData.save_musicChoice;
		global.ScreenShakeAmount = global.settingsData.save_shake;
		global.ScreenShakeName = global.settingsData.save_shakeChoice;
		
		//manually load the text
		var _roomName = room_get_name(room);
		if (_roomName != "rm_title_screen") {
			oPauseMenu.option[1, 0] = "Save to File 1 - " + global.settingsData.save_1;
			oPauseMenu.option[1, 1] = "Save to File 2 - " + global.settingsData.save_2;
			oPauseMenu.option[1, 2] = "Save to File 3 - " + global.settingsData.save_3;
			
			oPauseMenu.option[2, 0] = "Master Volume - " + string(global.settingsData.save_masterChoice) + "%";
			oPauseMenu.option[2, 1] = "Sound Effects Volume - " + string(global.settingsData.save_sfxChoice) + "%";
			oPauseMenu.option[2, 2] = "Music Volume - " + string(global.settingsData.save_musicChoice) + "%";
			oPauseMenu.option[2, 3] = "Screen Shake Intensity - " + global.settingsData.save_shakeChoice;
		} else {
			oTitleMenu.option[1, 0] = "Load File 1 - " + global.settingsData.save_1;
			oTitleMenu.option[1, 1] = "Load File 2 - " + global.settingsData.save_2;
			oTitleMenu.option[1, 2] = "Load File 3 - " + global.settingsData.save_3;
			
			oTitleMenu.option[2, 0] = "Delete File 1 - " + global.settingsData.save_1;
			oTitleMenu.option[2, 1] = "Delete File 2 - " + global.settingsData.save_2;
			oTitleMenu.option[2, 2] = "Delete File 3 - " + global.settingsData.save_3;
			
			oTitleMenu.option[3, 0] = "Master Volume - " + string(global.settingsData.save_masterChoice) + "%";
			oTitleMenu.option[3, 1] = "Sound Effects Volume - " + string(global.settingsData.save_sfxChoice) + "%";
			oTitleMenu.option[3, 2] = "Music Volume - " + string(global.settingsData.save_musicChoice) + "%";
			oTitleMenu.option[3, 3] = "Screen Shake Intensity - " + global.settingsData.save_shakeChoice;
		}
}