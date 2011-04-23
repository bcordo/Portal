-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.currentLevel = "1-" .. "8"
	this.next_level = "1-" .. "9"
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 155
	blackhole_1.y = 180
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	local blackhole_2 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_2.x = 135
	blackhole_2.y = 200
	blackhole_2.xScale = 1
	blackhole_2.yScale = 1
	blackhole_2.isVisible = false
	
	this:insert(blackhole_2)
	this.blackhole_2 = blackhole_2
	
	local blackhole_3 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_3.x = 115
	blackhole_3.y = 220
	blackhole_3.xScale = 1
	blackhole_3.yScale = 1
	blackhole_3.isVisible = false
	
	this:insert(blackhole_3)
	this.blackhole_3 = blackhole_3
	-- 
	-- local blackhole_4 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	-- blackhole_4.x = 167.76818181818186
	-- blackhole_4.y = 59.554545454545455
	-- blackhole_4.xScale = 1
	-- blackhole_4.yScale = 1
	-- blackhole_4.isVisible = false
	-- 
	-- this:insert(blackhole_4)
	-- this.blackhole_4 = blackhole_4
	-- 
	-- local blackhole_5 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	-- blackhole_5.x = 260.92727272727274
	-- blackhole_5.y = 116.84999999999998
	-- blackhole_5.xScale = 1
	-- blackhole_5.yScale = 1
	-- blackhole_5.isVisible = false
	-- 
	-- this:insert(blackhole_5)
	-- this.blackhole_5 = blackhole_5
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 150
	teleporterpurple_1.y = 130
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.rotation = -89.51785557245836
	teleporterpurple_1.isVisible = false
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterwhite_1 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_1.x = 217
	teleporterwhite_1.y = 170
	teleporterwhite_1.xScale = 1
	teleporterwhite_1.yScale = 1
	teleporterwhite_1.rotation = -32.914065932417046
	teleporterwhite_1.isVisible = false
	
	this:insert(teleporterwhite_1)
	this.teleporterwhite_1 = teleporterwhite_1
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 356.4090909090909
	teleporterpurple_2.y = 257.2727272727273
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.isVisible = false
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 550
	switch_1.y = 257.34999999999997
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local teleporterwhite_2 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_2.x = 357.7727272727273
	teleporterwhite_2.y = 70.03636363636365
	teleporterwhite_2.xScale = 1
	teleporterwhite_2.yScale = 1
	teleporterwhite_2.isVisible = false
	
	this:insert(teleporterwhite_2)
	this.teleporterwhite_2 = teleporterwhite_2
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 550
	portal_1.y = 70.06818181818183
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	return this
end