//constructor for weapons
function create_weapon(_sprite = sPistol, _length = 0, _bulletObj = oPistolBullet, _cooldown = 1, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup) constructor {
	sprite = _sprite; 
	length = _length;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
}

//players weapon inventory
global.PlayerWeapons = array_create(0);

//the weapons
global.WeaponList = {
	pistol : new create_weapon(
		sPistol,
		sprite_get_bbox_right(sPistol) - sprite_get_xoffset(sPistol),
		oParentBullet,
		12,
		1,
		0,
		sPistolPickup
		),
		
	bottle : new create_weapon(
		sBottle,
		sprite_get_bbox_right(sBottle) - sprite_get_xoffset(sBottle),
		oBottleBullet,
		0,
		1,
		15,
		sBottlePickup
		),
		
	shotgun : new create_weapon(
		sShotgun,
		sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
		oShotgunBullet,
		40,
		7,
		45,
		sShotgunPickup
		),
		
		sniper : new create_weapon(
		sSniper,
		sprite_get_bbox_right(sSniper) - sprite_get_xoffset(sSniper),
		oSniperBullet,
		100,
		1,
		0,
		sSniperPickup
		),
}

function remove_extra_pistols() {
    var pistolID = global.WeaponList.pistol;
    var seenPistol = false;
    var i = 0;
	if global.newGame == false {
	    // Use a while-loop because array_delete shrinks the array in-place
	    while (i < array_length(global.PlayerWeapons)) {
	        if (global.PlayerWeapons[i] == pistolID) {
	            if (!seenPistol) {
	                // first time seeing a pistol, keep it
	                seenPistol = true;
	                i++;
	            } else {
	                // second (or later) pistol: delete it, don't advance i
	                array_delete(global.PlayerWeapons, i, 1);
					i--;
	            }
	        } else {
	            i++;
	        }
	    }
	}
}