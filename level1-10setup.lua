-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 10
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 340
	portal_1.y = 99
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 192
	switch_1.y = 89
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local lifegem_1 = display.newImageRect(imagelookup.table["Lifegem"],imagelookup.table["LifegemWidth"],imagelookup.table["LifegemHeight"])
	lifegem_1.x = 242
	lifegem_1.y = 187
	lifegem_1.xScale = 1
	lifegem_1.yScale = 1
	lifegem_1.isVisible = false
	
	this:insert(lifegem_1)
	this.lifegem_1 = lifegem_1
	
	local gem_1 = display.newImageRect(imagelookup.table["Gem"],imagelookup.table["GemWidth"],imagelookup.table["GemHeight"])
	gem_1.x = 106
	gem_1.y = 85
	gem_1.xScale = 1
	gem_1.yScale = 1
	gem_1.isVisible = false
	
	this:insert(gem_1)
	this.gem_1 = gem_1

	return this
end