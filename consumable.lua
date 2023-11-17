-- Edit your consumables

local data = {
	title = 'Consumable',
	eggs = 0,
	red_feathers = 0,
	gold_feathers = 0,
}

local BASE_ADDR = 0x8249cb30
local EGGS = 0x0D * 4
local RED_FEATHERS = 0x0F * 4
local GOLD_FEATHERS = 0x10 * 4

function data.draw()
	data.eggs = imgui.int("eggs:", data.eggs)
	data.red_feathers = imgui.int("red feathers:", data.red_feathers)
	data.gold_feathers = imgui.int("gold feathers:", data.gold_feathers)

	if imgui.button("read") then
		data.eggs = memory.read_u32(BASE_ADDR + EGGS)
		data.red_feathers = memory.read_u32(BASE_ADDR + RED_FEATHERS)
		data.gold_feathers = memory.read_u32(BASE_ADDR + GOLD_FEATHERS)
	end

	imgui.sameline()
	if imgui.button("write") then
		memory.write_u32(BASE_ADDR + EGGS, data.eggs)
		memory.write_u32(BASE_ADDR + RED_FEATHERS, data.red_feathers)
		memory.write_u32(BASE_ADDR + GOLD_FEATHERS, data.gold_feathers)
	end
end

return data
