local object = {
{"S01_teren_10", {{-1604.519 ,135.3419 ,-10.69615 ,0 ,0 ,0},}, 0},
{"S01_teren_11", {{-1429.481 ,-124.6859 ,-22.53036 ,0 ,0 ,0},}, 0},
{"S01_teren_12", {{-1664.039 ,-278.4519 ,-19.63948 ,0 ,0 ,0},}, 0},
{"S01_teren_13", {{-1543.002 ,29.44431 ,-14.88921 ,0 ,0 ,0},}, 0},
{"S01_teren_14", {{-1706.251 ,24.71739 ,-7.902571 ,0 ,0 ,0},}, 0},
{"S01_teren_16", {{-1614.846 ,-120.9671 ,-15.04712 ,0 ,0 ,0},}, 0},
{"S01_teren_18", {{-1429.481 ,-124.6859 ,-22.53036 ,0 ,0 ,0},}, 0},
{"S01_teren_19", {{-1686.095 ,170.0035 ,-6.842525 ,0 ,0 ,0},}, 0},
{"S01_teren_03", {{-1445.945 ,-284.025 ,-26.48739 ,0 ,0 ,0},}, 0},
{"S01_teren_02", {{-1652.368 ,-396.004 ,-18.30915 ,0 ,0 ,0},}, 0},
{"S01_teren_01", {{-1870.107 ,55.6395 ,-8.367309 ,0 ,0 ,0},}, 0},
{"S01_teren_00", {{-1710.804 ,125.5705 ,-4.757999 ,0 ,0 ,0},}, 0},
{"S01_teren_07", {{-1614.846 ,-120.9671 ,-15.04712 ,0 ,0 ,0},}, 0},
{"S01_teren_06", {{-1488.942 ,145.4182 ,-17.09416 ,0 ,0 ,0},}, 0},
{"S01_teren_05", {{-1406.742 ,24.69863 ,-19.40648 ,0 ,0 ,0},}, 0},
{"S01_teren_04", {{-1801.388 ,45.95226 ,-3.420988 ,0 ,0 ,0},}, 0},
{"S01_teren_09", {{-1775.656 ,-96.56422 ,-11.28849 ,0 ,0 ,0},}, 0},
{"S01_teren_08", {{-1423.53 ,-354.218 ,-20.33894 ,0 ,0 ,0},}, 0},
{"S01_teren_21", {{-1424.16 ,124.8455 ,-19.77644 ,0 ,0 ,0},}, 0},
--[[{"", {{ ,0 ,0 ,0},}, 0},
{"", {{ ,0 ,0 ,0},}, 0},
{"", {{ ,0 ,0 ,0},}, 0},
{"", {{ ,0 ,0 ,0},}, 0},
{"", {{ ,0 ,0 ,0},}, 0},]]
}

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

local pyt_new = "C:\\default_new.txt"
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

for k,v in pairs(object) do
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

local file_meta = io.open("C:\\meta.txt", "w")
for k,v in pairs(object) do
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

	file_meta:write("<file src='sandisland/"..v[1]..".dff'/>\n")
	file_meta:write("<file src='sandisland/"..v[1]..".col'/>\n")
end

file_meta:close()