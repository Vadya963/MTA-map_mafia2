local eb_textures = {}
local pogoda = "summer" --summer,winter,autumn

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )

	for i=550,20000 do
		removeWorldModel(i,10000,0,0,0)
	end

	if pogoda == "summer" then
		eb_textures["kingstone"] = engineLoadTXD ( ":textures/kingstone_summer.txd" )
		eb_textures["dipton"] = engineLoadTXD ( ":textures/dipton_summer.txd" )
		eb_textures["highbrook"] = engineLoadTXD ( ":textures/highbrook_summer.txd" )
		eb_textures["hillwood"] = engineLoadTXD ( ":textures/hillwood_summer.txd" )
		eb_textures["riverside"] = engineLoadTXD ( ":textures/riverside_summer.txd" )
		eb_textures["greenfield"] = engineLoadTXD ( ":textures/greenfield_summer.txd" )
		eb_textures["hunters"] = engineLoadTXD ( ":textures/hunters_summer.txd" )
		eb_textures["sandisland"] = engineLoadTXD ( ":textures/sandisland_summer.txd" )
		eb_textures["port"] = engineLoadTXD ( ":textures/port_summer.txd" )
		eb_textures["southport"] = engineLoadTXD ( ":textures/southport_summer.txd" )
		eb_textures["oysterbay"] = engineLoadTXD ( ":textures/oysterbay_summer.txd" )
		eb_textures["millville_s"] = engineLoadTXD ( ":textures/millville_s_summer.txd" )
		eb_textures["millville_n"] = engineLoadTXD ( ":textures/millville_n_summer.txd" )
		eb_textures["millville_new"] = engineLoadTXD ( ":textures/millville_new_summer.txd" )
		eb_textures["italy"] = engineLoadTXD ( ":textures/italy_summer.txd" )
		eb_textures["uppertown"] = engineLoadTXD ( ":textures/uppertown_summer.txd" )
		eb_textures["chinatown"] = engineLoadTXD ( ":textures/chinatown_summer.txd" )
		eb_textures["westside"] = engineLoadTXD ( ":textures/westside_summer.txd" )
		eb_textures["eastside"] = engineLoadTXD ( ":textures/eastside_summer.txd" )
		eb_textures["midtown"] = engineLoadTXD ( ":textures/midtown_summer.txd" )

	elseif pogoda == "winter" then
		eb_textures["kingstone"] = engineLoadTXD ( ":textures/kingstone_winter.txd" )
		eb_textures["dipton"] = engineLoadTXD ( ":textures/dipton_winter.txd" )
		eb_textures["highbrook"] = engineLoadTXD ( ":textures/highbrook_winter.txd" )
		eb_textures["hillwood"] = engineLoadTXD ( ":textures/hillwood_winter.txd" )
		eb_textures["riverside"] = engineLoadTXD ( ":textures/riverside_winter.txd" )
		eb_textures["greenfield"] = engineLoadTXD ( ":textures/greenfield_winter.txd" )
		eb_textures["hunters"] = engineLoadTXD ( ":textures/hunters_winter.txd" )
		eb_textures["sandisland"] = engineLoadTXD ( ":textures/sandisland_winter.txd" )
		eb_textures["port"] = engineLoadTXD ( ":textures/port_winter.txd" )
		eb_textures["southport"] = engineLoadTXD ( ":textures/southport_winter.txd" )
		eb_textures["oysterbay"] = engineLoadTXD ( ":textures/oysterbay_winter.txd" )
		eb_textures["millville_s"] = engineLoadTXD ( ":textures/millville_s_winter.txd" )
		eb_textures["millville_n"] = engineLoadTXD ( ":textures/millville_n_winter.txd" )
		eb_textures["millville_new"] = engineLoadTXD ( ":textures/millville_new_winter.txd" )
		eb_textures["italy"] = engineLoadTXD ( ":textures/italy_winter.txd" )
		eb_textures["uppertown"] = engineLoadTXD ( ":textures/uppertown_winter.txd" )
		eb_textures["chinatown"] = engineLoadTXD ( ":textures/chinatown_winter.txd" )
		eb_textures["westside"] = engineLoadTXD ( ":textures/westside_winter.txd" )
		eb_textures["eastside"] = engineLoadTXD ( ":textures/eastside_winter.txd" )
		eb_textures["midtown"] = engineLoadTXD ( ":textures/midtown_winter.txd" )
		
	elseif pogoda == "autumn" then
		--soon
	end

	for k,v in ipairs(getElementData(root, "object")) do
		if fileExists(v[4].."/"..v[1]..".dff") and fileExists(v[4].."/"..v[1]..".col") then
			engineImportTXD (eb_textures[v[4]], v[3])
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