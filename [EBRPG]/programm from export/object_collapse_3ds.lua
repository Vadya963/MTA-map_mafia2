local value = false--true - matrix, false - euler angles, nil - euler angles in table
local name_write = false--true write name object_collapse[1][1], false v[1] and recording coordinates for 3d max
local object_collapse = {
{'12_118', {-0.370585918426514, -36.8212509155273, -7.50809574127197, 0, -0, -0}, 0},
{'CHODNIKY__01', {-0.37935546040535, -22.7262496948242, -6.66429662704468, 0, -0, -0}, 0},
{'CHODNIKY__02', {-2.64199209213257, 17.5420303344727, -4.85767555236816, 0, -0, -0}, 0},
{'CHODNIKY__03', {-0.444140613079071, -1.67859375476837, 7.436279296875, 0, -0, -0}, 0},
{'CHODNIKY__04', {-0.37935546040535, -23.2913284301758, -6.66714334487915, 0, -0, -0}, 0},
{'TELO_BARAKU', {-0.444140613079071, -1.67859375476837, 7.436279296875, 0, -0, 179.99999499104}, 0},
}

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

function toQuaternion(x,y,z)
	local z,y,x = math.rad(z),math.rad(y),math.rad(x)
	-- Abbreviations for the various angular functions
	local cz = math.cos(z * 0.5);
	local sz = math.sin(z * 0.5);
	local cy = math.cos(y * 0.5);
	local sy = math.sin(y * 0.5);
	local cx = math.cos(x * 0.5);
	local sx = math.sin(x * 0.5);

	local q = {}
	q.w = cz * cy * cx + sz * sy * sx;
	q.x = cz * cy * sx - sz * sy * cx;
	q.y = sz * cy * sx + cz * sy * cx;
	q.z = sz * cy * cx - cz * sy * sx;
	return q;
end

function ifElse(condition, trueReturn, falseReturn)
	if (condition) then return trueReturn
	else return falseReturn end
end

local name = object_collapse[1][1]
local pyt_new = "C:\\test\\object_collapse.ipl"
local pyt_3d_max = "C:\\test\\3d_max_coord.ms"
local file_new = io.open(pyt_new, "w")
local file_ms = io.open(pyt_3d_max, "w")

file_new:write("inst\n")

for k,v in ipairs(object_collapse) do
	if value == true then
		local x,y,z = v[2][4][1],v[2][4][2],v[2][4][3]
		local xr,yr,zr = getEulerAnglesFromMatrix(v)
		--zr = zr*-1 --starting from version 2.13 mafiatoolkit
		local rot = toQuaternion(xr,yr,zr)
		file_new:write(v[3]..", "..ifElse(name_write, name, v[1])..", 0, "..x-object_collapse[1][2][4][1]..", "..y-object_collapse[1][2][4][2]..", "..z-object_collapse[1][2][4][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
		if not name_write then file_ms:write("$"..v[1]..".pos.x = "..x-object_collapse[1][2][4][1].."\n$"..v[1]..".pos.y = "..y-object_collapse[1][2][4][2].."\n$"..v[1]..".pos.z = "..z-object_collapse[1][2][4][3].."\n$"..v[1]..".rotation.x_rotation = "..xr.."\n$"..v[1]..".rotation.y_rotation = "..yr.."\n$"..v[1]..".rotation.z_rotation = "..(zr*-1).."\n") end
	elseif value == false then
		local xr,yr,zr = v[2][4],v[2][5],v[2][6]
		local x,y,z = v[2][1],v[2][2],v[2][3]
		local rot = toQuaternion(xr,yr,zr)
		file_new:write(v[3]..", "..ifElse(name_write, name, v[1])..", 0, "..x-object_collapse[1][2][1]..", "..y-object_collapse[1][2][2]..", "..z-object_collapse[1][2][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
		if not name_write then file_ms:write("$"..v[1]..".pos.x = "..x-object_collapse[1][2][1].."\n$"..v[1]..".pos.y = "..y-object_collapse[1][2][2].."\n$"..v[1]..".pos.z = "..z-object_collapse[1][2][3].."\n$"..v[1]..".rotation.x_rotation = "..xr.."\n$"..v[1]..".rotation.y_rotation = "..yr.."\n$"..v[1]..".rotation.z_rotation = "..(zr*-1).."\n") end
	elseif value == nil then
		for k,v in pairs(object_collapse[1][2]) do
			local xr,yr,zr = v[4],v[5],v[6]
			local x,y,z = v[1],v[2],v[3]
			local rot = toQuaternion(xr,yr,zr)
			file_new:write(object_collapse[1][3]..", "..name..", 0, "..x-object_collapse[1][2][1][1]..", "..y-object_collapse[1][2][1][2]..", "..z-object_collapse[1][2][1][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
			if not name_write then file_ms:write("$"..name..".pos.x = "..x-object_collapse[1][2][1][1].."\n$"..v[1]..".pos.y = "..y-object_collapse[1][2][1][2].."\n$"..v[1]..".pos.z = "..z-object_collapse[1][2][1][3].."\n$"..v[1]..".rotation.x_rotation = "..xr.."\n$"..v[1]..".rotation.y_rotation = "..yr.."\n$"..v[1]..".rotation.z_rotation = "..(zr*-1).."\n") end
		end
	end
end

file_new:write("end\n")
file_new:close()
file_ms:close()
