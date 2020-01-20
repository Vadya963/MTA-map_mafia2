local weapon = {
	[23] = {"silenced", 347, 64,449, 59,34, 7},
	[24] = {"desert_eagle", 348, 242,230, 84,42, 6},
	[31] = {"m4", 356, 61,415, 119,33, 50},
	[30] = {"ak47", 355, 176,448, 112,34, 30},
	[25] = {"chromegun", 349, 105,340, 138,22, 8},
	[29] = {"mp5", 353, 0,0, 106,59, 30},
	[33] = {"rifle", 357, 64,487, 135,25, 5},
	[22] = {"colt45", 346, 123,449, 53,38, 6},

	[16] = {"grenade", 342, 268,482, 19,30, 0},
	[5] = {"bat", 336, 124,188, 119,29, 0},
	[4] = {"knifecur", 335, 199,482, 69,30, 0},
	[1] = {"brassknuckle", 331, 0,411, 31,36, 0},
	[3] = {"nitestick", 334, 242,202, 84,28, 0},
	[18] = {"molotov", 344, 0,370, 39,41, 0},
	[6] = {"shovel", 337, 0,525, 158,27, 0},
	[15] = {"gun_cane", 326, 160,534, 106,21, 0},
}

function displayLoadedRes ( res )--старт ресурсов
	for k,v in pairs(weapon) do
		if k > 18 then
			setWeaponProperty(k, "poor", "maximum_clip_ammo", v[7])
			setWeaponProperty(k, "std", "maximum_clip_ammo", v[7])
			setWeaponProperty(k, "pro", "maximum_clip_ammo", v[7])
		end
	end

	setElementData(resourceRoot, "custom_weapon", weapon)
end
addEventHandler ( "onResourceStart", resourceRoot, displayLoadedRes )

addCommandHandler ( "giveWeapon",
function (playerid, cmd, id )
	giveWeapon(playerid, id)
end)