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

local obj_t = {}
local obj_t_copy = {}
for line in io.lines("C:\\test\\frame_new.txt") do
	if line ~= "" then
		table.insert(obj_t, line)
	end
end 

print(os.date(),"frame_new "..#obj_t)

for j,v in ipairs(obj_t) do
	local t1 = {}
	if v then
		local obj1 = string.split(v, "{',")[1]
		for line in io.lines("C:\\"..option..obj1.."(0).obj") do
			table.insert(t1, line)
		end

		table.insert(obj_t_copy, v)
	end

	obj_t[j] = false

	if #t1 > 0 then
		for k,v in ipairs(obj_t) do
			local t2 = {}
			local c = 0
			local obj2 = v

			if obj2 then
				obj2 = string.split(v, "{',")[1]
				--print("write table", obj1,obj2)

				for line in io.lines("C:\\"..option..obj2.."(0).obj") do
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
						table.insert(obj_t_copy,"--"..v)
						obj_t[k] = false
					end
				else
					--print(obj1.." ~= "..obj2)
				end
			else
				--print(string.split(obj_t[k], "{',")[1])
			end
		end
	end
end

local pyt_new = "C:\\test\\frame_new_copy.txt"
local file_new = io.open(pyt_new, "w")
local pyt_new_copy_euler = io.open("C:\\test\\frame_new_copy_euler.txt", "w")
for i,v in ipairs(obj_t_copy) do
	file_new:write(v.."\n")
	for line in io.lines("C:\\test\\frame_new_euler.txt") do
		if line ~= "" then
			local obj1 = string.split(line, "{',")[1]
			local obj2 = string.split(v, "{',-")[1]
			if obj1 == obj2 then 
				pyt_new_copy_euler:write(line.."\n")
				break
			end
		end
	end
end
file_new:close()
pyt_new_copy_euler:close()
print(os.date())
