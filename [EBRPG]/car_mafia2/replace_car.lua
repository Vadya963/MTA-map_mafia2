local vehicles = {
	[401] = "Smith Custom 200",
	[409] = "Lassiter Series 75 Hollywood",
	[411] = "Delizia GrandeAmerica",
	[412] = "Walter Coupe",
	[445] = "Smith Deluxe Station Wagon",
	[598] = "Shubert 38",
	[423] = "Milk Truck",
	[428] = "Shubert Armored Van",
	[429] = "ISW 508",
	[434] = "Smith 34 Hot Rod",
	[437] = "Parry Bus Prison",
	[438] = "Shubert 38 Taxi",
	[415] = "Potomac Elysium",
	[455] = "Shubert Truck Flatbed",
	[467] = "Houston Wasp",
	[475] = "Smith Thunderbolt",
	[478] = "Shubert Pickup",
	[492] = "Quicksilver Windsor",
	[500] = "Potomac Indian",
	[517] = "Berkley Kingfisher",
	[534] = "Jefferson Provincial",
	[542] = "Waybar Hot Rod",
	[551] = "Shubert Beverly",
	[555] = "Shubert Frigate",
	[596] = "Smith Custom 200 Police Special",
	[597] = "Culver Empire Police Special",
	[420] = "Quicksilver Windsor Taxi",
}

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	for k,v in pairs(vehicles) do
		if fileExists(v..".dff") and fileExists(v..".txd") then
			local eb_textures = engineLoadTXD ( v..".txd" )
			engineImportTXD (eb_textures, k)
			local dff = engineLoadDFF ( v..".dff" )
			engineReplaceModel ( dff, k )
			--print("<file src='"..v..".dff'/>")
			--print("<file src='"..v..".txd'/>")
			--print(k,v)
		end
	end
end)