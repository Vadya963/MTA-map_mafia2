local value = nil--true matrix, false euler angles, nil other
local object_collapse = {
{'14_plot_svah__04', {{-0.08671875 ,1303.536 ,55.61641 ,0 ,0 ,0},
{21.7834 ,1303.536 ,55.61641 ,0 ,0 ,0},
{-0.08671875 ,1280.721 ,61.70739 ,0 ,0 ,0},
{21.7834 ,1280.721 ,61.70739 ,0 ,0 ,0},
{150.941 ,1312.585 ,52.73891 ,0 ,0 ,0},
{168.5385 ,1312.585 ,52.73891 ,0 ,0 ,0},
{189.0309 ,1314.27 ,52.70752 ,0 ,0 ,0},
{206.6284 ,1314.27 ,52.70752 ,0 ,0 ,0},
{225.9795 ,1315.688 ,53.40806 ,0 ,0 ,0},
{243.577 ,1315.688 ,53.40806 ,0 ,0 ,0},
{263.3451 ,1314.679 ,55.63765 ,0 ,0 ,0},
{280.9426 ,1314.679 ,55.63765 ,0 ,0 ,0}}, 0},
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
	if value == true then
		local x,y,z = v[2][4][1],v[2][4][2],v[2][4][3]
		local xr,yr,zr = getEulerAnglesFromMatrix(v)
		local rot = toQuaternion(xr,yr,zr)-- zr*-1 from mafiatoolkit ver 2.13
		file_new:write(v[3]..", "..name..", 0, "..x-object_collapse[1][2][4][1]..", "..y-object_collapse[1][2][4][2]..", "..z-object_collapse[1][2][4][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
	elseif value == false then
		local xr,yr,zr = v[2][4],v[2][5],v[2][6]
		local x,y,z = v[2][1],v[2][2],v[2][3]
		local rot = toQuaternion(xr,yr,zr)
		file_new:write(v[3]..", "..name..", 0, "..x-object_collapse[1][2][1]..", "..y-object_collapse[1][2][2]..", "..z-object_collapse[1][2][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
	elseif value == nil then
		for k,v in pairs(object_collapse[1][2]) do
			local xr,yr,zr = v[4],v[5],v[6]
			local x,y,z = v[1],v[2],v[3]
			local rot = toQuaternion(xr,yr,zr)
			file_new:write(object_collapse[1][3]..", "..name..", 0, "..x-object_collapse[1][2][1][1]..", "..y-object_collapse[1][2][1][2]..", "..z-object_collapse[1][2][1][3]..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
		end
	end
end

file_new:write("end\n")
file_new:close()
