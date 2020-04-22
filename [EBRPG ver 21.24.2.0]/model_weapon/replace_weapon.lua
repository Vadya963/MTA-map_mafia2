addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	for k,v in pairs(getElementData(root, "custom_weapon")) do
		local txd = engineLoadTXD ( v[1]..".txd" )
		local dff = engineLoadDFF ( v[1]..".dff" )
		engineImportTXD (txd, v[2])
		engineReplaceModel ( dff, v[2] )
	end
end)