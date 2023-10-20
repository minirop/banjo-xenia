-- Allow you to transform into anything

local data = {
	title = 'Transformation',
	selected_transformation = 0,
}

local transformation = {
	"Banjo-Kazooie",
	"Termite",
	"Pumpkin",
	"Walrus",
	"Croc",
	"Bee",
	"Washing Machine"
}

function data.draw()
	data.selected_transformation = imgui.combo("transformation", transformation, data.selected_transformation)
	imgui.sameline()
	if imgui.button("Eekum bokum!") then
		memory.write_u8(0x8248f42c, data.selected_transformation+1)
		memory.write_u8(0x8249196c, 1)
	end
end

return data
