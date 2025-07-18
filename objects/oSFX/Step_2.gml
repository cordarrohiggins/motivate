//get the volume
var _sfxVol = global.SFX_VOL * global.MASTER_VOL;

//pistol sound
if pistolSnd == true {
	//play sound
	var _snd = audio_play_sound(sndPistol, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	pistolSnd = false;
}
//bottle sound
if bottleSnd == true {
	//play sound
	var _snd = audio_play_sound(sndWaterBottle, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	bottleSnd = false;
}
//shotgun sound
if shotgunSnd == true {
	//play sound
	var _snd = audio_play_sound(sndShotgun, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	shotgunSnd = false;
}
//sniper sound
if sniperSnd == true {
	//play sound
	var _snd = audio_play_sound(sndSniper, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	sniperSnd = false;
}

//weapon pickup sound
if weaponPickupSnd == true {
	//play sound
	var _snd = audio_play_sound(sndWeaponPickup, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	weaponPickupSnd = false;
}
//heart pickup sound
if heartPickupSnd == true {
	//play sound
	var _snd = audio_play_sound(sndHeartPickup, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	heartPickupSnd = false;
}

//barrel explosion sound
if barrelExplosionSnd == true {
	//play sound
	var _snd = audio_play_sound(sndBarrelExplosion, 9, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	barrelExplosionSnd = false;
}
//crate break sound
if crateBreakSnd == true {
	//play sound
	var _snd = audio_play_sound(sndCrateBreak, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	crateBreakSnd = false;
}

//player death sound
if playerDeathSnd == true {
	//play sound
	var _snd = audio_play_sound(sndPlayerDeath, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	playerDeathSnd = false;
}
//player damage sound
if playerDamageSnd == true {
	//play sound
	var _snd = audio_play_sound(sndPlayerDamage, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	playerDamageSnd = false;
}
//player hit sound
if playerHitSnd == true {
	//play sound
	var _snd = audio_play_sound(sndPlayerHit, 9, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	playerHitSnd = false;
}

//slime death sound
if slimeDeathSnd == true {
	//play sound
	var _snd = audio_play_sound(sndSlimeDamage, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	slimeDeathSnd = false;
}
//fire ball sound
if fireBallSnd == true {
	//play sound
	var _snd = audio_play_sound(sndFireBall, 7, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	fireBallSnd = false;
}
//mole death sound
if moleDeathSnd == true {
	//play sound
	var _snd = audio_play_sound(sndMoleDeath, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	moleDeathSnd = false;
}
//mole dig sound (spawn and attack sound)
if moleDigSnd == true {
	//play sound
	var _snd = audio_play_sound(sndDigging, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	moleDigSnd = false;
}
//throw rock sound
if throwRockSnd == true {
	//play sound
	var _snd = audio_play_sound(sndThrowRock, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	throwRockSnd = false;
}
//rock break sound
if rockBreakSnd == true {
	//play sound
	var _snd = audio_play_sound(sndRockBreak, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	rockBreakSnd = false;
}

//crip mole spawn sound
if cripMoleSpawnSnd == true {
	//play sound
	var _snd = audio_play_sound(sndCripMoleSpawn, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	cripMoleSpawnSnd = false;
}
//crip mole death sound
if cripMoleDeathSnd == true {
	//play sound
	var _snd = audio_play_sound(sndCripMoleDeath, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	cripMoleDeathSnd = false;
}
//crip mole summon 1 sound
if cripMoleSummon1Snd == true {
	//play sound
	var _snd = audio_play_sound(sndCripMoleSummon1, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	cripMoleSummon1Snd = false;
}
//crip mole summon 2 sound
if cripMoleSummon2Snd == true {
	//play sound
	var _snd = audio_play_sound(sndCripMoleSummon2, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	cripMoleSummon2Snd = false;
}
//crip mole direct throw sound
if cripMoleDirectSnd == true {
	//play sound
	var _snd = audio_play_sound(sndCripMoleDirect, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	cripMoleDirectSnd = false;
}
//crip mole circle throw sound
if cripMoleCircleSnd == true {
	//play sound
	var _snd = audio_play_sound(sndCripMoleCircle, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	cripMoleCircleSnd = false;
}
//crip mole dig sound
if cripMoleDigSnd == true {
	//play sound
	var _snd = audio_play_sound(sndCripMoleDig, 7, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	cripMoleDigSnd = false;
}

//game over sound
if gameOverSnd == true {
	//play sound
	var _snd = audio_play_sound(sndGameOver, 7, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	gameOverSnd = false;
}
//level complete sound
if levelEndSnd == true {
	//play sound
	var _snd = audio_play_sound(sndLevelEnd, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	levelEndSnd = false;
}
//room switch sound
if roomSwitchSnd == true {
	//play sound
	var _snd = audio_play_sound(sndRoomSwitch, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	roomSwitchSnd = false;
}

//pause sound
if pauseSnd == true {
	//play sound
	var _snd = audio_play_sound(sndPause, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	pauseSnd = false;
}
//unpause sound
if unpauseSnd == true {
	//play sound
	var _snd = audio_play_sound(sndUnpause, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	unpauseSnd = false;
}
//menu select sound
if selectSnd == true {
	//play sound
	var _snd = audio_play_sound(sndSelect, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	selectSnd = false;
}
//save game sound
if saveSnd == true {
	//play sound
	var _snd = audio_play_sound(sndSaveGame, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	saveSnd = false;
}
//load game sound
if loadSnd == true {
	//play sound
	var _snd = audio_play_sound(sndLoadGame, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//reset variables
	loadSnd = false;
}