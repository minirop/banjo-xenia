-- Get POG (pause overlay glitch) without having to go to TTC

local data = {
	title = 'POG'
}

function data.draw()
	if imgui.button("INSTANT POG!!!") then
		memory.write_u8(0x82462c64, 2)
	end
end

return data
