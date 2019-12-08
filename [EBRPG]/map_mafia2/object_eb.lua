local eb_textures = false
local object_data = false

local start = true
local table_water = {
	{0, -1321.8791503906,500.7979736328,-20.698886871338, -610.97723388672,1365.2574462891,-16.659574508667},
	{0, -755.57446289063,1365.2574462891,-16.659574508667, -379.68450927734,1523.5191650391,-23.234601974487},
	{0, -379.68450927734,1274.3002929688,-16.659574508667, 1007.826171875,1532.5191650391,-23.234601974487},
	{0, -83.8125,1523.5191650391,-16.659574508667, 1007.826171875,1931.6591796875,-23.234601974487},
}
addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	if start then
		start = false
		object_data = getElementData(resourceRoot, "object")

		for i=550,20000 do
			removeWorldModel(i,10000,0,0,0)
		end
		setOcclusionsEnabled(false)
		setWaterLevel(-5000)
		engineSetSurfaceProperties ( 0, "audio", "concrete" )
		engineSetSurfaceProperties ( 0, "canclimb", true )

		--[[for k,v in pairs(table_water) do
			table_water[k][1] = createWater ( v[2], v[3], -25, v[5], v[3], -25, v[2], v[6], -25, v[5], v[6], -25 )
		end]]

		for i,v in ipairs(object_data) do
			setObjectBreakable(v[2], false)
		end

		eb_textures = engineLoadTXD ( ":map_mafia2/eb_textures.txd" )

		for k,v in ipairs(getElementData(resourceRoot, "no_col_object")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/"..v[4].."/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/"..v[4].."/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "kingstone")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/kingstone/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/kingstone/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "dipton")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/dipton/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/dipton/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "highbrook")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/highbrook/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/highbrook/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "hillwood")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/hillwood/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/hillwood/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "riverside")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/riverside/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/riverside/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "greenfield")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/greenfield/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/greenfield/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "hunters")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/hunters/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/hunters/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end

		for k,v in ipairs(getElementData(resourceRoot, "sandisland")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/sandisland/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/sandisland/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)
		end
	end
end)

local function dxdrawtext(text, x, y, width, height, color, scale, font)
	dxDrawText ( text, x+1, y+1, width, height, tocolor ( 0, 0, 0, 255 ), scale, font )

	dxDrawText ( text, x, y, width, height, color, scale, font )
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
		setElementPosition(localPlayer, -1606.3515625,639.96655273438,-9.3480110168457)
		swim_time = 0
	end
end, 1000, 0)

local hud = false
function createText ()
	
	if hud then
		setTime(15, 0)
		
		local x,y,z = getElementPosition(localPlayer)
		local task = getPedSimplestTask(localPlayer)

		dxdrawtext ( task..", "..swim_time..", "..air_time, 0, 200, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )

		for k,v in ipairs(object_data) do
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
addEventHandler ( "onClientRender", root, createText )

addCommandHandler ( "water",
function ( cmd, level )
	for k,v in pairs(table_water) do
		setWaterLevel(v[1], level)
	end
	outputChatBox(level)
end)

addCommandHandler ( "hud",
function ( cmd )
	hud = not hud
end)