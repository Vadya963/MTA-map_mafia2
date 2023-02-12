local object = {

}
local file_t = fileCreate( "true.ipl" )
local file_f = fileCreate( "false.ipl" )
local file_3d = fileCreate( "3d_max_coord.ms" )

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

function posInArea(x,y,x2,y2)
	local w,h = 255,255
	return (x-w <= x2 and x2 <= x+w) and (y-h <= y2 and y2 <= y+h)
end

if #object > 0 then
	local xa,ya,za = object[1][2][4][1],object[1][2][4][2],object[1][2][4][3]
	for i,v in ipairs(object) do
		local name = v[1]

		local obj = createObject(615, 0,0,0, 0,0,0)
		setElementMatrix(obj, v[2])
		local x,y,z = getElementRotation(obj)
		setElementRotation(obj, x,y,z)

		local x,y,z = getElementPosition( obj )
		local xr,yr,zr = getElementRotation( obj )
		local rot = toQuaternion(xr,yr,zr)

		if posInArea(xa,ya,x,y) then 
			fileSetPos( file_t, fileGetSize( file_t ) )
			fileWrite(file_t, v[3]..", "..name..", 0, "..x-xa..", "..y-ya..", "..z-za..", "..rot.x..", "..rot.y..", "..rot.z..", "..rot.w..", -1\n" )
			fileWrite(file_3d, "$"..name..".pos.x = "..x-xa.."\n$"..name..".pos.y = "..y-ya.."\n$"..name..".pos.z = "..z-za.."\n$"..name..".rotation.x_rotation = "..xr.."\n$"..name..".rotation.y_rotation = "..yr.."\n$"..name..".rotation.z_rotation = "..(zr*-1).."\n")
		else
			fileSetPos( file_f, fileGetSize( file_f ) )
			fileWrite(file_f, "{'"..v[1].."', { {"..v[2][1][1]..", "..v[2][1][2]..", "..v[2][1][3]..", "..v[2][1][4].."}, {"..v[2][2][1]..", "..v[2][2][2]..", "..v[2][2][3]..", "..v[2][2][4].."}, {"..v[2][3][1]..", "..v[2][3][2]..", "..v[2][3][3]..", "..v[2][3][4].."}, {"..v[2][4][1]..", "..v[2][4][2]..", "..v[2][4][3]..", "..v[2][4][4].."} }, 0},\n" )
		end
	end
end

fileClose( file_t )
fileClose( file_f )
fileClose( file_3d )