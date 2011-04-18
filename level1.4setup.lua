
-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.currentLevel = 1.4
	this.next_level = 1.5
		
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
	
	local whitehole_1 = display.newImageRect(imagelookup.table["Whitehole"],imagelookup.table["WhiteholeWidth"],imagelookup.table["WhiteholeHeight"])
	whitehole_1.x = 200
	whitehole_1.y = 200
	whitehole_1.xScale = 1
	whitehole_1.yScale = 1
	whitehole_1.isVisible = false
	
	this:insert(whitehole_1)
	this.whitehole_1 = whitehole_1
	

	
	return this
end
