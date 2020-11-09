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
		setElementPosition(localPlayer, -400.17102050781,803.42742919922,-18.945209503174+100)
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

	local height = 75
	for k,v in ipairs(table_water) do
		table_water[k][1] = createWater ( v[2], v[3], height, v[4], v[3], height, v[2], v[5], height, v[4], v[5], height )
	end

	for k,v in pairs(getElementData(root, "object")) do
		local obj = getLowLODElement(v[2])
		if v[5] then
			setElementDoubleSided(v[2], true)
			if obj then setElementDoubleSided(obj, true) end
		else
			setElementDoubleSided(v[2], false)
			if obj then setElementDoubleSided(obj, false) end
		end
	end

	setTimer(function()
		triggerServerEvent("event_spawnplayer", localPlayer)
	end, 1000, 1)
end)