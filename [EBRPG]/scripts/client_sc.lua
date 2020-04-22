local screenWidth, screenHeight = guiGetScreenSize ( )

local table_water = {
	{0, -1336.3854980469,349.09210205078, -718.77734375,1365.2574462891},--от кинг до хант
	{0, -755.57446289063,1365.2574462891, -379.68450927734,1523.5191650391},--около моста в дип
	{0, -379.68450927734,1274.3002929688, 1007.826171875,1530.5191650391},--от дип до дамбы
	{0, -83.8125,1530.5191650391, 1007.826171875,1931.6591796875},--от ривер до дамбы
	{0, -1264.7642822266,194.21995544434, -718.77734375,349.09210205078},--от хант до хант
	{0, -1340.3854980469,-412.2067565918, -718.77734375,194.21995544434},--от хант до саус
	{0, -1336.3854980469,-2000, -974.7460937,-412.2067565918},--от саус до саус
	{0, -718.77734375,1263.2564697266, -631.71551513672,1365.2574462891},--от кинг до кинг
	{0, -974.7460937,-2000, 1500.31118774414,-503.91384887695},--от саус до юж мил
	{0, 813.47155761719,-503.91384887695, 1500.31118774414,-301.46527099609},--от юж мил до юж мил
}

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )

	engineSetSurfaceProperties ( 0, "audio", "concrete" )
	engineSetSurfaceProperties ( 0, "canclimb", true )

	setOcclusionsEnabled(false)
	setWaterLevel(-5000)
	setFarClipDistance(2000)
	setBirdsEnabled(false)
	setCloudsEnabled(false)
	--setFogDistance(2000)

	local height = 75
	for k,v in ipairs(table_water) do
		table_water[k][1] = createWater ( v[2], v[3], height, v[4], v[3], height, v[2], v[5], height, v[4], v[5], height )
	end
end)

function dxdrawtext(text, x, y, width, height, color, scale, font)
	dxDrawText ( text, x+1, y+1, width, height, tocolor ( 0, 0, 0, 255 ), scale, font )

	dxDrawText ( text, x, y, width, height, color, scale, font )
end

local swim_time, air_time = 0, 0
setTimer(function ( ... )
	local task = getPedSimplestTask(localPlayer)
	--[[if task == "TASK_SIMPLE_SWIM" then
		swim_time = swim_time+1
	else
		swim_time = 0
	end]]

	if task == "TASK_SIMPLE_IN_AIR" then
		air_time = air_time+1
	else
		air_time = 0
	end

	if swim_time >= 5 or air_time >= 5 then
		setElementPosition(localPlayer, -400.17102050781,803.42742919922,-18.945209503174+100)
		swim_time = 0
	end
end, 1000, 0)

local hud = false
function createText ()

	if hud then
		setTime(10, 0)
		
		local x,y,z = getElementPosition(localPlayer)
		local task = getPedSimplestTask(localPlayer)

		local amount = 0
		for k,v in ipairs ( getElementsByType ( "object" ) ) do
			if isElementStreamedIn ( v ) then
				amount = amount + 1
			end
		end

		dxdrawtext ( task..", "..swim_time..", "..air_time..", streamed obj "..amount, 0, 200, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )

		for k,v in ipairs(getElementData(root, "object")) do
			if isElementStreamedIn ( v[2] ) then
				local j = {getElementPosition(v[2])}
				local model = getElementModel(v[2])
				if getDistanceBetweenPoints3D(x, y, z, j[1],j[2],j[3]) <= 100 then
					local coords = { getScreenFromWorldPosition( j[1],j[2],j[3]+1, 0, false ) }
					if coords[1] and coords[2] then
						dxdrawtext ( v[1], coords[1]-(dxGetTextWidth ( v[1], 1, "default-bold" )/2), coords[2]-15, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
						dxdrawtext ( model, coords[1]-(dxGetTextWidth ( model, 1, "default-bold" )/2), coords[2]-15*2, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
					end
				end
			end
		end
	end
end
addEventHandler ( "onClientRender", root, createText )

addCommandHandler ( "water",
function ( cmd, level )
	for k,v in ipairs(table_water) do
		setWaterLevel(v[1], level)
	end
	outputChatBox(level)
end)

addCommandHandler ( "ebdimwater",
function (cmd, id )
	for k,v in ipairs(table_water) do
		if tonumber(id) == k then
			setElementDimension(v[1], 0)
		elseif tonumber(id) == 0 then
			setElementDimension(v[1], 0)
		else
			setElementDimension(v[1], 1)
		end
	end
end)

addCommandHandler ( "hud",
function ( cmd )
	hud = not hud
end)

addCommandHandler ( "ebdimplayer",
function ( cmd, level )
	setElementDimension(localPlayer, tonumber(level))
end)

addCommandHandler ( "ebdim",
function (cmd, level, bool )
	for k,v in ipairs(getElementData(root, "object")) do
		setElementDimension(v[2], tonumber(level))
		if bool == "true" then
			local obj = getLowLODElement(v[2])
			setElementDimension(obj, tonumber(level))
		end
	end
end)

addCommandHandler ( "ebdimobj",
function (cmd, id, level )
	for k,v in ipairs(getElementData(root, "object")) do
		if tonumber(id) == v[3] then
			setElementDimension(v[2], level)
			local obj = getLowLODElement(v[2])
			setElementDimension(obj, level)
		end
	end
end)