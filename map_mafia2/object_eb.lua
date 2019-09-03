local ground = engineLoadTXD ( ":map_mafia2/ground.txd" )
local kingstone_city = engineLoadTXD ( ":map_mafia2/kingstone.txd" )

local kingstone = {
	--объекты
	{"teren0", ground, {{-1204.44200, 1429.81300, -8.26321, 90, 0, 0}}, 0},
	{"teren1", ground, {{-1337.13700, 1197.12900, -19.87857, 90, 0, 0}}, 0},
	{"teren2", ground, {{-1198.80000, 1248.14300, -19.91991, 90, 0, 0}}, 0},
	--{"teren3", ground, {{-1650.80900, 1692.52800, 2.05191, 90, 0, 0}}, 0},
	--{"teren4", ground, {{-1451.41700, 1807.72800, 9.42347, 90, 0, 0}}, 0},
	--{"teren5", ground, {{-1287.17800, 1797.35500, 15.24572, 90, 0, 0}}, 0},
	--{"teren6", ground, {{-1085.39000, 1797.35500, 10.50450, 90, 0, 0}}, 0},
	{"teren7", ground, {{-964.84580, 1654.89300, 7.83806, 90, 0, 0}}, 0},
	{"teren8", ground, {{-1116.54600, 1601.18200, 3.27992, 90, 0, 0}}, 0},
	{"teren9", ground, {{-1003.10600, 1410.77600, -14.00727, 90, 0, 0}}, 0},
	{"teren10", ground, {{-1349.63700, 1604.33000, 2.60039, 90, 0, 0}}, 0},
	{"teren11", ground, {{-1561.34300, 1590.94100, -3.09693, 90, 0, 0}}, 0},
	{"teren12", ground, {{-1394.53000, 1408.82500, -8.76358, 90, 0, 0}}, 0},
	{"teren13", ground, {{-1174.98700, 1147.74200, -30.72144, 90, 0, 0}}, 0},
	{"tunel7", ground, {{-622.97620, 1344.20400, -29.87234, 90, 0, 0}}, 0},
	{"tunel4", ground, {{-622.97620, 1344.20400, -29.87234, 90, 0, 0}}, 0},
	{"tunel5", ground, {{-622.97620, 1344.20400, -29.87234, 90, 0, 0}}, 0},
	{"tunel3", ground, {{-622.97620, 1344.20400, -31.87234, 90, 0, 0}}, 0},
	{"tunel0", ground, {{-622.97620, 1344.20400, -31.87234, 90, 0, 0}}, 0},
	{"tunel1", ground, {{-622.97620, 1344.20400, -29.87234, 90, 0, 0}}, 0},
	{"rantl6", ground, {{-1070.41900, 1523.53100, 1.51440, 90, 0, 0}}, 0},
	{"rantl8", ground, {{-1043.01200, 1409.40500, -9.67674, 90, 0, 0}}, 0},
	{"rantl9", ground, {{-1151.84300, 1421.08100, -8.16802, 90, 0, 0}}, 0},
	{"rantl13", ground, {{-1504.13600, 1556.09400, -6.97555, 90, 0, -90}}, 0},
	{"rantl14", ground, {{-1479.56400, 1501.99700, -9.77325, 90, 0, 0}}, 0},
	{"rantl15", ground, {{-1420.28900, 1453.08000, -9.31285, 90, 0, -90}}, 0},
	{"rantl16", ground, {{-1495.49400, 1669.62600, 0.77649, 90, 0, -90}}, 0},
	{"rantl21", kingstone_city, {{-1127.41200, 1368.93500, -14.22700, 90, 0, 180}}, 0},
	{"04_tunel_portal", kingstone_city, {{-878.27620, 1390.79200, -24.14059, 90, 0, 0}}, 0},
	{"04_moloA", ground, {{-1077.21400, 1323.41800, -24.08780, 90, 0, 0}}, 0},
	{"04_moloB", ground, {{-1003.06900, 1316.76700, -24.08780, 90, 0, 0}}, 0},
	{"04_moloC", ground, {{-1119.15100, 1222.68200, -24.08780, 90, 0, 0}}, 0},
	{"04_moloD", ground, {{-1119.15100, 1302.39500, -24.08780, 90, 0, 0}}, 0},
	{"04_rantl01A", ground, {{-1007.66800,1347.22600,-19.24800,90,0,0}}, 0},
	{"04_rantl02A", ground, {{-1063.30100,1347.22600,-19.24800,90,0,0}}, 0},
	{"04_rantl03A", ground, {{-1182.24300,1207.90800,-17.23683,90,0,0}}, 0},
	{"04_rantl03B", ground, {{-1119.15100,1206.61200,-22.82823,90,0,0},{-1119.15100,1318.93900,-22.82823, 90,0,180}}, 0},
	{"04_rantl03C", ground, {{-1172.13200,1260.76000,-17.09620,90,0,0}}, 0},
	{"04_rantl04A", ground, {{-1292.93200,1166.94500,-19.23755,90,0,0}}, 0},
	{"04_rantl04B", ground, {{-1206.91700,1166.94500,-19.24800,90,0,0}}, 0},
	{"04_rantl05A", ground, {{-1359.85500,1119.77300,-19.92285,90,0,0}}, 0},
	{"04_rantl05B", ground, {{-1282.72800,1140.60500,-24.75047,90,0,0}}, 0},
	{"04_rantl05C", ground, {{-1323.28200,1133.36400,-20.06538,90,0,0}}, 0},
	{"04_rantl07A", ground, {{-1176.53600,1619.63900,8.62659,90,0,0}}, 0},
	{"04_rantl07B", ground, {{-1194.15900,1648.59800,9.44057,90,0,0}}, 0},
	{"04_rantl07C", ground, {{-994.32150,1651.06100,9.48711,90,0,0}}, 0},
	{"04_rantl07D", ground, {{-1128.46400,1541.55500,4.61663,90,0,0}}, 0},
	{"04_rantl07E", ground, {{-1200.15100,1539.49300,2.34151,90,0,0}}, 0},
	{"04_schudky", ground, {{-1431.06500,1660.22600,5.83288,90,0,0}}, 0},
	{"04_rantl10A", ground, {{-1419.56800,1601.90000,1.18277,90,0,0}}, 0},
	{"04_rantl10B", ground, {{-1401.12300,1553.50500,1.80054,90,0,0}}, 0},
	{"04_rantl12A", ground, {{-1293.65300,1523.79500,-3.46030,90,0,0}}, 0},
	{"04_rantl12C", ground, {{-1283.38900,1442.35100,-7.93181,90,0,0}}, 0},
	{"04_rantl12D", ground, {{-1323.30000,1429.04000,-9.84217,90,0,0}}, 0},
	{"04_rantl12E", ground, {{-1317.04100,1538.98600,0.95081,90,0,0}}, 0},
	{"04_rantl12F", ground, {{-1222.86000,1537.95600,2.18715,90,0,0}}, 0},
	{"04_rantl17A", ground, {{-1467.08200,1453.16100,-12.08815,90,0,0}}, 0},
	{"04_rantl17B", ground, {{-1393.32900,1501.24600,-3.03211,90,0,-90}}, 0},
	{"04_rantl18A", ground, {{-1531.46200,1634.46500,-4.24416,90,0,-90}}, 0},
	{"04_rantl18C", ground, {{-1564.68800,1668.15900,-3.13756,90,0,-90}}, 0},
	{"04_rantl19A", ground, {{-1169.37900,1319.43200,-19.24800,90,0,0}}, 0},
	{"04_rantl19C", ground, {{-1131.76100,1350.19000,-19.24800,90,0,0}}, 0},
	{"04_rantl20A", ground, {{-1288.34700,1646.62600,9.81464,90,0,0}}, 0},--к ней можно попасть?
	{"04_rantl20B", ground, {{-1348.90300,1616.72500,9.60061,90,0,0}}, 0},--?
	{"04_rantl20C", ground, {{-1329.97300,1588.20400,5.03857,90,0,0}}, 0},--?
	{"04_rantl20D", ground, {{-1235.94600,1658.60500,10.06001,90,0,0}}, 0},
	{"04_rantl20E", ground, {{-1225.28500,1607.25600,6.75437,90,0,0}}, 0},
	{"04_rantl22A", ground, {{-932.91530,1361.10400,-19.24800,90,0,0}}, 0},
	{"04_rantl22C", ground, {{-941.62000,1372.01700,-19.24800,90,0,0}}, 0},
	{"04_schodynoveuFF", ground, {{-1611.38900,1659.00400,-2.04312,90,0,-90}}, 0},
	{"04_plot01", kingstone_city, {{-1033.77700,1730.94000,12.03265,90,0,0}}, 0},
	{"04_plot02A", kingstone_city, {{-1383.20600,1698.44200,11.64970,90,0,0}}, 0},
	{"04_plot02B", kingstone_city, {{-897.83040,1608.76200,8.74751,90,0,0}}, 0},
	{"04_plot02C", kingstone_city, {{-928.39200,1654.52600,9.53383,90,0,0}}, 0},
	{"04_plot02D", kingstone_city, {{-1159.20800,1525.22400,8.33719,90,0,0}}, 0},
	{"04_plot02E", kingstone_city, {{-1251.41300,1658.24200,12.60255,90,0,0}}, 0},
	--{"04_plot02F", kingstone_city, {{-1395.06000,1523.90900,0.02963,90,0,0}}, 0},--?
	{"04_plot02G", kingstone_city, {{-1412.83300,1622.86200,7.05948,90,0,0}}, 0},
	{"04_plot02H", kingstone_city, {{-1334.78100,1654.91600,12.72993,90,0,0}}, 0},
	{"04_plot02I", kingstone_city, {{-1391.32700,1662.34900,11.64056,90,0,0}}, 0},
	{"04_plot03A", ground, {{-1614.82800,1621.15600,-4.21066,90,0,-87.13084}}, 0},
	{"04_plot03C", ground, {{-1623.60000,1647.64100,-3.71399,90,0,-87.13084}}, 0},
	{"04_plot03D", ground, {{-1632.77700,1588.20600,-4.44831,90,0,-87.13084}}, 0},
	{"04_plot04A", ground, {{-1610.86700,1607.49200,-6.92486,90,0,0}}, 0},
	{"04_plot04D", ground, {{-1585.85100,1582.51800,-6.83593,90,0,0}}, 0},
	{"04_plot05A", ground, {{-1568.17000,1537.82700,-7.15344,90,0,0}}, 0},
	{"04_plot05B", ground, {{-1465.75600,1412.23600,-11.91205,90,0,0}}, 0},
	{"04_plot05C", ground, {{-1511.27600,1484.88000,-9.26496,90,0,0}}, 0},
	{"04_blok103", kingstone_city, {{-1465.53900,1371.84100,-11.31216,90,0,90}}, 0},
	{"04_blok100", kingstone_city, {{-1425.82000,1199.87700,-7.77546,90,0,90}}, 0},
	{"04_blok01", kingstone_city, {{-1069.64200,1408.97800,0.81039,90,0,0}}, 0},
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

		local count = 0
		for k,v in pairs(getElementData(resourceRoot, "objectNames")) do
			count = count+1
			kingstone[count][4] = k

			if count == #kingstone then
				break
			end
		end
		
		for k,v in ipairs(kingstone) do
			engineImportTXD ( v[2], v[4] )
			local dff = engineLoadDFF ( ":map_mafia2/kingstone/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[4] )
			local col = engineLoadCOL ( ":map_mafia2/kingstone/"..v[1]..".col" )
			engineReplaceCOL ( col, v[4] )

			for k,j in ipairs(v[3]) do
				local obj = createObject(v[4], j[1],j[2],j[3], j[4],j[5],j[6])
				setElementFrozen(obj, true)
				setObjectBreakable(obj, false)
			end

			engineSetModelLODDistance(v[4], 30000)
		end
	end
end)

local function dxdrawtext(text, x, y, width, height, color, scale, font)
	dxDrawText ( text, x+1, y+1, width, height, tocolor ( 0, 0, 0, 255 ), scale, font )

	dxDrawText ( text, x, y, width, height, color, scale, font )
end

local hud = true
function createText ()
	if hud then
		setTime(15, 0)
		local x,y,z = getElementPosition(localPlayer)
		for k,v in ipairs(kingstone) do
			for k,j in ipairs(v[3]) do
				if getDistanceBetweenPoints3D(x, y, z, j[1],j[2],j[3]) <= 100 then
					local coords = { getScreenFromWorldPosition( j[1],j[2],j[3]+1, 0, false ) }
					if coords[1] and coords[2] then
						dxdrawtext ( v[1], coords[1]-(dxGetTextWidth ( v[1], 1, "default-bold" )/2), coords[2]-15, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
						dxdrawtext ( v[4], coords[1]-(dxGetTextWidth ( v[4], 1, "default-bold" )/2), coords[2]-15*2, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1, "default-bold" )
					end
				end
			end
		end
	end
end
addEventHandler ( "onClientRender", root, createText )