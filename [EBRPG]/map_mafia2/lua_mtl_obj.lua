local object = {
{"20_tunel_08_B", {{-1160.255 ,-390.7116 ,-33.82021 ,0 ,0 ,0},
{-1160.255 ,-376.5988 ,-33.82021 ,0 ,0 ,-180},}, 0},
{"20_tunel_03_A", {{-1160.256 ,-376.4995 ,-29.91878 ,0 ,0 ,-180},
{-1160.255 ,-390.811 ,-29.91878 ,0 ,0 ,0},}, 0},
{"20_tunel_02_A", {{-1160.255 ,-390.8108 ,-29.91878 ,0 ,0 ,0},
{-1160.256 ,-376.4995 ,-29.91878 ,0 ,0 ,-180},}, 0},
{"20_tunel_01_B", {{-1160.256 ,-376.4996 ,-29.91878 ,0 ,0 ,-180},
{-1160.255 ,-390.8108 ,-29.91878 ,0 ,0 ,0},}, 0},
{"20_tunel_07_A", {{-1160.255 ,-376.5988 ,-33.82021 ,0 ,0 ,-180},
{-1160.255 ,-390.7118 ,-33.82021 ,0 ,0 ,0},}, 0},
{"20_tunel_06_A", {{-1160.255 ,-390.7116 ,-33.82021 ,0 ,0 ,0},
{-869.3834 ,-458.7735 ,-33.82021 ,0 ,0 ,-180},}, 0},
{"20_tunel_05_B", {{-1160.255 ,-376.5988 ,-33.82021 ,0 ,0 ,-180},
{-1160.255 ,-390.7116 ,-33.82021 ,0 ,0 ,0},}, 0},
{"20_tunel_04_B", {{-1160.255 ,-390.8108 ,-29.91878 ,0 ,0 ,0},
{-1160.256 ,-376.4995 ,-29.91878 ,0 ,0 ,-180},}, 0},
{"20_vjezd_01", {{-917.6298 ,-467.3858 ,-31.56042 ,0 ,0 ,0},}, 0},
{"20_vjezd_02", {{-917.6298 ,-467.3858 ,-31.56042 ,0 ,0 ,0},}, 0},
{"20_vjezd_03", {{-854.0522 ,-491.1537 ,-2 ,0 ,0 ,0},}, 0},
{"20_vjezd_04", {{-917.6298 ,-467.3858 ,-31.30848 ,0 ,0 ,0},}, 0},
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
print(os.date())
