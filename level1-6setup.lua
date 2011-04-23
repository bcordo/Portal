
-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.currentLevel = "1-" .. "6"
	this.next_level = "1-" .. "7"
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
		local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
		blackhole_1.x = 200
		blackhole_1.y = 200
		blackhole_1.xScale = 1
		blackhole_1.yScale = 1
		blackhole_1.isVisible = false

		this:insert(blackhole_1)
		this.blackhole_1 = blackhole_1
		
		local whitehole_1 = display.newImageRect(imagelookup.table["Whitehole"],imagelookup.table["WhiteholeWidth"],imagelookup.table["WhiteholeHeight"])
		whitehole_1.x = 50
		whitehole_1.y = 100
		whitehole_1.xScale = 1
		whitehole_1.yScale = 1
		whitehole_1.isVisible = false

		this:insert(whitehole_1)
		this.whitehole_1 = whitehole_1
		
		local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
		teleporterpurple_1.x = 50
		teleporterpurple_1.y = 120
		teleporterpurple_1.rotation = -30
		teleporterpurple_1.xScale = 1
		teleporterpurple_1.yScale = 1
		teleporterpurple_1.isVisible = false

		this:insert(teleporterpurple_1)
		this.teleporterpurple_1 = teleporterpurple_1

		local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
		teleporterpurple_2.x = 100
		teleporterpurple_2.y = 200
		teleporterpurple_2.rotation = -30
		teleporterpurple_2.xScale = 1
		teleporterpurple_2.yScale = 1
		teleporterpurple_2.isVisible = false

		this:insert(teleporterpurple_2)
		this.teleporterpurple_2 = teleporterpurple_2		

		local wood_1 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_1.x = 203
		wood_1.y = 215
		wood_1.xScale = 1
		wood_1.yScale = 1
		wood_1.rotation = 0
		wood_1.isVisible = false

		this:insert(wood_1)
		this.wood_1 = wood_1

		local wood_2 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_2.x = 303
		wood_2.y = 215
		wood_2.xScale = 1
		wood_2.yScale = 1
		wood_2.rotation = 0
		wood_2.isVisible = false

		this:insert(wood_2)
		this.wood_2 = wood_2

		local wood_3 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_3.x = 403
		wood_3.y = 215
		wood_3.xScale = 1
		wood_3.yScale = 1
		wood_3.rotation = 0
		wood_3.isVisible = false

		this:insert(wood_3)
		this.wood_3 = wood_3

		local wood_4 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_4.x = 254
		wood_4.y = 162
		wood_4.xScale = 1
		wood_4.yScale = 1
		wood_4.rotation = 90
		wood_4.isVisible = false

		this:insert(wood_4)
		this.wood_4 = wood_4

		local wood_5 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_5.x = 352
		wood_5.y = 162
		wood_5.xScale = 1
		wood_5.yScale = 1
		wood_5.rotation = 90
		wood_5.isVisible = false

		this:insert(wood_5)
		this.wood_5 = wood_5

		local wood_6 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_6.x = 303
		wood_6.y = 143
		wood_6.xScale = 1
		wood_6.yScale = 1
		wood_6.rotation = 90
		wood_6.isVisible = false

		this:insert(wood_6)
		this.wood_6 = wood_6

		local wood_7 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
		wood_7.x = 303
		wood_7.y = 70
		wood_7.xScale = 1
		wood_7.yScale = 1
		wood_7.rotation = 90
		wood_7.isVisible = false

		this:insert(wood_7)
		this.wood_7 = wood_7

		local stone_1 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
		stone_1.x = 451
		stone_1.y = 215
		stone_1.xScale = 1
		stone_1.yScale = 1
		stone_1.rotation = 0
		stone_1.isVisible = false

		this:insert(stone_1)
		this.stone_1 = stone_1

		local stone_2 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
		stone_2.x = 451
		stone_2.y = 155
		stone_2.xScale = 1
		stone_2.yScale = 1
		stone_2.rotation = 0
		stone_2.isVisible = false

		this:insert(stone_2)
		this.stone_2 = stone_2
		
		local stone_3 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
		stone_3.x = 265
		stone_3.y = 128
		stone_3.xScale = 1
		stone_3.yScale = 1
		stone_3.rotation = 0
		stone_3.isVisible = false

		this:insert(stone_3)
		this.stone_1 = stone_3

		local stone_4 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
		stone_4.x = 340
		stone_4.y = 128
		stone_4.xScale = 1
		stone_4.yScale = 1
		stone_4.rotation = 0
		stone_4.isVisible = false

		this:insert(stone_4)
		this.stone_2 = stone_4

		local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
		portal_1.x = 303
		portal_1.y = 135
		portal_1.xScale = 1
		portal_1.yScale = 1
		portal_1.isVisible = false

		this:insert(portal_1)
		this.portal_1 = portal_1

		local bomb_1 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
		bomb_1.x = 150
		bomb_1.y = 250
		bomb_1.xScale = 1
		bomb_1.yScale = 1
		bomb_1.isVisible = false

		this:insert(bomb_1)
		this.bomb_1 = bomb_1

		local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
		switch_1.x = 300
		switch_1.y = 250
		switch_1.xScale = 1
		switch_1.yScale = 1
		switch_1.isVisible = false

		this:insert(switch_1)
		this.switch_1 = switch_1

		return this
end