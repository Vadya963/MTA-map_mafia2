local eb_textures = engineLoadTXD ( ":map_mafia2/eb_textures.txd" )

local start = true
-- Setting water properties.
height = 1
SizeVal = 2998
-- Defining variables.
southWest_X = -SizeVal
southWest_Y = -SizeVal
southEast_X = SizeVal
southEast_Y = -SizeVal
northWest_X = -SizeVal
northWest_Y = SizeVal
northEast_X = SizeVal
northEast_Y = SizeVal
addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	if start then
		start = false

		for i=550,20000 do
			removeWorldModel(i,10000,0,0,0)
		end
		setOcclusionsEnabled(false)
		setWaterLevel(-5000)

		--water = createWater ( southWest_X, southWest_Y, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
		--setWaterLevel(water, -25)

		for i,v in ipairs(getElementData(resourceRoot, "object")) do
			setObjectBreakable(v, false)
		end

		for k,v in ipairs(getElementData(resourceRoot, "no_col_object")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/"..v[4].."/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/"..v[4].."/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)

			print(v[1], v[3])
		end

		for k,v in ipairs(getElementData(resourceRoot, "kingstone")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/kingstone/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/kingstone/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)

			print(v[1], v[3])
		end

		for k,v in ipairs(getElementData(resourceRoot, "dipton")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/dipton/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/dipton/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)

			print(v[1], v[3])
		end

		for k,v in ipairs(getElementData(resourceRoot, "riverside")) do
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/riverside/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/riverside/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )

			engineSetModelLODDistance(v[3], 30000)

			print(v[1], v[3])
		end
	end
end)

local function dxdrawtext(text, x, y, width, height, color, scale, font)
	dxDrawText ( text, x+1, y+1, width, height, tocolor ( 0, 0, 0, 255 ), scale, font )

	dxDrawText ( text, x, y, width, height, color, scale, font )
end

local hud = true
function createText ()
	
	if hud then
		setTime(15, 0)
		
		local x,y,z = getElementPosition(localPlayer)
		local task = getPedSimplestTask(localPlayer)

		dxdrawtext ( task, 0, 200, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )

		for k,v in ipairs(getElementData(resourceRoot, "kingstone")) do
			for k,j in ipairs(v[2]) do
				if getDistanceBetweenPoints3D(x, y, z, j[1],j[2],j[3]) <= 100 then
					local coords = { getScreenFromWorldPosition( j[1],j[2],j[3]+1, 0, false ) }
					if coords[1] and coords[2] then
						dxdrawtext ( v[1], coords[1]-(dxGetTextWidth ( v[1], 1, "default-bold" )/2), coords[2]-15, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
						dxdrawtext ( v[3], coords[1]-(dxGetTextWidth ( v[3], 1, "default-bold" )/2), coords[2]-15*2, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
					end
				end
			end
		end
		for k,v in ipairs(getElementData(resourceRoot, "dipton")) do
			for k,j in ipairs(v[2]) do
				if getDistanceBetweenPoints3D(x, y, z, j[1],j[2],j[3]) <= 100 then
					local coords = { getScreenFromWorldPosition( j[1],j[2],j[3]+1, 0, false ) }
					if coords[1] and coords[2] then
						dxdrawtext ( v[1], coords[1]-(dxGetTextWidth ( v[1], 1, "default-bold" )/2), coords[2]-15, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
						dxdrawtext ( v[3], coords[1]-(dxGetTextWidth ( v[3], 1, "default-bold" )/2), coords[2]-15*2, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
					end
				end
			end
		end
		for k,v in ipairs(getElementData(resourceRoot, "riverside")) do
			for k,j in ipairs(v[2]) do
				if getDistanceBetweenPoints3D(x, y, z, j[1],j[2],j[3]) <= 100 then
					local coords = { getScreenFromWorldPosition( j[1],j[2],j[3]+1, 0, false ) }
					if coords[1] and coords[2] then
						dxdrawtext ( v[1], coords[1]-(dxGetTextWidth ( v[1], 1, "default-bold" )/2), coords[2]-15, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
						dxdrawtext ( v[3], coords[1]-(dxGetTextWidth ( v[3], 1, "default-bold" )/2), coords[2]-15*2, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
					end
				end
			end
		end
	end
end
addEventHandler ( "onClientRender", root, createText )

addCommandHandler ( "water",
function ( cmd, level )
	setWaterLevel(water, level)
	outputChatBox(level)
end)

addCommandHandler ( "hud",
function ( cmd )
	hud = not hud
end)