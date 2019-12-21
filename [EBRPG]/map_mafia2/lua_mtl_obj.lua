local object = {
{"19_port_terrain_08", {{-376.5894 ,-791.9777 ,-22.68345 ,0 ,0 ,0},}, 0},
{"19_port_terrain_09", {{-180.7245 ,-802.0427 ,-21.3206 ,0 ,0 ,0},}, 0},
{"19_port_terrain_00", {{225.3384 ,-1033.871 ,-23.68596 ,0 ,0 ,0},}, 0},
{"19_port_terrain_01", {{77.24114 ,-907.9546 ,-21.60631 ,0 ,0 ,0},}, 0},
{"19_port_terrain_02", {{-256.5443 ,-879.8517 ,-21.87175 ,0 ,0 ,0},}, 0},
{"19_port_terrain_03", {{77.24112 ,-896.329 ,-21.7156 ,0 ,0 ,0},}, 0},
{"19_port_terrain_04", {{-40.70748 ,-828.7966 ,-21.92308 ,0 ,0 ,0},}, 0},
{"19_port_terrain_05", {{-343.9799 ,-896.1664 ,-21.87175 ,0 ,0 ,0},}, 0},
{"19_port_terrain_06", {{-153.3349 ,-896.1664 ,-21.87175 ,0 ,0 ,0},}, 0},
{"19_port_terrain_07", {{-256.5443 ,-891.4757 ,-21.76261 ,0 ,0 ,0},}, 0},
{"19_port_terrain_13", {{208.3522 ,-866.377 ,-22.44575 ,0 ,0 ,0},}, 0},
{"19_port_terrain_12", {{70.05488 ,-747.1359 ,-23.07282 ,0 ,0 ,0},}, 0},
{"19_port_terrain_11", {{-65.80672 ,-958.4551 ,-21.86989 ,0 ,0 ,0},}, 0},
{"19_port_terrain_10", {{-153.3349 ,-907.7919 ,-21.76258 ,0 ,0 ,0},}, 0},
{"19_port_terrain_15", {{-343.9798 ,-907.7919 ,-21.76258 ,0 ,0 ,0},}, 0},
{"19_port_terrain_14", {{88.93021 ,-634.8761 ,-22.9376 ,0 ,0 ,0},}, 0},
}
print(os.date())
function string.split(input, separator)

	if type(input) ~= "string" then error("type mismatch in argument #1", 3) end
	if (separator and type(separator) ~= "string") then error("type mismatch in argument #2", 3) end

	if not separator then
		separator = "%s"
	end
	local t = {}
	local i = 1
	for str in string.gmatch(input, "([^"..separator.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

local pyt_new = "C:\\test\\default_new.txt"
--[[local pyt = "C:\\default.txt"
local file = io.open(pyt, "r")
local file_new = io.open(pyt_new, "w")
local text = ""

for line in io.lines(pyt) do
	if string.find(line, "Material") then
		file_new:write(text.."\n")
		text = string.split(line, " ")[2]
	end

	if string.find(line, "File") then
		text = text.." "..tostring(string.split(line, " ")[2])
	end
end]]

for k,v in ipairs(object) do
	local pyt = "C:\\"..v[1].."(0).obj.mtl"
	local file = io.open(pyt, "r")
	local text = {}

	for line in io.lines(pyt) do
		table.insert(text, line)
	end

	for k,line in ipairs(text) do
		for p in io.lines(pyt_new) do
			local spl = string.split(tostring(p), " ")
			if line == "map_kd "..tostring(spl[1])..".dds" then
				text[k] = "map_kd "..tostring(spl[2])
				break
			end
		end
	end

	file:close()

	local file = io.open(pyt, "w")
	for i,v in ipairs(text) do
		file:write(v.."\n")
	end

	file:close()
end

local file_meta = io.open("C:\\test\\meta.txt", "w")
for k,v in ipairs(object) do
	local pyt = "C:\\"..v[1].."(0).obj"
	local file = io.open(pyt, "r")
	local text = {}

	for line in io.lines(pyt) do
		table.insert(text, line)
	end

	for k,line in ipairs(text) do
		if line == "g mesh" then
			text[k] = "g "..v[1]
		end
	end

	file:close()

	local file = io.open(pyt, "w")
	for i,v in ipairs(text) do
		file:write(v.."\n")
	end

	file:close()

	file_meta:write("<file src='port/"..v[1]..".dff'/>\n")
	file_meta:write("<file src='port/"..v[1]..".col'/>\n")
end

file_meta:close()
print(os.date())
