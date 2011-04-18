
-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)

director = require("director")

function newMain ()
	local this = display.newGroup()
	
	currentLevel = 1.8
	nextLevel = 1.9
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 43.206250000000026
	switch_1.y = 171.90625
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = true
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local hmetal_1 = display.newImageRect(imagelookup.table["Hmetal"],imagelookup.table["HmetalWidth"],imagelookup.table["HmetalHeight"])
	hmetal_1.x = 48.175
	hmetal_1.y = 196.21875
	hmetal_1.xScale = 1
	hmetal_1.yScale = 1
	hmetal_1.isVisible = true
	
	this:insert(hmetal_1)
	this.hmetal_1 = hmetal_1
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 230.675
	portal_1.y = 98.71875
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = true
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 112.55625000000002
	blackhole_1.y = 196.275
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = true
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 163.14375
	teleporterpurple_1.y = 258.74375000000003
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.isVisible = true
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 104.36875
	teleporterpurple_2.y = 98.71875
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.isVisible = true
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	this:insert(director.directorView)
	
	return this
end
