
-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 5
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/level1.1_background-2.png",
		"images/level1.1_background-2.png"
	}
	
	
		local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
		blackhole_1.x = 101.88636363636363
		blackhole_1.y = 213.6818181818182
		blackhole_1.xScale = 1
		blackhole_1.yScale = 1
		blackhole_1.isVisible = false

		this:insert(blackhole_1)
		this.blackhole_1 = blackhole_1

		local wood_1 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_1.x = 165
		wood_1.y = 227
		wood_1.xScale = 1
		wood_1.yScale = 1
		wood_1.rotation = 0.01
		wood_1.isVisible = false

		this:insert(wood_1)
		this.wood_1 = wood_1

		local wood_2 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_2.x = 305.09090909090907
		wood_2.y = 215.50000000000006
		wood_2.xScale = 1
		wood_2.yScale = 1
		wood_2.rotation = 0.01
		wood_2.isVisible = false

		this:insert(wood_2)
		this.wood_2 = wood_2

		local wood_3 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_3.x = 206
		wood_3.y = 171
		wood_3.xScale = 1
		wood_3.yScale = 1
		wood_3.rotation = 90
		wood_3.isVisible = false

		this:insert(wood_3)
		this.wood_3 = wood_3

		local wood_4 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_4.x = 256.86363636363643
		wood_4.y = 60.95454545454545
		wood_4.xScale = 1
		wood_4.yScale = 1
		wood_4.rotation = 90
		wood_4.isVisible = false

		this:insert(wood_4)
		this.wood_4 = wood_4

		local wood_5 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_5.x = 252.79545454545453
		wood_5.y = 227.27272727272725
		wood_5.xScale = 1
		wood_5.yScale = 1
		wood_5.rotation = 0.01
		wood_5.isVisible = false

		this:insert(wood_5)
		this.wood_5 = wood_5

		local wood_6 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_6.x = 230
		wood_6.y = 116
		wood_6.xScale = 1
		wood_6.yScale = 1
		wood_6.rotation = 0.01
		wood_6.isVisible = false

		this:insert(wood_6)
		this.wood_6 = wood_6

		local wood_7 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_7.x = 299
		wood_7.y = 114
		wood_7.xScale = 1
		wood_7.yScale = 1
		wood_7.rotation = 0.01
		wood_7.isVisible = false

		this:insert(wood_7)
		this.wood_7 = wood_7

		local wood_8 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_8.x = 211.86363636363637
		wood_8.y = 283.18181818181813
		wood_8.xScale = 1
		wood_8.yScale = 1
		wood_8.rotation = 90
		wood_8.isVisible = false

		this:insert(wood_8)
		this.wood_8 = wood_8

		local stone_1 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
		stone_1.x = 277.7954545454546
		stone_1.y = 167.75
		stone_1.xScale = 1
		stone_1.yScale = 1
		stone_1.rotation = 0.01
		stone_1.isVisible = false

		this:insert(stone_1)
		this.stone_1 = stone_1

		local stone_2 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
		stone_2.x = 281.90909090909093
		stone_2.y = 270.93181818181813
		stone_2.xScale = 1
		stone_2.yScale = 1
		stone_2.rotation = 0.01
		stone_2.isVisible = false

		this:insert(stone_2)
		this.stone_2 = stone_2

		local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
		portal_1.x = 258.2045454545455
		portal_1.y = 112.75000000000001
		portal_1.xScale = 1
		portal_1.yScale = 1
		portal_1.isVisible = false

		this:insert(portal_1)
		this.portal_1 = portal_1

		local bomb_1 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
		bomb_1.x = 131.43636363636372
		bomb_1.y = 264.58181818181816
		bomb_1.xScale = 1
		bomb_1.yScale = 1
		bomb_1.isVisible = false

		this:insert(bomb_1)
		this.bomb_1 = bomb_1

		local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
		switch_1.x = 207.30454545454546
		switch_1.y = 229.10454545454544
		switch_1.xScale = 1
		switch_1.yScale = 1
		switch_1.isVisible = false

		this:insert(switch_1)
		this.switch_1 = switch_1

		return this
end