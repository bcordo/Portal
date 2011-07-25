-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 11
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local bomb_1 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_1.x = 134.62727272727278
	bomb_1.y = 76.39090909090908
	bomb_1.xScale = 1
	bomb_1.yScale = 1
	bomb_1.isVisible = false
	
	this:insert(bomb_1)
	this.bomb_1 = bomb_1
	
	local bomb_2 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_2.x = 283.6727272727273
	bomb_2.y = 75.96363636363635
	bomb_2.xScale = 1
	bomb_2.yScale = 1
	bomb_2.isVisible = false
	
	this:insert(bomb_2)
	this.bomb_2 = bomb_2
	
	local bomb_3 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_3.x = 133
	bomb_3.y = 206.5
	bomb_3.xScale = 1
	bomb_3.yScale = 1
	bomb_3.isVisible = false
	
	this:insert(bomb_3)
	this.bomb_3 = bomb_3
	
	local bomb_4 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_4.x = 210.50454545454548
	bomb_4.y = 220.94545454545462
	bomb_4.xScale = 1
	bomb_4.yScale = 1
	bomb_4.isVisible = false
	
	this:insert(bomb_4)
	this.bomb_4 = bomb_4
	
	local bomb_5 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_5.x = 292.3090909090909
	bomb_5.y = 140.52727272727276
	bomb_5.xScale = 1
	bomb_5.yScale = 1
	bomb_5.isVisible = false
	
	this:insert(bomb_5)
	this.bomb_5 = bomb_5
	
	local bomb_6 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_6.x = 290.9681818181818
	bomb_6.y = 213.21818181818182
	bomb_6.xScale = 1
	bomb_6.yScale = 1
	bomb_6.isVisible = false
	
	this:insert(bomb_6)
	this.bomb_6 = bomb_6
	
	local wood_1 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_1.x = 158.22272727272724
	wood_1.y = 150.0545454545454
	wood_1.xScale = 1
	wood_1.yScale = 1
	wood_1.isVisible = false
	
	this:insert(wood_1)
	this.wood_1 = wood_1
	
	local wood_2 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_2.x = 257.33636363636367
	wood_2.y = 135.47727272727275
	wood_2.xScale = 1
	wood_2.yScale = 1
	wood_2.isVisible = false
	
	this:insert(wood_2)
	this.wood_2 = wood_2
	
	local wood_3 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_3.x = 200.9454545454546
	wood_3.y = 93.70454545454547
	wood_3.xScale = 1
	wood_3.yScale = 1
	wood_3.rotation = 90
	wood_3.isVisible = false
	
	this:insert(wood_3)
	this.wood_3 = wood_3
	
	local wood_4 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_4.x = 213.6727272727273
	wood_4.y = 191.86363636363632
	wood_4.xScale = 1
	wood_4.yScale = 1
	wood_4.rotation = 90
	wood_4.isVisible = false
	
	this:insert(wood_4)
	this.wood_4 = wood_4
	
	local bomb_7 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_7.x = 200.5
	bomb_7.y = 63.2
	bomb_7.xScale = 1
	bomb_7.yScale = 1
	bomb_7.isVisible = false
	
	this:insert(bomb_7)
	this.bomb_7 = bomb_7
	
	local bomb_8 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_8.x = 123.21363636363638
	bomb_8.y = 142.72727272727275
	bomb_8.xScale = 1
	bomb_8.yScale = 1
	bomb_8.isVisible = false
	
	this:insert(bomb_8)
	this.bomb_8 = bomb_8
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 435.54090909090905
	portal_1.y = 42.309090909090926
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	
	
	local stone_1 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
	stone_1.x = 79.62272727272727
	stone_1.y = 106.4
	stone_1.xScale = 1
	stone_1.yScale = 1
	stone_1.isVisible = false
	
	this:insert(stone_1)
	this.stone_1 = stone_1
	
	local stone_2 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
	stone_2.x = 337.79090909090905
	stone_2.y = 105
	stone_2.xScale = 1
	stone_2.yScale = 1
	stone_2.isVisible = false
	
	this:insert(stone_2)
	this.stone_2 = stone_2
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 208.66818181818184
	blackhole_1.y = 172
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 208.63636363636365
	switch_1.y = 140.47727272727275
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local stone_3 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
	stone_3.x = 81.86818181818182
	stone_3.y = 207.2727272727273
	stone_3.xScale = 1
	stone_3.yScale = 1
	stone_3.isVisible = false
	
	this:insert(stone_3)
	this.stone_3 = stone_3
	
	local stone_4 = display.newImageRect(imagelookup.table["Stone"],imagelookup.table["StoneWidth"],imagelookup.table["StoneHeight"])
	stone_4.x = 341.8772727272727
	stone_4.y = 205.48181818181814
	stone_4.xScale = 1
	stone_4.yScale = 1
	stone_4.isVisible = false
	
	this:insert(stone_4)
	this.stone_4 = stone_4
	
	local teleporterpurple_1 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_1.x = 373.2363636363637
	teleporterpurple_1.y = 282.28636363636366
	teleporterpurple_1.xScale = 1
	teleporterpurple_1.yScale = 1
	teleporterpurple_1.isVisible = false
	
	this:insert(teleporterpurple_1)
	this.teleporterpurple_1 = teleporterpurple_1
	
	local teleporterpurple_2 = display.newImageRect(imagelookup.table["Teleporterpurple"],imagelookup.table["TeleporterpurpleWidth"],imagelookup.table["TeleporterpurpleHeight"])
	teleporterpurple_2.x = 375.54545454545445
	teleporterpurple_2.y = 44.56363636363636
	teleporterpurple_2.xScale = 1
	teleporterpurple_2.yScale = 1
	teleporterpurple_2.isVisible = false
	
	this:insert(teleporterpurple_2)
	this.teleporterpurple_2 = teleporterpurple_2
	
	return this
end