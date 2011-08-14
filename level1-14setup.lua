-- _main.lua 2011-04-17T13:53:32.47-04:00

-- This class is generated code. Please do not modify.
-- See main.lua instead.

module(..., package.seeall)

local imagelookup = require("_imagelookup")
local animlookup = require("_animlookup")

display.setStatusBar(display.HiddenStatusBar)


function newMain ()
	local this = display.newGroup()
	
	this.trackerCurrent = 14
	this.trackerNext = this.trackerCurrent + 1   
	this.currentLevel = "1-" .. this.trackerCurrent
	this.next_level = "1-" .. this.trackerNext
		
	this.background = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	
	local wood_1 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_1.x = 71.42727272727272
	wood_1.y = 24.5909090909091
	wood_1.xScale = 1
	wood_1.yScale = 1
	wood_1.rotation = -45
	wood_1.isVisible = false
	
	this:insert(wood_1)
	this.wood_1 = wood_1
	
	local wood_2 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_2.x = 212.31363636363642
	wood_2.y = 167.81818181818173
	wood_2.xScale = 1
	wood_2.yScale = 1
	wood_2.rotation = -45
	wood_2.isVisible = false
	
	this:insert(wood_2)
	this.wood_2 = wood_2
	
	local wood_3 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_3.x = 140.51818181818183
	wood_3.y = 95.02272727272727
	wood_3.xScale = 1
	wood_3.yScale = 1
	wood_3.rotation = -45
	wood_3.isVisible = false
	
	this:insert(wood_3)
	this.wood_3 = wood_3
	
	local wood_4 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_4.x = 285.9727272727273
	wood_4.y = 237.81818181818184
	wood_4.xScale = 1
	wood_4.yScale = 1
	wood_4.rotation = -45
	wood_4.isVisible = false
	
	this:insert(wood_4)
	this.wood_4 = wood_4
	
	local wood_5 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_5.x = 359.6545454545454
	wood_5.y = 310
	wood_5.xScale = 1
	wood_5.yScale = 1
	wood_5.rotation = -45
	wood_5.isVisible = false
	
	this:insert(wood_5)
	this.wood_5 = wood_5
	
	local wood_6 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_6.x = 16.427272727272722
	wood_6.y = 72.31818181818183
	wood_6.xScale = 1
	wood_6.yScale = 1
	wood_6.rotation = -45
	wood_6.isVisible = false
	
	this:insert(wood_6)
	this.wood_6 = wood_6
	
	local wood_7 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_7.x = 156.47272727272733
	wood_7.y = 210.97727272727266
	wood_7.xScale = 1
	wood_7.yScale = 1
	wood_7.rotation = -45
	wood_7.isVisible = false
	
	this:insert(wood_7)
	this.wood_7 = wood_7
	
	local wood_8 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_8.x = 86.4727272727273
	wood_8.y = 141.8409090909091
	wood_8.xScale = 1
	wood_8.yScale = 1
	wood_8.rotation = -45
	wood_8.isVisible = false
	
	this:insert(wood_8)
	this.wood_8 = wood_8
	
	local wood_9 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_9.x = 226.92727272727276
	wood_9.y = 280.54545454545456
	wood_9.xScale = 1
	wood_9.yScale = 1
	wood_9.rotation = -45
	wood_9.isVisible = false
	
	this:insert(wood_9)
	this.wood_9 = wood_9
	
	local wood_10 = display.newImageRect(imagelookup.table["Wood"],imagelookup.table["WoodWidth"],imagelookup.table["WoodHeight"])
	wood_10.x = 296.9045454545454
	wood_10.y = 349.0909090909091
	wood_10.xScale = 1
	wood_10.yScale = 1
	wood_10.rotation = -45
	wood_10.isVisible = false
	
	this:insert(wood_10)
	this.wood_10 = wood_10
	
	local bomb_1 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_1.x = 40.05
	bomb_1.y = 50.5
	bomb_1.xScale = 1
	bomb_1.yScale = 1
	bomb_1.isVisible = false
	
	this:insert(bomb_1)
	this.bomb_1 = bomb_1
	
	local bomb_2 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_2.x = 76.38636363636367
	bomb_2.y = 86.81818181818181
	bomb_2.xScale = 1
	bomb_2.yScale = 1
	bomb_2.isVisible = false
	
	this:insert(bomb_2)
	this.bomb_2 = bomb_2
	
	local bomb_3 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_3.x = 161.40909090909088
	bomb_3.y = 171.39545454545453
	bomb_3.xScale = 1
	bomb_3.yScale = 1
	bomb_3.isVisible = false
	
	this:insert(bomb_3)
	this.bomb_3 = bomb_3
	
	local bomb_4 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_4.x = 205.10454545454542
	bomb_4.y = 208.7318181818182
	bomb_4.xScale = 1
	bomb_4.yScale = 1
	bomb_4.isVisible = false
	
	this:insert(bomb_4)
	this.bomb_4 = bomb_4
	
	local bomb_5 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_5.x = 298.22272727272724
	bomb_5.y = 302.29545454545456
	bomb_5.xScale = 1
	bomb_5.yScale = 1
	bomb_5.isVisible = false
	
	this:insert(bomb_5)
	this.bomb_5 = bomb_5
	
	local bomb_6 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_6.x = 250.50454545454548
	bomb_6.y = 253.61818181818182
	bomb_6.xScale = 1
	bomb_6.yScale = 1
	bomb_6.isVisible = false
	
	this:insert(bomb_6)
	this.bomb_6 = bomb_6
	
	local bomb_7 = display.newImageRect(imagelookup.table["Bomb"],imagelookup.table["BombWidth"],imagelookup.table["BombHeight"])
	bomb_7.x = 120.05000000000001
	bomb_7.y = 127.74090909090908
	bomb_7.xScale = 1
	bomb_7.yScale = 1
	bomb_7.isVisible = false
	
	this:insert(bomb_7)
	this.bomb_7 = bomb_7
	
	local blackhole_1 = display.newImageRect(imagelookup.table["Blackhole"],imagelookup.table["BlackholeWidth"],imagelookup.table["BlackholeHeight"])
	blackhole_1.x = 253.29090909090905
	blackhole_1.y = 108.6909090909091
	blackhole_1.xScale = 1
	blackhole_1.yScale = 1
	blackhole_1.isVisible = false
	
	this:insert(blackhole_1)
	this.blackhole_1 = blackhole_1
	
	local switch_1 = display.newImageRect(imagelookup.table["Switch"],imagelookup.table["SwitchWidth"],imagelookup.table["SwitchHeight"])
	switch_1.x = 298.72272727272724
	switch_1.y = 157.26818181818183
	switch_1.xScale = 1
	switch_1.yScale = 1
	switch_1.isVisible = false
	
	this:insert(switch_1)
	this.switch_1 = switch_1
	
	local portal_1 = display.newImageRect(imagelookup.table["Portal"],imagelookup.table["PortalWidth"],imagelookup.table["PortalHeight"])
	portal_1.x = 429.6
	portal_1.y = 54.15
	portal_1.xScale = 1
	portal_1.yScale = 1
	portal_1.isVisible = false
	
	this:insert(portal_1)
	this.portal_1 = portal_1
	
	local metal_1 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_1.x = 269.17727272727274
	metal_1.y = 124.60909090909088
	metal_1.xScale = 1
	metal_1.yScale = 1
	metal_1.rotation = 224.75746043946137
	metal_1.isVisible = false
	
	this:insert(metal_1)
	this.metal_1 = metal_1
	
	local metal_2 = display.newImageRect(imagelookup.table["Metal"],imagelookup.table["MetalWidth"],imagelookup.table["MetalHeight"])
	metal_2.x = 338.2227272727272
	metal_2.y = 193.67727272727274
	metal_2.xScale = 1
	metal_2.yScale = 1
	metal_2.rotation = 223.77933731583113
	metal_2.isVisible = false
	
	this:insert(metal_2)
	this.metal_2 = metal_2
	
	return this
end
	