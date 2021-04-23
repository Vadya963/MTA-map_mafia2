local eb_textures = {}
local weather = "summer" --summer,winter

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	eb_textures["ground"] = engineLoadTXD ( ":map_mafia2/textures/ground_"..weather..".txd" )

	for k,v in ipairs(getElementData(root, "object_replace")) do
		if not eb_textures[v[3]] and fileExists(":map_mafia2/textures/"..v[3].."_"..weather..".txd") then
			eb_textures[v[3]] = engineLoadTXD ( ":map_mafia2/textures/"..v[3].."_"..weather..".txd" )
			print(v[3].." load")
		end

		if not eb_textures[v[3]] and fileExists(":map_mafia2/textures/"..v[3]..".txd") then
			eb_textures[v[3]] = engineLoadTXD ( ":map_mafia2/textures/"..v[3]..".txd" )
			print(v[3].." load")
		end

		if fileExists(":map_mafia2/"..v[3].."/"..v[1]..".dff") and fileExists(":map_mafia2/"..v[3].."/"..v[1]..".col") then
			if fileExists(":map_mafia2/textures/"..v[3].."_"..weather..".txd") then
				engineImportTXD (eb_textures["ground"], v[2])
			end
			
			engineImportTXD (eb_textures[v[3]], v[2])

			local dff = engineLoadDFF ( ":map_mafia2/"..v[3].."/"..v[1]..".dff" )
			if v[4] and v[4]["AlphaTransparency"] then
				engineReplaceModel ( dff, v[2], true )
			else
				engineReplaceModel ( dff, v[2], false )
			end

			local col = engineLoadCOL ( ":map_mafia2/"..v[3].."/"..v[1]..".col" )
			engineReplaceCOL ( col, v[2] )

			engineSetModelLODDistance(v[2], 30000)

			if v[4] and v[4]["ModelPhysicalPropertiesGroup"] then
				engineSetModelPhysicalPropertiesGroup(v[2], v[4]["ModelPhysicalPropertiesGroup"])
			else
				engineSetModelPhysicalPropertiesGroup(v[2], 0)
			end
		end
	end
end)