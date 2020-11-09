function dxdrawtext(text, x, y, width, height, color, scale, font)
	dxDrawText ( text, x+1, y+1, width, height, tocolor ( 0, 0, 0, 255 ), scale, font )

	dxDrawText ( text, x, y, width, height, color, scale, font )
end

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

		dxdrawtext ( task..", streamed obj "..amount, 0, 200, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )

		for k,v in ipairs(getElementData(root, "object")) do
			if isElementStreamedIn ( v[2] ) and not isElementLowLOD( v[2] ) then
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
		if bool == "true" then
			local obj = getLowLODElement(v[2])
			if obj then
				setElementDimension(obj, tonumber(level))
			end
		else
			setElementDimension(v[2], tonumber(level))
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