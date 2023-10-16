-- Get the position of Banjo in real time

local data = {
	title = 'Banjo\'s position (live)'
}

function data.draw()
	local cur_addr = "0x8248e890"
	local cur_addr_int = tonumber(cur_addr)

	local x = memory.read_f32(cur_addr_int - 8)
	local y = memory.read_f32(cur_addr_int - 4)
	local z = memory.read_f32(cur_addr_int)

	imgui.text(string.format("%s: %f %f %f", cur_addr, x, y, z))
end

return data
