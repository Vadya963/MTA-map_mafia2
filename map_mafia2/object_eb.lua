local ground = engineLoadTXD ( ":map_mafia2/ground.txd" )
local kingstone_city = engineLoadTXD ( ":map_mafia2/kingstone.txd" )

local kingstone = {
	--объекты
	{"teren0", 615, ground},
	{"teren1", 616, ground},
	{"teren2", 617, ground},
	{"teren3", 618, ground},
	{"teren4", 619, ground},
	{"teren5", 620, ground},
	{"teren6", 621, ground},
	{"teren7", 622, ground},
	{"teren8", 623, ground},
	{"teren9", 624, ground},
	{"teren10", 625, ground},
	{"teren11", 626, ground},
	{"teren12", 627, ground},
	{"teren13", 628, ground},
	{"tunel7", 629, ground},
	{"tunel4", 630, ground},
	{"tunel5", 631, ground},
	{"tunel3", 632, ground},
	{"tunel0", 633, ground},
	{"tunel1", 634, ground},
	{"rantl6", 635, ground},
	{"rantl8", 636, ground},
	{"rantl9", 637, ground},
	{"rantl13", 638, ground},
	{"rantl14", 639, ground},
	{"rantl15", 640, ground},
	{"rantl16", 641, ground},
	{"rantl21", 642, kingstone_city},
	{"04_tunel_portal", 643, kingstone_city},
	{"04_moloA", 644, ground},
	{"04_moloB", 645, ground},
	{"04_moloC", 646, ground},
	{"04_moloD", 647, ground},
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
		
		for k,v in pairs(kingstone) do
			engineImportTXD ( v[3], v[2] )
			local dff = engineLoadDFF ( ":map_mafia2/kingstone/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[2] )
			local col = engineLoadCOL ( ":map_mafia2/kingstone/"..v[1]..".col" )
			engineReplaceCOL ( col, v[2] )
			engineSetModelLODDistance(v[2], 30000)
		end
	end
end)