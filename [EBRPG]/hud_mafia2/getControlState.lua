local states={
	["radar_zoom_in"]=false,
	["radar_zoom_out"]=false,
	["radar_move_north"]=false,
	["radar_move_south"]=false,
	["radar_move_east"]=false,
	["radar_move_west"]=false,
}
local mta_getControlState=getPedControlState

function getPedControlState(control)
	local state=states[control]
	if state==nil then
		return mta_getControlState(control)
	else
		return state
	end
end

local function handleStateChange(key,state,control)
	states[control]=(state=="down")
end

for control,state in pairs(states) do
	for key,states in pairs(getBoundKeys(control)) do
		bindKey(key,"both",handleStateChange,control)
	end
end