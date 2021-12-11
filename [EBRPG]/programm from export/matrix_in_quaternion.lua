local object = {
{'g01_141', { {-0.717953741550446, -0.696090817451477, 0, 0}, {0.696090817451477, -0.717953741550446, 0, 0}, {0, 0, 1.00000011920929, 0}, {-1786.03198242188, -70.6610107421875, -5.42616939544678, 0} }, 0},
{'g01_140', { {-0.997926473617554, 0.0643637925386429, 0, 0}, {-0.0643637925386429, -0.997926473617554, 0, 0}, {0, 0, 0.99999988079071, 0}, {-1715.06323242188, -213.578536987305, -18.2577991485596, 0} }, 0},

}
print(os.date(), #object)

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

local file_ipl = io.open("C:\\test\\ipl_coord.ipl", "w")
file_ipl:write("inst\n")
for k,v in ipairs(object) do
	local xr,yr,zr = getEulerAnglesFromMatrix(v)
	local rot = toQuaternion(xr,yr,zr)-- zr*-1 starting from version 2.13 mafiatoolkit
	local x,y,z = v[2][4][1],v[2][4][2],v[2][4][3]
	file_ipl:write(v[3]..", "..v[1]..", 0, "..x..", "..y..", "..z..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n")
end
file_ipl:write("end\n")
file_ipl:close()
print(os.date())
