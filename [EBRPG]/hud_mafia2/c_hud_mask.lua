------------------------------------------------------
--
-- c_hud_mask.lua
--

----------------------------------------------------------------
-- onClientResourceStart
----------------------------------------------------------------
addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		-- Create things
		hudMaskShader = dxCreateShader("hud_mask.fx")
		radarTexture = dxCreateTexture("images/radar2.png")
		maskTexture1 = dxCreateTexture("images/circle_mask.png")

		setPlayerHudComponentVisible("radar", false)
		setPlayerHudComponentVisible ("area_name", false )
		setPlayerHudComponentVisible ("health", false )
		setPlayerHudComponentVisible ("armour", false )

		-- Check everything is ok
		bAllValid = hudMaskShader and radarTexture and maskTexture1

		if not bAllValid then
			outputChatBox( "Could not create some things. Please use debugscript 3" )
		else
			dxSetShaderValue( hudMaskShader, "sPicTexture", radarTexture )
			dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture1 )
		end
end)

function getSpeed(vehicle)
	if vehicle then
		local x, y, z = getElementVelocity(vehicle)
		return math.sqrt(math.pow(x, 2) + math.pow(y, 2) + math.pow(z, 2))*111.847--*1.61--узнает скорость авто в км/ч
	end
end

function findRotation(x1,y1,x2,y2)
local t = -math.deg(math.atan2(x2-x1,y2-y1))
if t < 0 then t = t + 360 end
return t
end

function getDistanceRotation(x, y, dist, angle)
local a = math.rad(90 - angle)
local dx = math.cos(a) * dist
local dy = math.sin(a) * dist
return x+dx, y+dy
end

function getPedMaxHealth(ped)
	-- Output an error and stop executing the function if the argument is not valid
	assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ 'getPedMaxHealth' [Expected ped/player at argument 1, got " .. tostring(ped) .. "]")

	-- Grab his player health stat.
	local stat = getPedStat(ped, 24)

	-- Do a linear interpolation to get how many health a ped can have.
	-- Assumes: 100 health = 569 stat, 200 health = 1000 stat.
	local maxhealth = 100 + (stat - 569) / 4.31

	-- Return the max health. Make sure it can't be below 1
	return math.max(1, maxhealth)
end

-----------------------------------------------------------------------------------
-- onClientRender
-----------------------------------------------------------------------------------
local screenWidth, screenHeight = guiGetScreenSize ( )
local sx,sy = screenWidth, screenHeight
local width_map = 146
local width_speed = 105
local posx = screenWidth-(width_map*width_hd)+10
local posy = screenHeight-(width_map*width_hd)-5
local height = width_map*width_hd-20
local centerleft = posx + height / 2
local centertop = posy + height / 2
local lp = getLocalPlayer()
local range = 230
addEventHandler( "onClientRender", root,
	function()
		if not bAllValid or getElementData(localPlayer, "radar_mafia2") or getElementInterior(localPlayer) ~= 0 or getElementDimension(localPlayer) ~= 0 then return end

		local vehicle = getPedOccupiedVehicle ( localPlayer )
		if vehicle then--отображение скорости авто
			local width_new = width_speed*width_hd
			local speed_car = 0
			local fuel = 5

			if getSpeed(vehicle) >= 140 then
				speed_car = 140*2+40
			else
				speed_car = getSpeed(vehicle)*2+40
			end

			dxDrawImage ( screenWidth-width_new-width_map*width_hd, screenHeight-width_new-15, width_new, width_new, "hud/speed_v.png" )
			dxDrawImage ( screenWidth-width_new-width_map*width_hd, screenHeight-width_new-15, width_new, width_new, "hud/arrow_speed_v.png", speed_car )
			dxDrawImage ( (screenWidth-width_new-width_map*width_hd), screenHeight-width_new-15, width_new, width_new, "hud/fuel_v.png", 30.0-(fuel*1.2) )

			if fuel <= 15 then
				dxDrawImage ( screenWidth-width_new-width_map*width_hd, screenHeight-width_new-15, width_new, width_new, "hud/low_fuel.png" )
			end
		end

		--
		-- Transform world x,y into -0.5 to 0.5
		--
		local x,y = getElementPosition(localPlayer)
		x = ( x ) / 6000
		y = ( y ) / -6000
		dxSetShaderValue( hudMaskShader, "gUVPosition", x,y )

		--
		-- Zoom
		--
		local zoom = 13
		--zoom = zoom + math.sin( getTickCount() / 500 ) * 3		-- Zoom animation for DEMO
		dxSetShaderValue( hudMaskShader, "gUVScale", 1/zoom, 1/zoom )

		--
		-- Rotate to camera direction - OPTIONAL
		--
		local _,_,camrot = getElementRotation( getCamera() )
		local _,_,playerrot = getElementRotation( localPlayer )
		dxSetShaderValue( hudMaskShader, "gUVRotAngle", math.rad(-camrot) )

		--
		-- Draw
		--
		local width_new = width_map*width_hd
		dxDrawImage( screenWidth-width_new, screenHeight-width_new-15, width_new, width_new, "images/radar_ver1.png", 0,0,0, tocolor(255,255,255,255) )
		dxDrawCircle ( (screenWidth-width_new)+(width_new/2), (screenHeight-width_new-15)+(width_new/2), 72*width_hd, 83.0, (-166.0/getPedMaxHealth(localPlayer))*getElementHealth(localPlayer)+83, tocolor( 111,154,104,255 ), tocolor( 111,154,104,255 ) )
		dxDrawCircle ( (screenWidth-width_new)+(width_new/2), (screenHeight-width_new-15)+(width_new/2), 72*width_hd, 97.0, (166.0/100)*getPedArmor(localPlayer)+97, tocolor( 0, 102, 255,255 ), tocolor( 0, 102, 255,255 ) )
		dxDrawImage( screenWidth-width_new+10, screenHeight-width_new-5, width_new-20, width_new-20, hudMaskShader, 0,0,0, tocolor(255,255,255,255) )
		dxDrawImage( screenWidth-width_new, screenHeight-width_new-15, width_new, width_new, "images/radar_ver2.png", 0,0,0, tocolor(255,255,255,255) )
		dxDrawImage( screenWidth-width_new, screenHeight-width_new-15, width_new, width_new, "images/pointer.png", camrot,0,0, tocolor(255,255,255,255) )
		
		--blips
		local px, py, pz = getElementPosition(lp)
		local cx,cy,_,tx,ty = getCameraMatrix()
		local north = findRotation(cx,cy,tx,ty)
		for id, v in ipairs(getElementsByType("blip")) do
			local _,_,rot = getElementRotation(v)
			local ex, ey, ez = getElementPosition(v)
			local dist = getDistanceBetweenPoints2D(px,py,ex,ey)
			local blipdist = getBlipVisibleDistance (v)

			if dist > range then
				dist = tonumber(range)
			end

			local angle = 180-north + findRotation(px,py,ex,ey)
			local cblipx, cblipy = getDistanceRotation(0,0, (height/2)*(dist/range), angle)
			local icon=getBlipIcon(v) or 0
			local blipsize=(getBlipSize(v)*2 or 2)*4
			local r,g,b,a=getBlipColor(v)
			
			if icon~=0 then
				r,g,b=255,255,255
				blipsize=16
			end

			blipsize=blipsize*width_hd

			local blipx = centerleft+cblipx-(blipsize/2)
			local blipy = centertop+cblipy-(blipsize/2)

			if (getDistanceBetweenPoints3D ( px, py, pz, ex, ey, ez ) <= blipdist ) then
				dxDrawImage(blipx, blipy, blipsize, blipsize, "images/blips/"..icon..".png", 0, 0, 0, tocolor(r,g,b,a))
			end
		end
		dxDrawImage( screenWidth-(width_new/2)-(16*width_hd/2), screenHeight-(width_new/2)-(16*width_hd/2)-15, 16*width_hd, 16*width_hd, "images/blips/2.png", -playerrot+camrot,0,0, tocolor(255,255,255,255) )
	end
)