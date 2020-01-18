addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	for k,v in ipairs(getElementData(root, "object")) do
		setObjectBreakable ( v[2], false )
	end
end)