
-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 2
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 427
	portal_1.y = 56
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 201
	switch_1.y = 124
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 393
	teleporterpurple_1.y = 252
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.isVisible = false
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 373
	teleporterpurple_2.y = 93
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.rotation = -36.57303097851933
	teleporterpurple_2.isVisible = false
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	local stone_1 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
	stone_1.x = 153
	stone_1.y = 146
	stone_1.xScale = 1
	stone_1.yScale = 1
	stone_1.isVisible = false
	
	this:insert(stone_1)
	this.stone_1 = stone_1
	
	local stone_2 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
	stone_2.x = 249
	stone_2.y = 146
	stone_2.xScale = 1
	stone_2.yScale = 1
	stone_2.isVisible = false
	
	this:insert(stone_2)
	this.stone_2 = stone_2
	
	local bomb_1 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_1.x = 202
	bomb_1.y = 178
	bomb_1.xScale = 1
	bomb_1.yScale = 1
	bomb_1.isVisible = false
	
	this:insert(bomb_1)
	this.bomb_1 = bomb_1
	
	local gem_1 = display.newImageRect(imagelookup.table["Gem"],imagelookup.table["GemWidth"],imagelookup.table["GemHeight"])
	gem_1.x = 156
	gem_1.y = 257
	gem_1.xScale = 1
	gem_1.yScale = 1
	gem_1.isVisible = false
	
	this:insert(gem_1)
	this.gem_1 = gem_1
	
	local lifegem_1 = display.newImageRect(imagelookup.table["Lifegem"],imagelookup.table["LifegemWidth"],imagelookup.table["LifegemHeight"])
	lifegem_1.x = 250 +480	
	lifegem_1.y = 61
	lifegem_1.xScale = 1
	lifegem_1.yScale = 1
	lifegem_1.isVisible = false
	
	this:insert(lifegem_1)
	this.lifegem_1 = lifegem_1
	
	local metal_1 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_1.x = 336
	metal_1.y = 75
	metal_1.xScale = 1
	metal_1.yScale = 1
	metal_1.isVisible = false
	
	this:insert(metal_1)
	this.metal_1 = metal_1
	
	local metal_2 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_2.x = 394
	metal_2.y = 131
	metal_2.xScale = 1
	metal_2.yScale = 1
	metal_2.rotation = 90
	metal_2.isVisible = false
	
	this:insert(metal_2)
	this.metal_2 = metal_2
	
	local gem_2 = display.newImageRect(imagelookup.table["Gem"],imagelookup.table["GemWidth"],imagelookup.table["GemHeight"])
	gem_2.x = 284
	gem_2.y = 257
	gem_2.xScale = 1
	gem_2.yScale = 1
	gem_2.isVisible = false
	
	this:insert(gem_2)
	this.gem_2 = gem_2
	
	local gem_3 = display.newImageRect(imagelookup.table["Gem"],imagelookup.table["GemWidth"],imagelookup.table["GemHeight"])
	gem_3.x = 219
	gem_3.y = 257
	gem_3.xScale = 1
	gem_3.yScale = 1
	gem_3.isVisible = false
	
	this:insert(gem_3)
	this.gem_3 = gem_3
	
	local gem_4 = display.newImageRect(imagelookup.table["Gem"],imagelookup.table["GemWidth"],imagelookup.table["GemHeight"])
	gem_4.x = 340
	gem_4.y = 258
	gem_4.xScale = 1
	gem_4.yScale = 1
	gem_4.isVisible = false
	
	this:insert(gem_4)
	this.gem_4 = gem_4
	
	local teleportergreen_1 = display.newImageRect(imagelookup.table["Teleportergreen"],imagelookup.table["TeleportergreenWidth"],imagelookup.table["TeleportergreenHeight"])
	teleportergreen_1.x = 42
	teleportergreen_1.y = 100
	teleportergreen_1.xScale = 1
	teleportergreen_1.yScale = 1
	teleportergreen_1.rotation = 90
	teleportergreen_1.isVisible = false
	
	this:insert(teleportergreen_1)
	this.teleportergreen_1 = teleportergreen_1
	
	local teleportergreen_2 = display.newImageRect(imagelookup.table["Teleportergreen"],imagelookup.table["TeleportergreenWidth"],imagelookup.table["TeleportergreenHeight"])
	teleportergreen_2.x = 100 + 480
	teleportergreen_2.y = 62
	teleportergreen_2.xScale = 1
	teleportergreen_2.yScale = 1
	teleportergreen_2.rotation = 0
	teleportergreen_2.isVisible = false
	
	this:insert(teleportergreen_2)
	this.teleportergreen_2 = teleportergreen_2
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 200
	blackhole_1.y = 152
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1

	
	return this
end
