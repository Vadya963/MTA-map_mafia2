local eb_textures = {}
local weather = "summer" --summer,winter,autumn

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	for k,v in ipairs(getElementData(root, "object")) do
		if weather == "summer" and not eb_textures[v[4]] and fileExists(":map_mafia2/textures/"..v[4].."_summer.txd") then
			eb_textures[v[4]] = engineLoadTXD ( ":map_mafia2/textures/"..v[4].."_summer.txd" )
			print(v[4].." load")
		elseif weather == "winter" and not eb_textures[v[4]] and fileExists(":map_mafia2/textures/"..v[4].."_winter.txd") then
			eb_textures[v[4]] = engineLoadTXD ( ":map_mafia2/textures/"..v[4].."_winter.txd" )
			print(v[4].." load")
		elseif weather == "autumn" and not eb_textures[v[4]] then
			--soon
		end

		if not eb_textures[v[4]] and fileExists(":map_mafia2/textures/"..v[4]..".txd") then
			eb_textures[v[4]] = engineLoadTXD ( ":map_mafia2/textures/"..v[4]..".txd" )
			print(v[4].." load")
		end

		if fileExists(":map_mafia2/"..v[4].."/"..v[1]..".dff") and fileExists(":map_mafia2/"..v[4].."/"..v[1]..".col") then
			engineImportTXD (eb_textures[v[4]], v[3])
			local dff = engineLoadDFF ( ":map_mafia2/"..v[4].."/"..v[1]..".dff" )
			if v[7] then
				engineReplaceModel ( dff, v[3], true )
			else
				engineReplaceModel ( dff, v[3], false )
			end
			local col = engineLoadCOL ( ":map_mafia2/"..v[4].."/"..v[1]..".col" )
			engineReplaceCOL ( col, v[3] )
			engineSetModelLODDistance(v[3], 30000)
			engineSetModelPhysicalPropertiesGroup(v[3], 0)
			engineSetModelVisibleTime(v[3], 0, 24)
		end
	end
	setTimer(function()
		triggerServerEvent("event_spawnplayer", localPlayer)
	end, 1000, 1)
end)