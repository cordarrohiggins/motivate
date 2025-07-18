//avoid extra player objects
	if instance_number(oPlayer) > 1 {
		instance_destroy();	
	}

//damage setup
	get_damaged_create(15, true); //player health defined here

//movement variables
#region
	moveDir = 0;
	moveSpeed = 2;
	xSpeed = 0;
	ySpeed = 0;
#endregion

//sprite control
#region
	centerYOffset = -4; //how far up the body your center is from the origin
	centerY = y + centerYOffset; //set in step event
	
	weaponOffsetDist = 4; //how far from the center your weapon is
	aimDir = 0;

	face = 3; //starting face
	sprite[0] = sPlayerRight;
	sprite[1] = sPlayerUp;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerDown;
#endregion

//weapon info
#region
	shootTimer = 0;
	
	//add weapons to player weapon inventory
	array_push(global.PlayerWeapons, global.WeaponList.pistol);
	remove_extra_pistols();
	
	selectedWeapon = 0;
	weapon = global.PlayerWeapons[selectedWeapon];
#endregion