local data = {
	title = 'Gamemode'
}

function data.draw()
	local gm = memory.read_u32(0x8249195c)

	imgui.text(string.format("game mode: %d", gm))
	
	if imgui.button("Unknown: 1") then
		memory.write_u32(0x8249195c, 1)
	end
	if imgui.button("Transition ? : 2") then
		memory.write_u32(0x8249195c, 2)
	end
	if imgui.button("Normal: 3") then
		memory.write_u32(0x8249195c, 3)
	end
	if imgui.button("Paused: 4") then
		memory.write_u32(0x8249195c, 4)
	end
	if imgui.button("Unknown: 5") then
		memory.write_u32(0x8249195c, 5)
	end
	if imgui.button("File Playback: 6") then
		memory.write_u32(0x8249195c, 6)
	end
	if imgui.button("Title Screen Demo: 7") then
		memory.write_u32(0x8249195c, 7)
	end
	if imgui.button("Bottles Bonus Minigame: 8") then
		memory.write_u32(0x8249195c, 8)
	end
	if imgui.button("UNUSED Banjo & Kazooie Credits: 9") then
		memory.write_u32(0x8249195c, 9)
	end
	if imgui.button("SNS Picture : 10") then
		memory.write_u32(0x8249195c, 10)
	end
end

return data
