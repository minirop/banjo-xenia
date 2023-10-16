-- Display the current game mode and allow you to force a pause.

local data = {
	title = 'Gamemode'
}

function data.draw()
	local gm = memory.read_u32(0x8249195c)

	imgui.text(string.format("game mode: %d", gm))
	
	if imgui.button("pause") then
		memory.write_u32(0x8249195c, 4)
	end
	imgui.sameline()
	if imgui.button("unpause") then
		memory.write_u32(0x8249195c, 3)
	end
end

return data
