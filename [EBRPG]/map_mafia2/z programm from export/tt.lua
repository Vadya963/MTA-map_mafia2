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

local obj_t = {}
local obj_t_copy = {}
for line in io.lines("C:\\test\\frame_new.txt") do
	obj_t[#obj_t+1] = line
	obj_t_copy[#obj_t_copy+1] = line
end


for k,v in ipairs(obj_t) do
	local t1 = {}
	local t2 = {}
	local c = 0
	local obj1 = string.split(obj_t[k], "{',")[1]
	local obj2 = obj_t[k+1]

	if obj2 then
		obj2 = string.split(obj_t[k+1], "{',")[1]
		--print("write table", obj1,obj2)
		for line in io.lines("C:\\"..obj1.."(0).obj") do
			table.insert(t1, line)
		end

		for line in io.lines("C:\\"..obj2.."(0).obj") do
			table.insert(t2, line)
		end
		--print("write table OK", obj1,obj2)
		--print("size", #t1,#t2)
		if #t1 == #t2 then
			for i=1,#t1 do
				if t1[i] == t2[i] then
					c = c+1
				end
			end

			--print("size c", c+1)
			if #t1 == c+1 and #t2 == c+1 then
				--print(obj1.." = "..obj2)
				obj_t_copy[k+1] = "--"..obj_t_copy[k+1]
			end
		else
			--print(obj1.." ~= "..obj2)
		end
	else
		--print(string.split(obj_t[k], "{',")[1])
	end
end

local pyt_new = "C:\\test\\frame_new_copy.txt"
local file_new = io.open(pyt_new, "w")
for i,v in ipairs(obj_t_copy) do
	file_new:write(v.."\n")
end
file_new:close()
