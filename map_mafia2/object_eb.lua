local ground = engineLoadTXD ( ":map_mafia2/ground.txd" )

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
}

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
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
end)