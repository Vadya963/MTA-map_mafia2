local color			= tocolor(240,170,16)
local font			= dxCreateFont("files/font.ttf", 11)
local size			= 1.0
local w,h = 64,32

local tex_plates    = {}
local raw_shader    = [[
	texture platetex;
	technique TexReplace {
		pass P0 {
			Texture[0] = platetex;
		}
	}
]]


local shader_plateback = dxCreateShader(raw_shader)
dxSetShaderValue(shader_plateback, "platetex", dxCreateTexture("files/plate.png", "dxt5"))
engineApplyShaderToWorldTexture(shader_plateback, "plateback*")


local function getPlateShader(veh)
	if not tex_plates[veh] then
		local rt = dxCreateRenderTarget(w,h)
		dxSetRenderTarget(rt)
			dxDrawRectangle(0, 0, w,h, tocolor(41,45,49))
			dxDrawText(getVehiclePlateText(veh) or "", 0, 0, w,h, color, size, font, "center", "center")
		dxSetRenderTarget()
		
		tex_plates[veh] = dxCreateShader(raw_shader)
		dxSetShaderValue(tex_plates[veh], "platetex", rt)
	end
	return tex_plates[veh]
end


local function onStreamIn(vehicle)
	local shader = getPlateShader(vehicle)
	engineApplyShaderToWorldTexture(shader, "custom_car_plate", vehicle)
end

addEventHandler("onClientElementStreamIn", root, function()
	if getElementType(source) == "vehicle" then
		onStreamIn(source)
	end
end)

addEventHandler("onClientElementStreamOut", root, function()
	if tex_plates[source] then
		engineRemoveShaderFromWorldTexture(tex_plates[source], "custom_car_plate", source)
		destroyElement(source)
		tex_plates[source] = nil
	end
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
	local vehicles = getElementsByType("vehicle", root, true)
	for i = 1, #vehicles do
		onStreamIn(vehicles[i])
	end
end)