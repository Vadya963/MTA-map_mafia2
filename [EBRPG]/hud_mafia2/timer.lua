local screenWidth, screenHeight = guiGetScreenSize ( )
local timer = {true, 10, 10}
local width_new = 85*width_hd

function timerm2(time)
	timer[1] = true
	timer[2] = time
	timer[3] = time

	setTimer(function ( ... )
		if timer[1] then
			timer[3] = timer[3]-1

			if timer[3] == -1 then
				timer[1] = false
			end
		end
	end, 1000, time+1)
end
addEvent("createHudTimer", true)
addEventHandler("createHudTimer", root, timerm2)

function timerm2off()
	timer[1] = false
end
addEvent("destroyHudTimer", true)
addEventHandler("destroyHudTimer", root, timerm2off)

timerm2(10)

function createText ()

	if timer[1] then
		dxDrawImage ( (screenWidth-width_new), (screenHeight-211-width_new), width_new, width_new, "hud/timer.png" )
		dxDrawCircle ( (screenWidth-width_new)+(width_new/2), (screenHeight-211-width_new)+(width_new/2), 30*width_hd, -90.0, (360.0/timer[2])*timer[3]-90, tocolor( 255,50,50,150 ), tocolor( 255,50,50,150 ) )
		dxDrawImage ( (screenWidth-width_new), (screenHeight-211-width_new), width_new, width_new, "hud/timer_arrow.png", (360.0/timer[2])*timer[3] )
	end
end
addEventHandler ( "onClientRender", root, createText )