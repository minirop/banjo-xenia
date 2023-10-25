-- Allow you to learn/unlearn Banjo's abilities.

local data = {
	title = 'Banjo\'s abilities'
}

function ability(name, value)
	local abilities = memory.read_u32(0x8248e6b8);

	local mask = 1 << value
	if (abilities & mask) ~= 0 then
		if imgui.button(name .. ": on") then
			memory.write_u32(0x8248e6b8, abilities & ~mask);
		end
	else
		if imgui.button(name .. ": off") then
			memory.write_u32(0x8248e6b8, abilities  | mask);
		end
	end
end

function data.draw()
	ability("beak barge", 0)
	ability("beak bomb", 1)
	ability("beak buster", 2)
	ability("camera control", 3)
	ability("bear punch", 4)
	ability("climb", 5)
	ability("eggs", 6)
	ability("flap", 7)
	ability("flip", 8)
	ability("fly", 9)
	ability("hold A", 10)
	ability("ratatat rap", 11)
	ability("roll", 12)
	ability("shock jump", 13)
	ability("wading boot", 14)
	ability("dive", 15)
	ability("talon trot", 16)
	ability("turbo talon", 17)
	ability("wonderwing", 18)
	ability("1st notedoor", 19)
end

return data
