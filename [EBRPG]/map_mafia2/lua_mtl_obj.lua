local object = {
{'tunel12', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-881.455932617188, -483.994140625, -26.6085548400879, 0} }, 0},
{'tunel13', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-854.05224609375, -491.153747558594, -2.00000047683716, 0} }, 0},
{'tunel11', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-881.35107421875, -455.009552001953, -28.1173095703125, 0} }, 0},
{'tunel00', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-917.692016601563, -467.560546875, -22.4119052886963, 0} }, 0},

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

local file_meta = io.open("C:\\test\\meta.txt", "w")
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

	file_meta:write("<file src='southport/"..v[1]..".dff'/>\n")
	file_meta:write("<file src='southport/"..v[1]..".col'/>\n")
end

file_meta:close()
print(os.date())
