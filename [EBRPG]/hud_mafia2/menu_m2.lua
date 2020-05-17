local screenWidth, screenHeight = guiGetScreenSize ( )

local menu_m2_table_text = {
	--button text
	["т/с"] = {"фары", "двигатель", "багажник", "двери"},
	["двигатель"] = {"назад к т/с", "завести", "", "заглушить"},
	["двери"] = {"назад к т/с", "открыть", "", "закрыть"},
	["фары"] = {"назад к т/с", "включить", "", "выключить"},
	["багажник"] = {"назад к т/с", "открыть багажник", "", "закрыть багажник"},
	["назад к т/с"] = {"фары", "двигатель", "багажник", "двери"},

	["анимации"] = {"2 страница", "сесть 1", "поднять руки", "сесть 2"},
	["поднять руки"] = {"назад к анимации", "запуск поднять руки", "", "остановить анимацию"},
	["сесть 1"] = {"назад к анимации", "запуск сесть 1", "", "остановить анимацию"},
	["сесть 2"] = {"назад к анимации", "запуск сесть 2", "", "остановить анимацию"},

	["2 страница"] = {"3 страница", "ждать", "курить", "боль"},
	["ждать"] = {"назад к анимации", "запуск ждать", "", "остановить анимацию"},
	["курить"] = {"назад к анимации", "запуск курить", "", "остановить анимацию"},
	["боль"] = {"назад к анимации", "запуск боль", "", "остановить анимацию"},

	["3 страница"] = {"4 страница", "махать рукой", "йога", "заложник"},
	["махать рукой"] = {"назад к анимации", "запуск махать рукой", "", "остановить анимацию"},
	["йога"] = {"назад к анимации", "запуск йога", "", "остановить анимацию"},
	["заложник"] = {"назад к анимации", "запуск заложник", "", "остановить анимацию"},

	["4 страница"] = {"5 страница", "праздновать", "смеяться", "показать фак"},
	["праздновать"] = {"назад к анимации", "запуск праздновать", "", "остановить анимацию"},
	["смеяться"] = {"назад к анимации", "запуск смеяться", "", "остановить анимацию"},
	["показать фак"] = {"назад к анимации", "запуск показать фак", "", "остановить анимацию"},

	["5 страница"] = {"назад к анимации", "playBoy", "пьяный", "толстый"},
	["playBoy"] = {"назад к анимации", "запуск playBoy", "", "остановить анимацию"},
	["пьяный"] = {"назад к анимации", "запуск пьяный", "", "остановить анимацию"},
	["толстый"] = {"назад к анимации", "запуск толстый", "", "остановить анимацию"},

	["назад к анимации"] = {"2 страница", "сесть 1", "поднять руки", "сесть 2"},

	--triggerServerEvent
	--тс
	["завести"] = {"event", "event_server_car_engine", "true"},
	["заглушить"] = {"event", "event_server_car_engine", "false"},

	["открыть"] = {"event", "event_server_car_door", "false"},
	["закрыть"] = {"event", "event_server_car_door", "true"},

	["включить"] = {"event", "event_server_car_light", "true"},
	["выключить"] = {"event", "event_server_car_light", "false"},

	["открыть капот"] = {"event", "event_server_car_trunk_and_hood", "true,hood"},
	["закрыть капот"] = {"event", "event_server_car_trunk_and_hood", "false,hood"},
	["открыть багажник"] = {"event", "event_server_car_trunk_and_hood", "true,trunk"},
	["закрыть багажник"] = {"event", "event_server_car_trunk_and_hood", "false,trunk"},

	--анимации														anim 1, anim 2, loop anim true/false
	["запуск поднять руки"] = {"event", "event_server_anim_player", "rob_bank,shp_handsup_scr,false"},
	["запуск сесть 1"] = {"event", "event_server_anim_player", "attractors,stepsit_loop,false"},
	["запуск сесть 2"] = {"event", "event_server_anim_player", "ped,seat_idle,false"},
	["запуск ждать"] = {"event", "event_server_anim_player", "playidles,time,true"},
	["запуск курить"] = {"event", "event_server_anim_player", "smoking,m_smk_drag,true"},
	["запуск боль"] = {"event", "event_server_anim_player", "CRACK,crckdeth2,true"},
	["запуск махать рукой"] = {"event", "event_server_anim_player", "on_lookers,wave_loop,true"},
	["запуск йога"] = {"event", "event_server_anim_player", "park,tai_chi_loop,true"},
	["запуск заложник"] = {"event", "event_server_anim_player", "ped,duck_cower,true"},
	["запуск праздновать"] = {"event", "event_server_anim_player", "CASINO,manwinb,one"},
	["запуск смеяться"] = {"event", "event_server_anim_player", "RAPPING,Laugh_01,one"},
	["запуск показать фак"] = {"event", "event_server_anim_player", "RIOT,RIOT_FUKU,one"},
	["запуск playBoy"] = {"event", "event_server_anim_player", "ped,WALK_civi,walk"},
	["запуск пьяный"] = {"event", "event_server_anim_player", "ped,WALK_drunk,walk"},
	["запуск толстый"] = {"event", "event_server_anim_player", "ped,WALK_fat,walk"},
	["остановить анимацию"] = {"event", "event_server_anim_player", "nil,nil,false"},
}

addEventHandler( "onClientResourceStart", resourceRoot,
function()
	bindKey ( "F3", "down", menu_mafia_2 )
end)

--menu from mafia 2
local menu_m2 = guiCreateStaticImage( screenWidth/2-58/2, screenHeight-100, 58, 58, "hud/window-m2.png", false )
local sx,sy = guiGetSize(menu_m2, false)
local px,py = guiGetPosition(menu_m2, false)
local arrow_m2 = {
	[1] = {guiCreateStaticImage( (sx/2)-(13/2), sy-16, 13, 8, "hud/window-arrow-off-down.png", false, menu_m2 ), guiCreateLabel( px+(sx/2)-(25/2), py+sy+3, 25, 15, "test", false ), "down", guiCreateLabel( px+(sx/2)-(25/2)+1, py+sy+3+1, 25, 15, "test", false )},
	[2] = {guiCreateStaticImage( 8, (sy/2)-(13/2), 8, 13, "hud/window-arrow-off-left.png", false, menu_m2 ), guiCreateLabel( px-25-5, py+(sy/2)-(15/2), 25, 15, "test", false ), "left", guiCreateLabel( px-25-5+1, py+(sy/2)-(15/2)+1, 25, 15, "test", false )},
	[3] = {guiCreateStaticImage( (sx/2)-(13/2), 8, 13, 8, "hud/window-arrow-off-up.png", false, menu_m2 ), guiCreateLabel( px+(sx/2)-(25/2), py-15-5, 25, 15, "test", false ), "up", guiCreateLabel( px+(sx/2)-(25/2)+1, py-15-5+1, 25, 15, "test", false )},
	[4] = {guiCreateStaticImage( sx-16, (sy/2)-(13/2), 8, 13, "hud/window-arrow-off-right.png", false, menu_m2 ), guiCreateLabel( px+sx+5, py+(sy/2)-(15/2), 25, 15, "test", false ), "right", guiCreateLabel( px+sx+5+1, py+(sy/2)-(15/2)+1, 25, 15, "test", false )},
}
guiSetVisible ( menu_m2, false )
for i=1,4 do
	guiSetVisible ( arrow_m2[i][2], false )
	guiLabelSetColor ( arrow_m2[i][4], 0, 0, 0 )
	guiSetEnabled ( arrow_m2[i][4], false )
	guiMoveToBack( arrow_m2[i][4] )
	guiSetVisible ( arrow_m2[i][4], false )
	guiSetFont(arrow_m2[i][2], "default-bold-small")
	guiSetFont(arrow_m2[i][4], "default-bold-small")
end

for i=1,4 do
	function select_button_menu ( absoluteX, absoluteY, hud )--наведение на меню
		guiLabelSetColor ( arrow_m2[i][2], 255, 210, 75 )
		guiStaticImageLoadImage(arrow_m2[i][1], "hud/window-arrow-on-"..arrow_m2[i][3]..".png")
	end
	addEventHandler( "onClientMouseEnter", arrow_m2[i][2], select_button_menu, false )
end
for i=1,4 do
	function select_button_menu2 ( absoluteX, absoluteY, hud )--покидание меню
		guiLabelSetColor ( arrow_m2[i][2], 255, 255, 255 )
		guiStaticImageLoadImage(arrow_m2[i][1], "hud/window-arrow-off-"..arrow_m2[i][3]..".png")
	end
	addEventHandler( "onClientMouseLeave", arrow_m2[i][2], select_button_menu2, false )
end

function menu_mafia_2( key, keyState )
	if keyState == "down" then
		if not guiGetVisible(menu_m2) then
			local menu_m2_table = {
				[1] = "",
				[2] = "т/с",
				[3] = "",
				[4] = "анимации",
			}

			for k,v in pairs(menu_m2_table) do
				guiSetText(arrow_m2[k][2], v)
				guiSetText(arrow_m2[k][4], v)
				local dimensions = guiLabelGetTextExtent(arrow_m2[k][2])

				local px1,py1 = guiGetPosition(arrow_m2[k][2], false)
				local px2,py2 = guiGetPosition(arrow_m2[k][4], false)
				guiSetSize(arrow_m2[k][2], dimensions, 15, false)
				guiSetSize(arrow_m2[k][4], dimensions, 15, false)
				if k == 1 then
					guiSetPosition(arrow_m2[k][2], px+(sx/2)-(dimensions/2), py1, false)
					guiSetPosition(arrow_m2[k][4], px+(sx/2)-(dimensions/2)+1, py2, false)
				elseif k == 2 then
					guiSetPosition(arrow_m2[k][2], px-dimensions-5, py1, false)
					guiSetPosition(arrow_m2[k][4], px-dimensions-5+1, py2, false)
				elseif k == 3 then
					guiSetPosition(arrow_m2[k][2], px+(sx/2)-(dimensions/2), py1, false)
					guiSetPosition(arrow_m2[k][4], px+(sx/2)-(dimensions/2)+1, py2, false)
				elseif k == 4 then
					guiSetPosition(arrow_m2[k][2], px+sx+5, py1, false)
					guiSetPosition(arrow_m2[k][4], px+sx+5+1, py2, false)
				end
			end

			guiSetVisible ( menu_m2, true )
			for i=1,4 do
				guiSetVisible ( arrow_m2[i][2], true )
				guiSetVisible ( arrow_m2[i][4], true )
			end
			showCursor( true )
		else
			guiSetVisible ( menu_m2, false )
			for i=1,4 do
				guiSetVisible ( arrow_m2[i][2], false )
				guiSetVisible ( arrow_m2[i][4], false )
			end
			showCursor( false )
		end
	end
end

function outputEditBox ( button, state, absoluteX, absoluteY )
	local hud = source

	for k,v in pairs(arrow_m2) do
		if hud == v[2] then
			local text = guiGetText(hud)

			for k1,v1 in pairs(menu_m2_table_text) do
				if text == k1 then
					if v1[1] ~= "event" then
						for k2,v2 in pairs(menu_m2_table_text[k1]) do
							guiSetText(arrow_m2[k2][2], v2)
							guiSetText(arrow_m2[k2][4], v2)
							local dimensions = guiLabelGetTextExtent(arrow_m2[k2][2])

							local px1,py1 = guiGetPosition(arrow_m2[k2][2], false)
							local px2,py2 = guiGetPosition(arrow_m2[k2][4], false)
							guiSetSize(arrow_m2[k2][2], dimensions, 15, false)
							guiSetSize(arrow_m2[k2][4], dimensions, 15, false)
							if k2 == 1 then
								guiSetPosition(arrow_m2[k2][2], px+(sx/2)-(dimensions/2), py1, false)
								guiSetPosition(arrow_m2[k2][4], px+(sx/2)-(dimensions/2)+1, py2, false)
							elseif k2 == 2 then
								guiSetPosition(arrow_m2[k2][2], px-dimensions-5, py1, false)
								guiSetPosition(arrow_m2[k2][4], px-dimensions-5+1, py2, false)
							elseif k2 == 3 then
								guiSetPosition(arrow_m2[k2][2], px+(sx/2)-(dimensions/2), py1, false)
								guiSetPosition(arrow_m2[k2][4], px+(sx/2)-(dimensions/2)+1, py2, false)
							elseif k == 4 then
								guiSetPosition(arrow_m2[k2][2], px+sx+5, py1, false)
								guiSetPosition(arrow_m2[k2][4], px+sx+5+1, py2, false)
							end
						end
					else
						triggerServerEvent ( v1[2], getRootElement(), localPlayer, v1[3] )
					end
				end
			end
		end
	end
end
addEventHandler( "onClientGUIClick", resourceRoot, outputEditBox )
