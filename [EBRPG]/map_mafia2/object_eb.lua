local eb_textures = false
local pogoda = "summer" --summer,winter,autumn

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )

	for i=550,20000 do
		removeWorldModel(i,10000,0,0,0)
	end

	if pogoda == "summer" then
		eb_textures = engineLoadTXD ( ":textures/eb_textures_summer.txd" )
	elseif pogoda == "winter" then
		eb_textures = engineLoadTXD ( ":textures/eb_textures_winter.txd" )
	elseif pogoda == "autumn" then
		--soon
	end

	for k,v in ipairs(getElementData(root, "object")) do
		if fileExists(v[4].."/"..v[1]..".dff") and fileExists(v[4].."/"..v[1]..".col") then
			engineImportTXD (eb_textures, v[3])
			local dff = engineLoadDFF ( ":map_mafia2/"..v[4].."/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[3] )
			local col = engineLoadCOL ( ":map_mafia2/"..v[4].."/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )
			engineSetModelLODDistance(v[3], 30000)
		end
	end
end)

--{''; {{ ;0 ;0 ;0};}; 0};
--{"05_88_01", {{-575.04130,1664.06500,-18.71200,90,0,0}}, 0}, dipton

--greenfield
--{"03_teren203", {{-1877.168 ,1046.32 ,12.10801 ,0 ,0 ,0}}, 0},--большая кол-ия
--{"03_teren201", {{-1877.168 ,1046.32 ,12.10801 ,0 ,0 ,0}}, 0},
--{"03_30", {{-1803.381 ,1051.32 ,8.489138 ,0 ,0 ,-90}}, 0},
--{"03_29", {{-2000.435 ,1110.572 ,22.66821 ,0 ,0 ,70}}, 0},--большая кол-ия и далеко от игрока