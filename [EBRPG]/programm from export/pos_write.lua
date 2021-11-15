local option = ""--дополнительный путь для объектов у которых есть родитель

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

function getEulerAnglesFromMatrix(table)
	local x1,y1,z1, x2,y2,z2, x3,y3,z3 = table[2][1][1],table[2][1][2],table[2][1][3], table[2][2][1],table[2][2][2],table[2][2][3], table[2][3][1],table[2][3][2],table[2][3][3]
	local nz1,nz2,nz3
	nz3 = math.sqrt(x2*x2+y2*y2)
	nz1 = -x2*z2/nz3
	nz2 = -y2*z2/nz3
	local vx = nz1*x1+nz2*y1+nz3*z1
	local vz = nz1*x3+nz2*y3+nz3*z3
	return math.deg(math.asin(z2)),-math.deg(math.atan2(vx,vz)),-math.deg(math.atan2(x2,y2))
end

local pyt = "C:\\test\\frame.txt"
local pyt_new = "C:\\test\\frame_new.txt"
local file_new = io.open(pyt_new, "w")
local file_new_euler = io.open("C:\\test\\frame_new_euler.txt", "w")
local text = ""
local bool_file = false
local table_matrix = {}

for line in io.lines(pyt) do
	if string.find(line, "obj") then
		if io.open("C:\\"..option..string.split(line, "|")[2].."(0).obj", "r") then
			bool_file = true
			text = "{'"..string.split(line, "|")[2]
			table_matrix[1] = string.split(line, "|")[2]
		end
	end

	if bool_file then
		if string.find(line, "Right") then
			text = text.."', { {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
			table_matrix[2] = {tonumber(string.split(line, " ")[1]),tonumber(string.split(line, " ")[2]),tonumber(string.split(line, " ")[3]),0}
		end

		if string.find(line, "Up") then
			text = text.."}, {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
			table_matrix[3] = {tonumber(string.split(line, " ")[1]),tonumber(string.split(line, " ")[2]),tonumber(string.split(line, " ")[3]),0}
		end

		if string.find(line, "Backward") then
			text = text.."}, {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
			table_matrix[4] = {tonumber(string.split(line, " ")[1]),tonumber(string.split(line, " ")[2]),tonumber(string.split(line, " ")[3]),0}
		end

		if string.find(line, "Translation") then
			text = text.."}, {"..tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])..", 0"
			file_new:write(text.."} }, 0},\n")
			bool_file = false

			table_matrix[5] = tostring(string.split(line, " ")[1])..", "..tostring(string.split(line, " ")[2])..", "..tostring(string.split(line, " ")[3])
			local rot = {getEulerAnglesFromMatrix({0, {table_matrix[2],table_matrix[3],table_matrix[4]} })}
			file_new_euler:write("{'"..table_matrix[1].."', {"..table_matrix[5]..", "..rot[1]..", "..rot[2]..", "..rot[3].."}, 0},\n")
			table_matrix = {}
		end
	end
end
file_new:close()
file_new_euler:close()
