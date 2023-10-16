-- Allow you to teleport to any map/room/etc.

local data = {
	title = 'Teleporter',
	selected_map = 0,
}

local maps = {
	"SM - Spiral Mountain",
	"MM - Mumbo's Mountain",
	"!Unknown 0x03",
	"!Unknown 0x04",
	"TTC - Blubber's Ship",
	"TTC - Nipper's Shell",
	"TTC - Treasure Trove Cove",
	"!Unknown 0x08",
	"!Unknown 0x09",
	"TTC - Sandcastle",
	"CC - Clanker's Cavern",
	"MM - Ticker's Tower",
	"BGS - Bubblegloop Swamp",
	"Mumbo's Skull (MM)",
	"!Unknown 0x0F",
	"BGS - Mr. Vile",
	"BGS - Tiptup",
	"GV - Gobi's Valley",
	"GV - Matching Game",
	"GV - Maze",
	"GV - Water",
	"GV - Rubee's Chamber",
	"!Unknown 0x17",
	"!Unknown 0x18",
	"!Unknown 0x19",
	"GV - Sphinx",
	"MMM - Mad Monster Mansion",
	"MMM - Church",
	"MMM - Cellar",
	"Start - Nintendo",
	"Start - Rareware",
	"End Scene 2: Not 100",
	"CC - Witch Switch Room",
	"CC - Inside Clanker",
	"CC - Gold Feather Room",
	"MMM - Tumblar's Shed",
	"MMM - Well",
	"MMM - Dining Room (Napper)",
	"FP - Freezeezy Peak",
	"MMM - Room 1",
	"MMM - Room 2",
	"MMM - Room 3: Fireplace",
	"MMM - Church (Secret Room)",
	"MMM - Room 4: Bathroom",
	"MMM - Room 5: Bedroom",
	"MMM - Room 6: Floorboards",
	"MMM - Barrel",
	"Mumbo's Skull (MMM)",
	"RBB - Rusty Bucket Bay",
	"!Unknown 0x32",
	"!Unknown 0x33",
	"RBB - Engine Room",
	"RBB - Warehouse 1",
	"RBB - Warehouse 2",
	"RBB - Container 1",
	"RBB - Container 3",
	"RBB - Crew Cabin",
	"RBB - Boss Boom Box",
	"RBB - Store Room",
	"RBB - Kitchen",
	"RBB - Navigation Room",
	"RBB - Container 2",
	"RBB - Captain's Cabin",
	"CCW - Start",
	"FP - Boggy's Igloo",
	"!Unknown 0x42",
	"CCW - Spring",
	"CCW - Summer",
	"CCW - Autumn",
	"CCW - Winter",
	"Mumbo's Skull (BGS)",
	"Mumbo's Skull (FP)",
	"!Unknown 0x49",
	"Mumbo's Skull (CCW Spring)",
	"Mumbo's Skull (CCW Summer)",
	"Mumbo's Skull (CCW Autumn)",
	"Mumbo's Skull (CCW Winter)",
	"!Unknown 0x4E",
	"!Unknown 0x4F",
	"!Unknown 0x50",
	"!Unknown 0x51",
	"!Unknown 0x52",
	"FP - Inside Xmas Tree",
	"!Unknown 0x54",
	"!Unknown 0x55",
	"!Unknown 0x56",
	"!Unknown 0x57",
	"!Unknown 0x58",
	"!Unknown 0x59",
	"CCW - Zubba's Hive (Summer)",
	"CCW - Zubba's Hive (Spring)",
	"CCW - Zubba's Hive (Autumn)",
	"!Unknown 0x5D",
	"CCW - Nabnut's House (Spring)",
	"CCW - Nabnut's House (Summer)",
	"CCW - Nabnut's House (Autumn)",
	"CCW - Nabnut's House (Winter)",
	"CCW - Nabnut's Room 1 (Winter)",
	"CCW - Nabnut's Room 2 (Autumn)",
	"CCW - Nabnut's Room 2 (Winter)",
	"CCW - Top (Spring)",
	"CCW - Top (Summer)",
	"CCW - Top (Autumn)",
	"CCW - Top (Winter)",
	"Lair - MM Lobby",
	"Lair - TTC/CC Puzzle",
	"Lair - CCW Puzzle & 180 Note Door",
	"Lair - Red Cauldron Room",
	"Lair - TTC Lobby",
	"Lair - GV Lobby",
	"Lair - FP Lobby",
	"Lair - CC Lobby",
	"Lair - Statue",
	"Lair - BGS Lobby",
	"!Unknown 0x73",
	"Lair - GV Puzzle",
	"Lair - MMM Lobby",
	"Lair - 640 Note Door Room",
	"Lair - RBB Lobby",
	"Lair - RBB Puzzle",
	"Lair - CCW Lobby",
	"Lair - Floor 2, Area 5a: Crypt inside",
	"Intro - Lair 1 - Scene 1",
	"Intro - Banjo's House 1 - Scenes 3,7",
	"Intro - Spiral 'A' - Scenes 2,4",
	"Intro - Spiral 'B' - Scenes 5,6",
	"FP - Wozza's Cave",
	"Lair - Floor 3, Area 4a",
	"Intro - Lair 2",
	"Intro - Lair 3 - Machine 1",
	"Intro - Lair 4 - Game Over",
	"Intro - Lair 5",
	"Intro - Spiral 'C'",
	"Intro - Spiral 'D'",
	"Intro - Spiral 'E'",
	"Intro - Spiral 'F'",
	"Intro - Banjo's House 2",
	"Intro - Banjo's House 3",
	"RBB - Anchor room",
	"SM - Banjo's House",
	"MMM - Inside Loggo",
	"Lair - Furnace Fun",
	"TTC - Sharkfood Island",
	"Lair - Battlements",
	"File Select Screen",
	"GV - Secret Chamber",
	"Lair - Dingpot",
	"Intro - Spiral 'G'",
	"End Scene 3: All 100",
	"End Scene",
	"End Scene 4",
	"Intro - Grunty Threat 1",
	"Intro - Grunty Threat 2"
}

function data.draw()
	data.selected_map = imgui.combo("map", maps, data.selected_map)
	imgui.sameline()
	if imgui.button("warp to") then
		memory.write_u8(0x8249196d, data.selected_map+1)
		memory.write_u8(0x8249196c, 1)
	end

	local curr_map = memory.read_u8(0x8249196d)
	imgui.text(string.format("current map: %s (%d) / %s (%d)", maps[curr_map], curr_map, maps[curr_map+1], curr_map+1))
end

return data