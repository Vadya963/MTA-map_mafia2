local weapon = {
	[23] = {"silenced", 347, 64,449, 59,34, 7},
	[24] = {"desert_eagle", 348, 242,230, 84,42, 6},
	[31] = {"m4", 356, 61,415, 119,33, 50},
	[30] = {"ak47", 355, 176,448, 112,34, 30},
	[25] = {"chromegun", 349, 105,340, 138,22, 8},
	[29] = {"mp5", 353, 0,0, 106,59, 30},
	[33] = {"rifle", 357, 105,313, 143,26, 8},
	[22] = {"colt45", 346, 123,449, 53,38, 6},
	[34] = {"sniper", 358, 64,487, 135,25, 5},

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

	setElementData(root, "custom_weapon", weapon)
end
addEventHandler ( "onResourceStart", resourceRoot, displayLoadedRes )

addCommandHandler ( "giveWeapon",
function (playerid, cmd, id )
	giveWeapon(playerid, id)
end)

addCommandHandler ( "wanted",
function (playerid, cmd, id )
	setPlayerWantedLevel(playerid, id)
end)

----цвета----
local color_mes = {
	color_tips = {168,228,160},--бабушкины яблоки
	yellow = {255,255,0},--желтый
	red = {255,0,0},--красный
	red_try = {200,0,0},--красный
	blue = {0,150,255},--синий
	white = {255,255,255},--белый
	green = {0,255,0},--зеленый
	green_try = {0,200,0},--зеленый
	turquoise = {0,255,255},--бирюзовый
	orange = {255,100,0},--оранжевый
	orange_do = {255,150,0},--оранжевый do
	pink = {255,100,255},--розовый
	lyme = {130,255,0},--лайм админский цвет
	svetlo_zolotoy = {255,255,130},--светло-золотой
	crimson = {220,20,60},--малиновый
	purple = {175,0,255},--фиолетовый
	gray = {150,150,150},--серый
	green_rc = {115,180,97},--темно зеленый
}

function isPointInCircle3D(x, y, z, x1, y1, z1, radius)
	if getDistanceBetweenPoints3D(x, y, z, x1, y1, z1) <= radius then
		return true
	else
		return false
	end
end

function getPlayerVehicle( localPlayer, seat )
	local vehicle = getPedOccupiedVehicle ( localPlayer )
	if seat and vehicle then
		local player = getVehicleOccupant ( vehicle, seat )
		if localPlayer == player then
			return vehicle
		else
			return false
		end
	else
		return vehicle
	end
end

function sendMessage(playerid, text, color)
	local time = getRealTime()
	local hour = time["hour"]
	local minute = time["minute"]
	local second = time["second"]

	if time["hour"] < 10 then
		hour = "0"..hour
	end

	if time["minute"] < 10 then
		minute = "0"..minute
	end

	if time["second"] < 10 then
		second = "0"..second
	end

	outputChatBox("["..hour..":"..minute..":"..second.."] "..text, playerid, color[1], color[2], color[3])
end

function me_chat(playerid, text)
	local x,y,z = getElementPosition(playerid)

	for k,player in pairs(getElementsByType("player")) do
		local x1,y1,z1 = getElementPosition(player)

		if isPointInCircle3D(x,y,z, x1,y1,z1, 10 ) then
			sendMessage(player, text, color_mes.pink)
		end
	end
end

addEvent("event_server_car_trunk_and_hood", true)
addEventHandler ( "event_server_car_trunk_and_hood", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )
	local vehicleid = getPlayerVehicle( playerid )
	local spl = split(state, ",")

	for k,vehicle in pairs(getElementsByType("vehicle")) do
		local x1,y1,z1 = getElementPosition(vehicle)
		local plate = getVehiclePlateText ( vehicle )

		if isPointInCircle3D(x,y,z, x1,y1,z1, 5) and not vehicleid then
			if spl[2] == "trunk" then
				if spl[1] == "true" then
					setVehicleDoorOpenRatio ( vehicle, 1, 1, 500 )
					me_chat(playerid, playername.." открыл(а) багажник")
				elseif spl[1] == "false" then
					setVehicleDoorOpenRatio ( vehicle, 1, 0, 500 )
					me_chat(playerid, playername.." закрыл(а) багажник")
				end
			end
			return
		end
	end
end)

addEvent("event_server_car_door", true)
addEventHandler("event_server_car_door", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )

	for k,vehicle in pairs(getElementsByType("vehicle")) do
		local x1,y1,z1 = getElementPosition(vehicle)
		local plate = getVehiclePlateText ( vehicle )

		if isPointInCircle3D(x,y,z, x1,y1,z1, 5) then
			if state == "true" then
				setVehicleLocked ( vehicle, true )
				me_chat(playerid, playername.." закрыл(а) двери")
			else
				setVehicleLocked ( vehicle, false )
				me_chat(playerid, playername.." открыл(а) двери")
			end
			return
		end
	end
end)

addEvent("event_server_car_light", true)
addEventHandler("event_server_car_light", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )
	local vehicleid = getPlayerVehicle( playerid, 0 )

	if vehicleid then
		if state == "true" then
			setVehicleOverrideLights ( vehicleid, 2 )
		else
			setVehicleOverrideLights ( vehicleid, 1 )
		end
	end
end)

addEvent("event_server_car_engine", true)
addEventHandler ( "event_server_car_engine", root,
function ( playerid, state )
	local playername = getPlayerName ( playerid )
	local x,y,z = getElementPosition(playerid)
	local vehicleid = getPlayerVehicle( playerid, 0 )
	
	if vehicleid then
		if state == "true" then
			setVehicleEngineState(vehicleid, true)
			me_chat(playerid, playername.." завел(а) двигатель")
		else
			setVehicleEngineState(vehicleid, false)
			me_chat(playerid, playername.." заглушил(а) двигатель")
		end
	end
end)

addEvent("event_server_anim_player", true)
addEventHandler("event_server_anim_player", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )
	local spl = split(state, ",")

	if spl[1] ~= "nil" then
		if spl[3] == "true" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, true, false, false, false)
		elseif spl[3] == "one" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, false, false, false, false)
		elseif spl[3] == "walk" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, true, true, false, false)
		elseif spl[3] == "false" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, false, false, false, true)
		end
	else
		setPedAnimation(playerid, nil, nil)
	end
end)