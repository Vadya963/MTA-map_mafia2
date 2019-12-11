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

local pyt = "C:\\test\\frame.txt"
local pyt_new = "C:\\test\\frame_new.txt"
local file_new = io.open(pyt_new, "w")
local text = ""
local bool_file = false

for line in io.lines(pyt) do
	if string.find(line, "obj") then
		if io.open("C:\\"..string.split(line, " ")[2].."(0).obj", "r") then
			bool_file = true
			text = "{'"..string.split(line, " ")[2]
		end
	end

	if bool_file then
		if string.find(line, "Right") then
			text = text.."', { {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
		end

		if string.find(line, "Up") then
			text = text.."}, {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
		end

		if string.find(line, "Backward") then
			text = text.."}, {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
		end

		if string.find(line, "Translation") then
			text = text.."}, {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
			file_new:write(text.."} }, 0},\n")
			bool_file = false
		end
	end
end
file_new:close()
