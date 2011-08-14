-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 12
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local metal_1 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_1.x = 141.44090909090897
	metal_1.y = 146.37272727272736
	metal_1.xScale = 1
	metal_1.yScale = 1
	metal_1.rotation = -70
	metal_1.isVisible = false
	
	this:insert(metal_1)
	this.metal_1 = metal_1
	
	local metal_2 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_2.x = 182.7454545454545
	metal_2.y = 44.1454545454546
	metal_2.xScale = 1
	metal_2.yScale = 1
	metal_2.rotation = -70
	metal_2.isVisible = false
	
	this:insert(metal_2)
	this.metal_2 = metal_2
	
	local metal_3 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_3.x = 121.88636363636363
	metal_3.y = 80.48181818181816
	metal_3.xScale = 1
	metal_3.yScale = 1
	metal_3.rotation = 22.06998980003644
	metal_3.isVisible = false
	
	this:insert(metal_3)
	this.metal_3 = metal_3
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 174.58636363636361
	switch_1.y = 98.64999999999999
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 405.9818181818182
	portal_1.y = 122.30909090909091
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 161.4227272727273
	blackhole_1.y = 183.19090909090912
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	return this
end