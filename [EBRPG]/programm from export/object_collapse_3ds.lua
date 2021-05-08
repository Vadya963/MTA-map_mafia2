local value = true--true matrix, false euler angles
local object_collapse = {
{'PLOT_inst_sl__12', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-64.6461334228516, 79.2269897460938, 300, 0} }, 0},
{'PLOT_inst_sl__13', { {-0.130526065826416, -0.991444885730743, 0, 0}, {0.991444885730743, -0.130526065826416, 0, 0}, {0, 0, 1, 0}, {15.3194208145142, -45.8282203674316, 300, 0} }, 0},
{'PLOT_inst_sl__10', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-64.646125793457, 45.56103515625, 300, 0} }, 0},
{'PLOT_inst_sl__11', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-64.6461334228516, 70.802604675293, 300, 0} }, 0},
{'PLOT_inst_sl__09', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-64.6461181640625, 62.4097900390625, 300, 0} }, 0},
{'PLOT_inst_sl__08', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-64.6461181640625, 53.985408782959, 300, 0} }, 0},
{'PLOT_inst_sl__01', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-50.8402709960938, -34.7854881286621, 300, 0} }, 0},
{'PLOT_inst_sl__03', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-62.7541389465332, -22.8716106414795, 300, 0} }, 0},
{'PLOT_inst_sl__02', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-56.7972068786621, -28.8285541534424, 300, 0} }, 0},
{'PLOT_inst_sl__05', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-65.6921157836914, -7.20432615280151, 300, 0} }, 0},
{'PLOT_inst_sl__04', { {1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {-44.8833389282227, -40.742431640625, 300, 0} }, 0},
{'PLOT_inst_sl__07', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-65.6921081542969, 9.64442825317383, 300, 0} }, 0},
{'PLOT_inst_sl__06', { {0.707106947898865, 0.707106649875641, 0, 0}, {-0.707106649875641, 0.707106947898865, 0, 0}, {0, 0, 1, 0}, {-65.6921157836914, 1.22004878520966, 300, 0} }, 0},
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
		local rot = toQuaternion(xr,yr,zr)
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
