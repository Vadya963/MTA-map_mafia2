local table_hash = {
	{"0opzd", "364E59447D30A423"},
	{"0pri02", "B452444059316D69"},
	{"0tch05", "79184B036D152512"},
	{"0tch05til", "887508539E088162"},
	{"0tra01", "1C109355C51F7301"},
	{"0tsil100", "274A3D107D4F793A"},
	{"0tsil101", "7E39BE1B1201C419"},
	{"0tsil102", "A10C3E1D3B5D6643"},
	{"0tsil103", "97199F31E3538767"},
	{"0ul01", "6616DC4FF8202663"},
	{"0ul03", "FF7C2251B4585725"},
	{"0gununi", "5041B42542339E70"},
	{"3sis10", "97027835E92D181E"},
	{"3KJ_Gunshop_Door_Exterior", "B12F6479B21B7D29"},
	{"0sklouni2", "19280A24360E8516"},
	{"0pri01", "183BE93F6C698847"},
	{"0pri03", "73467F404D4D8051"},
	{"0tsil03", "BD642D671254802C"},
	{"8kanal01", "6803BD6D72186F43"},
	{"0tra04", "22183E76E256EB2B"},
	{"0tsil01", "2513D8163F55EC03"},
	{"0vyp2", "F90EC968BB170505"},
	{"kameni", "8E25A975FA79653A"},
	{"kameniv", "E71ABA767F2B4F7C"},
	{"0tsil04", "0A18D167F02F984D"},
	{"0tra05", "2D7C77402C4CFC0C"},
	{"0zpl1", "BD234027CD141628"},
	{"tschody01", "4B3F40539346CC04"},
	{"0zabr", "0F5D8E6BF5674F7B"},
	{"0tch01", "0557CB703E0B7564"},
	{"3sis17", "C65AFF69481CEA39"},
	{"tbrooksvodidla", "302FE32B414C1E4E"},
	{"3hun12", "7B238F78A8352D2A"},
	{"3ral01", "552D9A5B51324F00"},
	{"0tra02", "5E414056A115E473"},
	{"0tsil02", "FC2623658014640F"},
	{"nab2", "B26C4A5B3A6EF258"},
	{"0hut11", "2937AB7B89407D1D"},
	{"ttravahill", "5236093DF244F93E"},
	{"0hut01", "0C4F050D2A39D170"},
	{"ttravahillprech", "BE6F8F3DD652086C"},
	{"0hut07", "6E2F4108F908FD4D"},
	{"0hut03", "9E70980B77193E69"},
	{"RESPRAY_IL_D", "5031B41542339E70"},
	{"RESPRAY_vrata", "5031B41542449E70"},
	{"0skal02", "D850FC5377110F22"},
	{"tskala01", "5E625058C26A7A0F"},
	{"0hut02", "AF79A00AAB31D131"},
	{"2Advertising", "9969A76321096154"},
	{"2Advertising", "9B29F321D91B0F02"},
	{"dal2", "EC530C7ADC3E2505"},
	{"3ost01", "C77A3678F6688358"},
	{"0ul02", "0C49E85254620709"},
	{"0ul04", "2A03CA6CF16C8536"},
	{"0tnad01", "69532325F373807F"},
	{"0tnad02", "221B6525E54B2373"},
	{"0hut04", "9F15800C472BC243"},
	{"plot1", "B173E87E76116A63"},
	{"plet1", "3D0E697E913FEB41"},
	{"0brok5", "496F7B5BAC377248"},
	{"0brok6", "F634C65B9C296E0D"},
	{"0brok3", "CA07055BC47F4C78"},
	{"0tch01", "0676332AA342682A"},
	{"0ztgrad", "496A47058D4BF45E"},
	{"0most2", "83083E0135761468"},
	{"0most3", "377A8301272C8021"},
	{"0most1", "3906B07F892AAF26"},
	{"0mna002", "A86075138E786853"},
	{"pozs", "B7694E3EA9643A4F"},
	{"0spina", "2C2E681B5C170B6C"},
	{"8signs01_2", "213CE80E2242042A"},

	--dipton
	{"0dip01", "8D21C5639F48AB48"},

	--hunters
	{"0brok4", "8D513D5BB93D971A"},
	{"0brok1", "4931D8576F129918"},
	{"0brok2", "D9463D585A74D70B"},
	{"0brok7", "F314F115637DFC0A"},
	{"thunm04", "DF3F9C394E3B0103"},
	{"thunm01", "E6099E03B541841B"},
	{"thunm02", "C764AC203572FE58"},
	{"3hun02", "887CA4478D489028"},
	{"3hun08", "873B94200E1B8050"},
	{"3hun03", "B21D384A03748338"},
	{"3hun01", "561A1D13973F9E26"},
	{"3hun10", "D2655534D822ED31"},
	{"thunm03", "66436464130BFC20"},
	{"3hun09", "973BDD6AF073CD75"},
	{"0brok8", "7A21FE2414609F02"},
	{"3hun11", "6651B734C426625F"},
	{"thunrad1", "92288C025E45DC25"},
	{"thunt02", "A777A75B72232E78"},
	{"3hun05", "FB7ADF4AE02D641F"},
	{"3hun04", "E55B40502B2E5E25"},
	{"thunts01", "031BA01CB16AB71F"},
	{"0hunBYT", "592DC21F601FB447"},
	{"3hun06", "4B047F4BBE2BB47A"},
	{"3hun07", "5754DC33F20CFF1B"},
	{"3KJexterior", "7450A129A8684403"},
}

local hunters = {
{"02_instancia_13_dom_08"}
}

for k,v in pairs(hunters) do
	local pyt = "C:\\"..v[1].."(0).obj.mtl"
	local file = io.open(pyt, "r")
	local text = {}

	for line in io.lines(pyt) do
		table.insert(text, line)
	end

	for k,line in ipairs(text) do
		for i,p in pairs(table_hash) do
			if line == "map_kd "..p[2]..".dds" then
				text[k] = "map_kd "..p[1]..".dds"
			end
		end
	end

	file:close()

	local file = io.open(pyt, "w")
	for i,v in ipairs(text) do
		file:write(v.."\n")
	end

	file:close()
end

for k,v in pairs(hunters) do
	local pyt = "C:\\"..v[1].."(0).obj"
	local file = io.open(pyt, "r")
	local text = {}

	for line in io.lines(pyt) do
		table.insert(text, line)
	end

	for k,line in ipairs(text) do
		if line == "g mesh" then
			text[k] = "g "..v[1]
		end
	end

	file:close()

	local file = io.open(pyt, "w")
	for i,v in ipairs(text) do
		file:write(v.."\n")
	end

	file:close()
end
