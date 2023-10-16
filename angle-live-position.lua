-- Get the angle of Banjo live

local data = {
	title = 'Banjo\'s Angle Position (live)'
}

function data.draw()
	local cur_addr = "0x8248E93C"
	local cur_addr_int = tonumber(cur_addr)

	local angle = memory.read_f32(cur_addr_int)

	imgui.text(string.format("%s: %f", cur_addr, angle))
end

return data
