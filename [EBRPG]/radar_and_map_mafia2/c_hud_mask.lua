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
		maskTexture2 = dxCreateTexture("images/sept_mask.png")

		setPlayerHudComponentVisible("radar", false)

		-- Check everything is ok
		bAllValid = hudMaskShader and radarTexture and maskTexture1 and maskTexture2

		if not bAllValid then
			outputChatBox( "Could not create some things. Please use debugscript 3" )
		else
			dxSetShaderValue( hudMaskShader, "sPicTexture", radarTexture )
			dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture1 )
		end

	createBlip ( -924.17102050781,-474.42742919922,-33.945209503174, 32, 0, 0,0,0,0, 0, 100 )
end)

function getSpeed(vehicle)
	if vehicle then
		local x, y, z = getElementVelocity(vehicle)
		return math.sqrt(math.pow(x, 2) + math.pow(y, 2) + math.pow(z, 2))*111.847--*1.61--узнает скорость авто в км/ч
	end
end

-----------------------------------------------------------------------------------
-- onClientRender
-----------------------------------------------------------------------------------
local screenWidth, screenHeight = guiGetScreenSize ( )
addEventHandler( "onClientRender", root,
	function()
		if not bAllValid or getElementData(localPlayer, "radar_mafia2") then return end

		local vehicle = getPedOccupiedVehicle ( localPlayer )
		if vehicle then--отображение скорости авто
			local speed_car = 0
			local fuel = 5

			if getSpeed(vehicle) >= 140 then
				speed_car = 140*2+40
			else
				speed_car = getSpeed(vehicle)*2+40
			end

			dxDrawImage ( screenWidth-105-146, screenHeight-120, 105, 105, "hud/speed_v.png" )
			dxDrawImage ( screenWidth-105-146, screenHeight-120, 105, 105, "hud/arrow_speed_v.png", speed_car )
			dxDrawImage ( (screenWidth-105-146), screenHeight-120, 105, 105, "hud/fuel_v.png", 30.0-(fuel*1.2) )

			if fuel <= 15 then
				dxDrawImage ( screenWidth-105-146, screenHeight-120, 105, 105, "hud/low_fuel.png" )
			end
		end

		--
		-- Switch between mask textures every few seconds for DEMO
		--
		--[[if getTickCount() % 3000 < 2000 then
			dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture1 )
		else
			dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture2 )
		end]]

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
		dxDrawImage( screenWidth-146, screenHeight-161, 146, 146, hudMaskShader, 0,0,0, tocolor(255,255,255,255) )
		--dxDrawImage( screenWidth-136, screenHeight-151, 126, 126, hudMaskShader, 0,0,0, tocolor(255,255,255,255) )
		dxDrawImage( screenWidth-(146/2)-8, screenHeight-(146/2)-8-15, 16, 16, "images/blips/2.png", -playerrot+camrot,0,0, tocolor(255,255,255,255) )
		dxDrawImage( screenWidth-146, screenHeight-161, 146, 146, "images/radar_ver1.png", 0,0,0, tocolor(255,255,255,255) )
		--dxDrawImage( screenWidth-146, screenHeight-161, 146, 146, "images/radar_ver2.png", 0,0,0, tocolor(255,255,255,255) )
		dxDrawImage( screenWidth-146, screenHeight-161, 146, 146, "images/pointer.png", camrot,0,0, tocolor(255,255,255,255) )
	end
)
