-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 13
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 150.06363636363636
	blackhole_1.y = 117.7590909090909
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	local blackhole_2 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_2.x = 277.7818181818182
	blackhole_2.y = 188.26818181818183
	blackhole_2.xScale = 1
	blackhole_2.yScale = 1
	blackhole_2.isVisible = false
	
	this:insert(blackhole_2)
	this.blackhole_2 = blackhole_2
	
	local metal_1 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_1.x = 139.1590909090909
	metal_1.y = 178.6909090909091
	metal_1.xScale = 1
	metal_1.yScale = 1
	metal_1.rotation = -45
	metal_1.isVisible = false
	
	this:insert(metal_1)
	this.metal_1 = metal_1
	
	local metal_2 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_2.x = 169.15454545454543
	metal_2.y = 269.5363636363636
	metal_2.xScale = 1
	metal_2.yScale = 1
	metal_2.isVisible = false
	
	this:insert(metal_2)
	this.metal_2 = metal_2
	
	local metal_3 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_3.x = 50.054545454545455
	metal_3.y = 146.41363636363633
	metal_3.xScale = 1
	metal_3.yScale = 1
	metal_3.rotation = 90
	metal_3.isVisible = false
	
	this:insert(metal_3)
	this.metal_3 = metal_3
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 122.8
	teleporterpurple_1.y = 191.81363636363636
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.rotation = -225
	teleporterpurple_1.isVisible = false
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterwhite_1 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_1.x = 144.16363636363639
	teleporterwhite_1.y = 271.42727272727274
	teleporterwhite_1.xScale = 1
	teleporterwhite_1.yScale = 1
	teleporterwhite_1.rotation = -180
	teleporterwhite_1.isVisible = false
	
	this:insert(teleporterwhite_1)
	this.teleporterwhite_1 = teleporterwhite_1
	
	local teleporteryellow_1 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_1.x = 49.14090909090909
	teleporteryellow_1.y = 168.6727272727273
	teleporteryellow_1.xScale = 1
	teleporteryellow_1.yScale = 1
	teleporteryellow_1.rotation = -270
	teleporteryellow_1.isVisible = false
	
	this:insert(teleporteryellow_1)
	this.teleporteryellow_1 = teleporteryellow_1
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 33.19545454545454
	teleporterpurple_2.y = 51.79545454545454
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.isVisible = false
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	local teleporteryellow_2 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_2.x = 352.80454545454546
	teleporteryellow_2.y = 100.02272727272727
	teleporteryellow_2.xScale = 1
	teleporteryellow_2.yScale = 1
	teleporteryellow_2.isVisible = false
	
	this:insert(teleporteryellow_2)
	this.teleporteryellow_2 = teleporteryellow_2
	
	local teleporterwhite_2 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_2.x = 278.20454545454544
	teleporterwhite_2.y = 269.5545454545454
	teleporterwhite_2.xScale = 1
	teleporterwhite_2.yScale = 1
	teleporterwhite_2.isVisible = false
	
	this:insert(teleporterwhite_2)
	this.teleporterwhite_2 = teleporterwhite_2
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 237.79090909090905
	switch_1.y = 207.29545454545455
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 366.8681818181818
	portal_1.y = 274.07272727272726
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	return this
end