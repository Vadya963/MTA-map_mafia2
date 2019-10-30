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
		radarTexture = dxCreateTexture("images/radar.jpg")
		maskTexture1 = dxCreateTexture("images/circle_mask.png")
		maskTexture2 = dxCreateTexture("images/sept_mask.png")

		-- Check everything is ok
		bAllValid = hudMaskShader and radarTexture and maskTexture1 and maskTexture2

		if not bAllValid then
			outputChatBox( "Could not create some things. Please use debugscript 3" )
		else
			dxSetShaderValue( hudMaskShader, "sPicTexture", radarTexture )
			dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture1 )
		end
	end
)

-----------------------------------------------------------------------------------
-- onClientRender
-----------------------------------------------------------------------------------
addEventHandler( "onClientRender", root,
    function()
		if not bAllValid then return end

		--
		-- Switch between mask textures every few seconds for DEMO
		--
		--[[if getTickCount() % 3000 < 2000 then
			dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture1 )
		else
			dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture2 )
		end]]
		dxSetShaderValue( hudMaskShader, "sMaskTexture", maskTexture1 )

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
		dxSetShaderValue( hudMaskShader, "gUVRotAngle", math.rad(-camrot) )

		--
		-- Draw
		--
		dxDrawImage( 100, 200, 100, 100, hudMaskShader, 0,0,0, tocolor(255,255,255,255) )
    end
)
