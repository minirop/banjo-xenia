-- List all loaded actors and allow you to "grab" one like to simulate a despawn glitch
local data = {
	title = 'Loaded actors'
}

function data.draw()
	local list = memory.read_u32(0x8249f68c)

	if list ~= 0 then
		local count = memory.read_u32(list)
		local inhand = memory.read_u32(0x8248f614)
		imgui.text(string.format("actors: %d", count))
		imgui.text(string.format("inhand: %x", inhand))

		local actor = list + 8
		for i = 1, count do
			if actor ~= 0 then
				local actorinfo = memory.read_u32(actor + 0x130)
				if actorinfo ~= 0 then
					local actor_id = memory.read_u16(actorinfo)

					imgui.text(string.format("actor %d: %x", i, actor_id))

					if inhand ~= actor then
						imgui.sameline()
						if imgui.button(string.format("hold##%d", actor)) then
							memory.write_u32(0x8248f614, actor)
						end
					end
				end
			end

			actor = actor + 0x184
		end
	end
end

return data
