-- Allow you to get (not live) and set Banjo's position.

local data = {
	title = 'Set Banjo\'s position',
	px = "0",
	py = "0",
	pz = "0"
}

function data.draw()
	data.px = imgui.float("x:", data.px)
	data.py = imgui.float("y:", data.py)
	data.pz = imgui.float("z:", data.pz)

	if imgui.button("read") then
		local xx = memory.read_f32(0x8248e890 - 8)
		data.px = string.format("%f", xx)
		local yy = memory.read_f32(0x8248e890 - 4)
		data.py = string.format("%f", yy)
		local zz = memory.read_f32(0x8248e890 - 0)
		data.pz = string.format("%f", zz)
	end
	imgui.sameline()
	if imgui.button("write") then
		memory.write_f32(0x8248e890 - 8, data.px)
		memory.write_f32(0x8248e890 - 4, data.py)
		memory.write_f32(0x8248e890 - 0, data.pz)
	end
end

return data
