local object = {
{'10_nad_patka_03_01', { {0.819152116775513, 0.573576331138611, 0, 0}, {-0.573576331138611, 0.819152116775513, 0, 0}, {0, 0, 1, 0}, {-27.787841796875, 87.1008987426758, -9.91496562957764, 0} }, 0},--пример
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

local file_ipl = io.open("C:\\test\\ipl_coord.txt", "w")
for k,v in ipairs(object) do
	local xr,yr,zr = getEulerAnglesFromMatrix(v)
	local rot = toQuaternion(xr,yr,zr)
	local x,y,z = v[2][4][1],v[2][4][2],v[2][4][3]
	file_ipl:write(v[3]..", "..v[1]..", 0, "..x..", "..y..", "..z..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n")
end

file_ipl:close()
print(os.date())
