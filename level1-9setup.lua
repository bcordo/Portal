-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 9
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 44.63181818181813
	teleporterpurple_1.y = 175.0136363636364
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.rotation = 90
	teleporterpurple_1.isVisible = false
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterwhite_1 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_1.x = 145.98181818181823
	teleporterwhite_1.y = 200.02727272727276
	teleporterwhite_1.xScale = 1
	teleporterwhite_1.yScale = 1
	teleporterwhite_1.rotation = -45
	teleporterwhite_1.isVisible = false
	
	this:insert(teleporterwhite_1)
	this.teleporterwhite_1 = teleporterwhite_1
	
	local teleporteryellow_1 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_1.x = 193.6909090909091
	teleporteryellow_1.y = 280.94999999999993
	teleporteryellow_1.xScale = 1
	teleporteryellow_1.yScale = 1
	teleporteryellow_1.isVisible = false
	
	this:insert(teleporteryellow_1)
	this.teleporteryellow_1 = teleporteryellow_1
	
	local teleporterwhite_2 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_2.x = 79 + 480
	teleporterwhite_2.y = 125.06363636363636
	teleporterwhite_2.xScale = 1
	teleporterwhite_2.yScale = 1
	teleporterwhite_2.rotation = -90
	teleporterwhite_2.isVisible = false
	
	this:insert(teleporterwhite_2)
	this.teleporterwhite_2 = teleporterwhite_2
	
	local teleporteryellow_2 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_2.x = 79 + 480
	teleporteryellow_2.y = 214.19090909090917
	teleporteryellow_2.xScale = 1
	teleporteryellow_2.yScale = 1
	teleporteryellow_2.rotation = -90
	teleporteryellow_2.isVisible = false
	
	this:insert(teleporteryellow_2)
	this.teleporteryellow_2 = teleporteryellow_2
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 79 + 480
	teleporterpurple_2.y = 37.3
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.rotation = -90
	teleporterpurple_2.isVisible = false
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	local teleporterblue_1 = display.newImageRect(imagelookup.table["Teleporterblue"],imagelookup.table["TeleporterblueWidth"],imagelookup.table["TeleporterblueHeight"])
	teleporterblue_1.x = 334.59999999999997
	teleporterblue_1.y = 44.58181818181818
	teleporterblue_1.xScale = 1
	teleporterblue_1.yScale = 1
	teleporterblue_1.isVisible = false
	
	this:insert(teleporterblue_1)
	this.teleporterblue_1 = teleporterblue_1
	
	local teleporterblue_2 = display.newImageRect(imagelookup.table["Teleporterblue"],imagelookup.table["TeleporterblueWidth"],imagelookup.table["TeleporterblueHeight"])
	teleporterblue_2.x = 79 + 480
	teleporterblue_2.y = 263.70909090909095
	teleporterblue_2.xScale = 1
	teleporterblue_2.yScale = 1
	teleporterblue_2.rotation = 90
	teleporterblue_2.isVisible = false
	
	this:insert(teleporterblue_2)
	this.teleporterblue_2 = teleporterblue_2
	
	local teleporterred_1 = display.newImageRect(imagelookup.table["Teleporterred"],imagelookup.table["TeleporterredWidth"],imagelookup.table["TeleporterredHeight"])
	teleporterred_1.x = 334.59999999999997
	teleporterred_1.y = 148.6454545454545
	teleporterred_1.xScale = 1
	teleporterred_1.yScale = 1
	teleporterred_1.isVisible = false
	
	this:insert(teleporterred_1)
	this.teleporterred_1 = teleporterred_1
	
	local teleporterred_2 = display.newImageRect(imagelookup.table["Teleporterred"],imagelookup.table["TeleporterredWidth"],imagelookup.table["TeleporterredHeight"])
	teleporterred_2.x = 79 + 480
	teleporterred_2.y = 79.60454545454546
	teleporterred_2.xScale = 1
	teleporterred_2.yScale = 1
	teleporterred_2.rotation = 90
	teleporterred_2.isVisible = false
	
	this:insert(teleporterred_2)
	this.teleporterred_2 = teleporterred_2
	
	local teleportergreen_1 = display.newImageRect(imagelookup.table["Teleportergreen"],imagelookup.table["TeleportergreenWidth"],imagelookup.table["TeleportergreenHeight"])
	teleportergreen_1.x = 334.59999999999997
	teleportergreen_1.y = 264.5090909090909
	teleportergreen_1.xScale = 1
	teleportergreen_1.yScale = 1
	teleportergreen_1.isVisible = false
	
	this:insert(teleportergreen_1)
	this.teleportergreen_1 = teleportergreen_1
	
	local teleportergreen_2 = display.newImageRect(imagelookup.table["Teleportergreen"],imagelookup.table["TeleportergreenWidth"],imagelookup.table["TeleportergreenHeight"])
	teleportergreen_2.x = 79 + 480
	teleportergreen_2.y = 172.82272727272732
	teleportergreen_2.xScale = 1
	teleportergreen_2.yScale = 1
	teleportergreen_2.rotation = 90
	teleportergreen_2.isVisible = false
	
	this:insert(teleportergreen_2)
	this.teleportergreen_2 = teleportergreen_2
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 401.3636363636364
	switch_1.y = 265.43636363636364
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 415.0318181818182
	portal_1.y = 43.24090909090909
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 248.7227272727272
	blackhole_1.y = 146.3772727272728
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	return this
end