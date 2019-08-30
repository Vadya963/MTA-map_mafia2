local ground = engineLoadTXD ( ":map_mafia2/ground.txd" )
local kingstone_city = engineLoadTXD ( ":map_mafia2/kingstone.txd" )

local kingstone = {
	--объекты
	{"teren0", ground, -1204.44200, 1429.81300, -8.26321, 90, 0, 0},
	{"teren1", ground, -1337.13700, 1197.12900, -19.87857, 90, 0, 0},
	{"teren2", ground, -1198.80000, 1248.14300, -19.91991, 90, 0, 0},
	{"teren3", ground, -1650.80900, 1692.52800, 2.05191, 90, 0, 0},
	{"teren4", ground, -1451.41700, 1807.72800, 9.42347, 90, 0, 0},
	{"teren5", ground, -1287.17800, 1797.35500, 15.24572, 90, 0, 0},
	{"teren6", ground, -1085.39000, 1797.35500, 10.50450, 90, 0, 0},
	{"teren7", ground, -964.84580, 1654.89300, 7.83806, 90, 0, 0},
	{"teren8", ground, -1116.54600, 1601.18200, 3.27992, 90, 0, 0},
	{"teren9", ground, -1003.10600, 1410.77600, -14.00727, 90, 0, 0},
	{"teren10", ground, -1349.63700, 1604.33000, 2.60039, 90, 0, 0},
	{"teren11", ground, -1561.34300, 1590.94100, -3.09693, 90, 0, 0},
	{"teren12", ground, -1394.53000, 1408.82500, -8.76358, 90, 0, 0},
	{"teren13", ground, -1174.98700, 1147.74200, -30.72144, 90, 0, 0},
	{"tunel7", ground, -622.97620, 1344.20400, -29.87234, 90, 0, 0},
	{"tunel4", ground, -622.97620, 1344.20400, -29.87234, 90, 0, 0},
	{"tunel5", ground, -622.97620, 1344.20400, -29.87234, 90, 0, 0},
	{"tunel3", ground, -622.97620, 1344.20400, -31.87234, 90, 0, 0},
	{"tunel0", ground, -622.97620, 1344.20400, -31.87234, 90, 0, 0},
	{"tunel1", ground, -622.97620, 1344.20400, -29.87234, 90, 0, 0},
	{"rantl6", ground, -1070.41900, 1523.53100, 1.51440, 90, 0, 0},
	{"rantl8", ground, -1043.01200, 1409.40500, -9.67674, 90, 0, 0},
	{"rantl9", ground, -1151.84300, 1421.08100, -8.16802, 90, 0, 0},
	{"rantl13", ground, -1504.13600, 1556.09400, -6.97555, 90, 0, -90},
	{"rantl14", ground, -1479.56400, 1501.99700, -9.77325, 90, 0, 0},
	{"rantl15", ground, -1420.28900, 1453.08000, -9.31285, 90, 0, -90},
	{"rantl16", ground, -1495.49400, 1669.62600, 0.77649, 90, 0, -90},
	{"rantl21", kingstone_city, -1127.41200, 1368.93500, -14.22700, 90, 0, 180},
	{"04_tunel_portal", kingstone_city, -878.27620, 1390.79200, -24.14059, 90, 0, 0},
	{"04_moloA", ground, -1077.21400, 1323.41800, -24.08780, 90, 0, 0},
	{"04_moloB", ground, -1003.06900, 1316.76700, -24.08780, 90, 0, 0},
	{"04_moloC", ground, -1119.15100, 1222.68200, -24.08780, 90, 0, 0},
	{"04_moloD", ground, -1119.15100, 1302.39500, -24.08780, 90, 0, 0},
}

local start = true
addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	if start then
		start = false
		
		for i=550,20000 do
			removeWorldModel(i,10000,0,0,0)
		end
		setOcclusionsEnabled(false)
		setWaterLevel(-5000)
		
		for k,v in ipairs(kingstone) do
			local model = k+614

			while true do
				if getObjectNameFromModel(model) then
					break
				else
					model = model+1
				end
			end

			engineImportTXD ( v[2], model )
			local dff = engineLoadDFF ( ":map_mafia2/kingstone/"..v[1]..".dff" )
			engineReplaceModel ( dff, model )
			local col = engineLoadCOL ( ":map_mafia2/kingstone/"..v[1]..".col" )
			engineReplaceCOL ( col, model )

			local obj = createObject(model, v[3],v[4],v[5], v[6],v[7],v[8])
			setObjectBreakable(obj, false)
			setElementFrozen(obj, true)
			engineSetModelLODDistance(model, 30000)
		end
	end
end)