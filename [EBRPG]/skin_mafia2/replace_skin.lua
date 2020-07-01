local skin = {
	{"briancd",0},
	{"citga3cd",0},
	{"cvez2d",0},
	{"cvez6d",0},
	{"cvezci3d",0},
	{"cvezga2d",0},
	{"cvezjimd",0},
	{"cvezjond",0},
	{"cvezvind",0},
	{"desmondd",0},
	{"driverd",0},
	{"joeneupd",0},
	{"tomangd",0},
}

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	for k,v in pairs(skin) do
		if fileExists(v[1]..".dff") and fileExists(v[1]..".txd") then
			local skin_load = engineRequestModel( "ped" )
			local eb_textures = engineLoadTXD ( v[1]..".txd" )
			engineImportTXD (eb_textures, skin_load)
			local dff = engineLoadDFF ( v[1]..".dff" )
			engineReplaceModel ( dff, skin_load )
			skin[k][2] = skin_load
			--print("<file src='"..v..".dff'/>")
			--print("<file src='"..v..".txd'/>")
			--print(skin_load)
		end
	end
end)

addCommandHandler( "setskin",
function (cmd,int)
	setElementModel( localPlayer, tonumber(int) )
end)