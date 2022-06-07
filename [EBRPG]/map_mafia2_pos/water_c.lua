local table_water = {
	[1] = {-1336.3854980469,349.09210205078, -718.77734375,1365.2574462891, {false, false}},--от кинг до хант
	[2] = {-755.57446289063,1365.2574462891, -379.68450927734,1523.5191650391, {false, false}},--около моста в дип
	[3] = {-379.68450927734,1274.3002929688, 1007.826171875,1530.5191650391, {false, false}},--от дип до дамбы
	[4] = {-83.8125,1530.5191650391, 1007.826171875,1931.6591796875, {false, false}},--от ривер до дамбы
	[5] = {-1264.7642822266,194.21995544434, -718.77734375,349.09210205078, {false, false}},--от хант до хант
	[6] = {-1340.3854980469,-412.2067565918, -718.77734375,194.21995544434, {false, false}},--от хант до саус
	[7] = {-1336.3854980469,-2000, -974.7460937,-412.2067565918, {false, false}},--от саус до саус
	[8] = {-718.77734375,1263.2564697266, -631.71551513672,1365.2574462891, {false, false}},--от кинг до кинг
	[9] = {-974.7460937,-2000, 1500.31118774414,-503.91384887695, {false, false}},--от саус до юж мил
	[10] = {813.47155761719,-503.91384887695, 1500.31118774414,-301.46527099609, {false, false}},--от юж мил до юж мил
}
local height = 15

local water_in_tunnel = {
	{createColCuboid( -876, 990, 0, 386, 400, 32 ), 2,8},
	{createColCuboid( -1400, -490, 4, 482, 213, 15 ), 6,7}
}

for k,v in pairs(water_in_tunnel) do
	addEventHandler( "onClientColShapeHit", v[1], 
	function (hitElement, matchingDimension) 
	--The source of this event is the colshape that got hit by a player or vehicle.
		if (getElementType( hitElement ) == "vehicle" and getVehicleType( hitElement ) == "Automobile") or getElementType( hitElement ) == "player" then 
			setElementDimension( table_water[v[2]][5][1], 9999 )
			setElementDimension( table_water[v[2]][5][2], 9999 )
			setElementDimension( table_water[v[3]][5][1], 9999 )
			setElementDimension( table_water[v[3]][5][2], 9999 )
		end
	end)

	addEventHandler( "onClientColShapeLeave", v[1], 
	function (leaveElement, matchingDimension) 
	--The source of this event is the colshape that the element no longer is in contact with.
		if (getElementType( leaveElement ) == "vehicle" and getVehicleType( leaveElement ) == "Automobile") or getElementType( leaveElement ) == "player" then 
			setElementDimension( table_water[v[2]][5][1], 0 )
			setElementDimension( table_water[v[2]][5][2], 0 )
			setElementDimension( table_water[v[3]][5][1], 0 )
			setElementDimension( table_water[v[3]][5][2], 0 )
		end
	end)
end

local swim_time, air_time = 0, 0
setTimer(function ( ... )
	local task = getPedSimplestTask(localPlayer)
	if task == "TASK_SIMPLE_SWIM" then
		swim_time = swim_time+1
	else
		swim_time = 0
	end

	if task == "TASK_SIMPLE_IN_AIR" then
		air_time = air_time+1
	else
		air_time = 0
	end

	if swim_time >= 5 or air_time >= 5 then
		setElementPosition(localPlayer, -400.17102050781,803.42742919922,-18.945209503174+40)
		swim_time, air_time = 0, 0
	end
end, 1000, 0)

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	engineSetSurfaceProperties ( 0, "audio", "concrete" )

	toggleControl( "jump", false )

	setOcclusionsEnabled(false)
	setWaterLevel(-5000, true, true, true, true)
	setFarClipDistance(2000)
	setBirdsEnabled(false)
	setCloudsEnabled(false)
	--setFogDistance(2000)


	for k,v in ipairs(table_water) do
		v[5][1] = createWater ( v[1], v[2], height, v[3], v[2], height, v[1], v[4], height, v[3], v[4], height )
		v[5][2] = createWater ( v[1], v[2], height, v[3], v[2], height, v[1], v[4], height, v[3], v[4], height )
	end

	for k,v in pairs(getElementData(root, "object")) do
		local obj = getLowLODElement(v[2])
		if type(v[5]) == "table" and v[5]["DoubleSided"] then
			setElementDoubleSided(v[2], true)
			if obj then setElementDoubleSided(obj, true) end
		else
			setElementDoubleSided(v[2], false)
			if obj then setElementDoubleSided(obj, false) end
		end
	end
end)