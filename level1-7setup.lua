-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 7
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local metal_1 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_1.x = 49.62727272727274
	metal_1.y = 192.34090909090907
	metal_1.xScale = 1
	metal_1.yScale = 1
	metal_1.rotation = 90
	metal_1.isVisible = false

	this:insert(metal_1)
	this.metal_1 = metal_1

	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 51.868181818181796
	switch_1.y = 150.92272727272731
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false

	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local gem_1 = display.newImageRect(imagelookup.table["Gem"],imagelookup.table["GemWidth"],imagelookup.table["GemHeight"])
	gem_1.x = 200
	gem_1.y = 150.92272727272731
	gem_1.xScale = 1
	gem_1.yScale = 1
	gem_1.isVisible = false

	this:insert(gem_1)
	this.gem_1 = gem_1

	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 115.5454545454545
	blackhole_1.y = 191.4227272727273
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false

	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1

	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 312.32727272727277
	portal_1.y = 110.47727272727272
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false

	this:insert(portal_1)
	this.portal_1 = portal_1

	return this
end