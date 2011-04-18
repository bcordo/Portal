-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.currentLevel = 1.8
	this.next_level = 1.9
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 79.15
	teleporterpurple_1.y = 104.6
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.isVisible = false
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterorange_1 = display.newImageRect(imagelookup.table["Teleporterorange"],imagelookup.table["TeleporterorangeWidth"],imagelookup.table["TeleporterorangeHeight"])
	teleporterorange_1.x = 163.2
	teleporterorange_1.y = 72.75
	teleporterorange_1.xScale = 1
	teleporterorange_1.yScale = 1
	teleporterorange_1.isVisible = false
	
	this:insert(teleporterorange_1)
	this.teleporterorange_1 = teleporterorange_1
	
	local teleporterred_1 = display.newImageRect(imagelookup.table["Teleporterred"],imagelookup.table["TeleporterredWidth"],imagelookup.table["TeleporterredHeight"])
	teleporterred_1.x = 120.95
	teleporterred_1.y = 90.5
	teleporterred_1.xScale = 1
	teleporterred_1.yScale = 1
	teleporterred_1.isVisible = false
	
	this:insert(teleporterred_1)
	this.teleporterred_1 = teleporterred_1
	
	local teleporterorange_2 = display.newImageRect(imagelookup.table["Teleporterorange"],imagelookup.table["TeleporterorangeWidth"],imagelookup.table["TeleporterorangeHeight"])
	teleporterorange_2.x = 202.75
	teleporterorange_2.y = 65.95
	teleporterorange_2.xScale = 1
	teleporterorange_2.yScale = 1
	teleporterorange_2.isVisible = false
	
	this:insert(teleporterorange_2)
	this.teleporterorange_2 = teleporterorange_2
	
	local teleporterred_2 = display.newImageRect(imagelookup.table["Teleporterred"],imagelookup.table["TeleporterredWidth"],imagelookup.table["TeleporterredHeight"])
	teleporterred_2.x = 138.22272727272727
	teleporterred_2.y = 155.95454545454544
	teleporterred_2.xScale = 1
	teleporterred_2.yScale = 1
	teleporterred_2.isVisible = false
	
	this:insert(teleporterred_2)
	this.teleporterred_2 = teleporterred_2
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 26.85
	teleporterpurple_2.y = 106.4
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.isVisible = false
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	local teleporterwhite_1 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_1.x = 283.2
	teleporterwhite_1.y = 168.2
	teleporterwhite_1.xScale = 1
	teleporterwhite_1.yScale = 1
	teleporterwhite_1.isVisible = false
	
	this:insert(teleporterwhite_1)
	this.teleporterwhite_1 = teleporterwhite_1
	
	local teleporterwhite_2 = display.newImageRect(imagelookup.table["Teleporterwhite"],imagelookup.table["TeleporterwhiteWidth"],imagelookup.table["TeleporterwhiteHeight"])
	teleporterwhite_2.x = 314.57727272727277
	teleporterwhite_2.y = 164.5409090909091
	teleporterwhite_2.xScale = 1
	teleporterwhite_2.yScale = 1
	teleporterwhite_2.isVisible = false
	
	this:insert(teleporterwhite_2)
	this.teleporterwhite_2 = teleporterwhite_2
	
	local teleporteryellow_1 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_1.x = 205.05
	teleporteryellow_1.y = 207.3
	teleporteryellow_1.xScale = 1
	teleporteryellow_1.yScale = 1
	teleporteryellow_1.isVisible = false
	
	this:insert(teleporteryellow_1)
	this.teleporteryellow_1 = teleporteryellow_1
	
	local teleporteryellow_2 = display.newImageRect(imagelookup.table["Teleporteryellow"],imagelookup.table["TeleporteryellowWidth"],imagelookup.table["TeleporteryellowHeight"])
	teleporteryellow_2.x = 240.05
	teleporteryellow_2.y = 201.85
	teleporteryellow_2.xScale = 1
	teleporteryellow_2.yScale = 1
	teleporteryellow_2.isVisible = false
	
	this:insert(teleporteryellow_2)
	this.teleporteryellow_2 = teleporteryellow_2
	
	local teleportergreen_1 = display.newImageRect(imagelookup.table["Teleportergreen"],imagelookup.table["TeleportergreenWidth"],imagelookup.table["TeleportergreenHeight"])
	teleportergreen_1.x = 102.30909090909091
	teleportergreen_1.y = 173.65
	teleportergreen_1.xScale = 1
	teleportergreen_1.yScale = 1
	teleportergreen_1.isVisible = false
	
	this:insert(teleportergreen_1)
	this.teleportergreen_1 = teleportergreen_1
	
	local teleportergreen_2 = display.newImageRect(imagelookup.table["Teleportergreen"],imagelookup.table["TeleportergreenWidth"],imagelookup.table["TeleportergreenHeight"])
	teleportergreen_2.x = 54.181818181818194
	teleportergreen_2.y = 122.76363636363638
	teleportergreen_2.xScale = 1
	teleportergreen_2.yScale = 1
	teleportergreen_2.isVisible = false
	
	this:insert(teleportergreen_2)
	this.teleportergreen_2 = teleportergreen_2
	
	local teleporterblue_1 = display.newImageRect(imagelookup.table["Teleporterblue"],imagelookup.table["TeleporterblueWidth"],imagelookup.table["TeleporterblueHeight"])
	teleporterblue_1.x = 180.05
	teleporterblue_1.y = 252.3
	teleporterblue_1.xScale = 1
	teleporterblue_1.yScale = 1
	teleporterblue_1.isVisible = false
	
	this:insert(teleporterblue_1)
	this.teleporterblue_1 = teleporterblue_1
	
	local teleporterblue_2 = display.newImageRect(imagelookup.table["Teleporterblue"],imagelookup.table["TeleporterblueWidth"],imagelookup.table["TeleporterblueHeight"])
	teleporterblue_2.x = 152.75
	teleporterblue_2.y = 254.6
	teleporterblue_2.xScale = 1
	teleporterblue_2.yScale = 1
	teleporterblue_2.isVisible = false
	
	this:insert(teleporterblue_2)
	this.teleporterblue_2 = teleporterblue_2
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 194.6
	switch_1.y = 148.65
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 377.75
	portal_1.y = 190.05
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local bomb_1 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_1.x = 274.6
	bomb_1.y = 74.6
	bomb_1.xScale = 1
	bomb_1.yScale = 1
	bomb_1.isVisible = false
	
	this:insert(bomb_1)
	this.bomb_1 = bomb_1
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 160.05
	blackhole_1.y = 165.05
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	return this
end
	