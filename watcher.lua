-- Allow you to track a specific memory address (only 4 bytes, no more no less)

local data = {
	title = 'Watcher',
	addresses = {},
	field = ''
}

function data.draw()
	data.field = imgui.hex("addr:", data.field)
	if imgui.button("Add") then
		table.insert(data.addresses, tonumber(data.field, 16))
	end
	for _, addr in ipairs(data.addresses) do
		local h = memory.read_u32(addr)
		local v = memory.read_f32(addr)
		imgui.text(string.format("0x%x: 0x%x %f", addr, h, v))
	end
end

return data
