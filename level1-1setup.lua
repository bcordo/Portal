
-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 1
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/level1.1_background-2.png",
		"images/level1.1_background-2.png"
	}
	
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 350
	switch_1.y = 250
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 300
	portal_1.y = 100
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 350
	teleporterpurple_1.y = 250
	teleporterpurple_1.rotation = 0
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.isVisible = false
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 600
	teleporterpurple_2.y = 250
	teleporterpurple_2.rotation = -30
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.isVisible = false
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 200
	blackhole_1.y = 200
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	local whitehole_1 = display.newImageRect(imagelookup.table["Whitehole"],imagelookup.table["WhiteholeWidth"],imagelookup.table["WhiteholeHeight"])
	whitehole_1.x = 300
	whitehole_1.y = 200
	whitehole_1.xScale = 1
	whitehole_1.yScale = 1
	whitehole_1.isVisible = false
	
	this:insert(whitehole_1)
	this.whitehole_1 = whitehole_1
	
	local wood_1 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_1.x = 165
	wood_1.y = 227
	wood_1.xScale = 1
	wood_1.yScale = 1
	wood_1.rotation = 0.01
	wood_1.isVisible = false

	this:insert(wood_1)
	this.wood_1 = wood_1
	
	local stone_1 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
	stone_1.x = 277.7954545454546
	stone_1.y = 167.75
	stone_1.xScale = 1
	stone_1.yScale = 1
	stone_1.rotation = 0.01
	stone_1.isVisible = false

	this:insert(stone_1)
	this.stone_1 = stone_1
	
	local bomb_1 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_1.x = 113
	bomb_1.y = 260
	bomb_1.xScale = 1
	bomb_1.yScale = 1
	bomb_1.isVisible = false

	this:insert(bomb_1)
	this.bomb_1 = bomb_1
	
	local metal_1 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_1.x = 49.62727272727274
	metal_1.y = 192.34090909090907
	metal_1.xScale = 1
	metal_1.yScale = 1
	metal_1.rotation = 90
	metal_1.isVisible = false

	this:insert(metal_1)
	this.metal_1 = metal_1
	
	local gem_1 = display.newImageRect(imagelookup.table["Gem"],imagelookup.table["GemWidth"],imagelookup.table["GemHeight"])
	gem_1.x = 200
	gem_1.y = 150.92272727272731
	gem_1.xScale = 1
	gem_1.yScale = 1
	gem_1.isVisible = false

	this:insert(gem_1)
	this.gem_1 = gem_1
	
	local lifegem_1 = display.newImageRect(imagelookup.table["Lifegem"],imagelookup.table["LifegemWidth"],imagelookup.table["LifegemHeight"])
	lifegem_1.x = 300
	lifegem_1.y = 150.92272727272731
	lifegem_1.xScale = 1
	lifegem_1.yScale = 1
	lifegem_1.isVisible = false

	this:insert(lifegem_1)
	this.lifegem_1 = lifegem_1
	
	local teleporterwhite_1 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_1.x = 217
	teleporterwhite_1.y = 170
	teleporterwhite_1.xScale = 1
	teleporterwhite_1.yScale = 1
	teleporterwhite_1.rotation = -32.914065932417046
	teleporterwhite_1.isVisible = false
	
	this:insert(teleporterwhite_1)
	this.teleporterwhite_1 = teleporterwhite_1
	
	local teleporterwhite_2 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_2.x = 357.7727272727273
	teleporterwhite_2.y = 70.03636363636365
	teleporterwhite_2.xScale = 1
	teleporterwhite_2.yScale = 1
	teleporterwhite_2.isVisible = false
	
	this:insert(teleporterwhite_2)
	this.teleporterwhite_2 = teleporterwhite_2
	
	local teleporteryellow_1 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_1.x = 193.6909090909091
	teleporteryellow_1.y = 280.94999999999993
	teleporteryellow_1.xScale = 1
	teleporteryellow_1.yScale = 1
	teleporteryellow_1.isVisible = false
	
	this:insert(teleporteryellow_1)
	this.teleporteryellow_1 = teleporteryellow_1
	
	local teleporteryellow_2 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_2.x = 79 + 480
	teleporteryellow_2.y = 214.19090909090917
	teleporteryellow_2.xScale = 1
	teleporteryellow_2.yScale = 1
	teleporteryellow_2.rotation = -90
	teleporteryellow_2.isVisible = false
	
	this:insert(teleporteryellow_2)
	this.teleporteryellow_2 = teleporteryellow_2

	
	return this
end
