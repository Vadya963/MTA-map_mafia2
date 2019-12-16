local eb_textures = false
local object_data = false
local pogoda = true --зима(false) или лето(true)

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	object_data = getElementData(root, "object")

	for i=550,20000 do
		removeWorldModel(i,10000,0,0,0)
	end
	setOcclusionsEnabled(false)
	engineSetSurfaceProperties ( 0, "audio", "concrete" )
	engineSetSurfaceProperties ( 0, "canclimb", true )

	for i,v in ipairs(object_data) do
		setObjectBreakable(v[2], false)
		setElementFrozen(v[2], true)
		setElementDoubleSided(v[2], true)
		local obj = getLowLODElement(v[2])
		setElementDoubleSided(obj, true)
	end

	if pogoda then
		eb_textures = engineLoadTXD ( ":textures/eb_textures_leto.txd" )
	else
		eb_textures = engineLoadTXD ( ":textures/eb_textures_zima.txd" )
	end

	for k,v in ipairs(object_data) do
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