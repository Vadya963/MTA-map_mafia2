local value = true--true matrix, false euler angles
local object_collapse = {
{'3PO_wood_door', {{1 ,0 ,0 ,0}, {0 ,1 ,0 ,0}, {0 ,0 ,1 ,0}, {-422.4453 ,778.3784 ,-17.83264 ,0},}, 0},
{'3PO_wood_door04', {{5.960465E-08 ,1 ,0 ,0}, {-1 ,5.960465E-08 ,0 ,0}, {0 ,0 ,1 ,0}, {-444.3612 ,742.7476 ,-17.83264 ,0},}, 0},
{'3PO_wood_door01', {{1 ,0 ,0 ,0}, {0 ,1 ,0 ,0}, {0 ,0 ,1 ,0}, {-444.1415 ,778.3874 ,-17.83264 ,0},}, 0},
{'3PO_wood_door02', {{-1 ,-1.509958E-07 ,0 ,0}, {1.509958E-07 ,-1 ,0 ,0}, {0 ,0 ,1 ,0}, {-438.6436 ,741.0653 ,-17.83264 ,0},}, 0},
{'3PO_wood_door03', {{3.576279E-07 ,-1 ,0 ,0}, {1 ,3.576279E-07 ,0 ,0}, {0 ,0 ,1 ,0}, {-422.2255 ,746.8673 ,-17.83264 ,0},}, 0},
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

local name = object_collapse[1][1]
local pyt_new = "C:\\test\\object_collapse.ipl"
local file_new = io.open(pyt_new, "w")

file_new:write("inst\n")

for k,v in pairs(object_collapse) do
	if value then
		local x,y,z = v[2][4][1],v[2][4][2],v[2][4][3]
		local xr,yr,zr = getEulerAnglesFromMatrix(v)
		local rot = toQuaternion(xr,yr,zr)-- zr*-1 from mafiatoolkit ver 2.13
		file_new:write(v[3]..", "..name..", 0, "..x-object_collapse[1][2][4][1]..", "..y-object_collapse[1][2][4][2]..", "..z-object_collapse[1][2][4][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
	else
		local xr,yr,zr = v[2][4],v[2][5],v[2][6]
		local x,y,z = v[2][1],v[2][2],v[2][3]
		local rot = toQuaternion(xr,yr,zr)
		file_new:write(v[3]..", "..name..", 0, "..x-object_collapse[1][2][1]..", "..y-object_collapse[1][2][2]..", "..z-object_collapse[1][2][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
	end
end

file_new:write("end\n")
file_new:close()
