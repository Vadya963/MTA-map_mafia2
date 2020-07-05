local vehicles = {
	[409] = "Lassiter Series 75 Hollywood",

	--рабочие
	[428] = "Shubert Armored Van",
	[423] = "Milk Truck",
	[437] = "Parry Bus Prison",
	[455] = "Shubert Truck Flatbed",
	[438] = "Shubert 38 Taxi",
	[420] = "Quicksilver Windsor Taxi",
	[478] = "Shubert Pickup",
	[544] = "American LaFrance 600-Series 1941",
	[416] = "Buick Special Ambulance 1947",
	[525] = "Dodge Towtruck",
	[431] = "GMC Fishbowl City Bus 1976",
	[433] = "GAI 353 Military Truck",

	--2 дверные
	--спорт
	[541] = "Delizia GrandeAmerica",
	[411] = "Potomac Elysium",
	[434] = "Smith 34 Hot Rod",
	[545] = "Waybar Hot Rod",
	[429] = "ISW 508",
	[415] = "Smith Thunderbolt",
	[555] = "Shubert Frigate",

	[496] = "Walter Coupe",
	[401] = "Berkley Kingfisher",
	[534] = "Jefferson Provincial",
	[518] = "Shubert Beverly",
	[589] = "Volkswagen Beetle 1963",

	--4 дверные
	[426] = "Smith Custom 200",
	[596] = "Smith Custom 200 Police Special",
	[597] = "Culver Empire Police Special",
	[445] = "Smith Deluxe Station Wagon",
	[604] = "Shubert 38",
	[507] = "Houston Wasp",
	[466] = "Quicksilver Windsor",--при ударе номера появляется шапка такси
	[585] = "Potomac Indian",--имеет прозрачное название марки
	[551] = "Packard Standard Eight 1948 Touring Sedan",
}

local wheel = {
	{"wheel_gn1", 1082},
	{"wheel_gn2", 1085},
	{"wheel_gn3", 1096},
	{"wheel_gn4", 1097},
	{"wheel_gn5", 1098},
	{"wheel_lr3", 1078},
	{"wheel_lr4", 1076},
	{"wheel_or1", 1025},
	{"wheel_sr1", 1079},
	{"wheel_sr2", 1075},
	{"wheel_sr3", 1074},
	{"wheel_sr4", 1081},
}

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	for k,v in pairs(vehicles) do
		if fileExists(v..".dff") and fileExists(v..".txd") then
			local eb_textures = engineLoadTXD ( v..".txd" )
			engineImportTXD (eb_textures, k)
			local dff = engineLoadDFF ( v..".dff" )
			engineReplaceModel ( dff, k )
		end
	end

	local eb_textures = engineLoadTXD ( "wheel_mafia2/wheels.txd" )
	for k,v in pairs(wheel) do
		if fileExists("wheel_mafia2/"..v[1]..".dff") then
			engineImportTXD (eb_textures, v[2])
			local dff = engineLoadDFF ( "wheel_mafia2/"..v[1]..".dff" )
			engineReplaceModel ( dff, v[2] )
		end
	end
end)