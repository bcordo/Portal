module(..., package.seeall)

function getData()
	local lvlsetup = require("level".._G.currentLevel.."setup")
	local lvl = lvlsetup.newMain()
	
	currentLevel = lvl.currentLevel
	next_level = lvl.next_level

	print("this is level " .. currentLevel .. " setup" .. "the next level is: " .. next_level)	
	
	local leveldata = {}
	
	
	leveldata.portal = 
	{
		id = "portal",
		src = "images/portal1.png",
		width = 60,
		height = 40,
		x = lvl.portal_1.x,
		y = lvl.portal_1.y,
		myName = "portal",
		bodyType = "static",				
	}
	
	if lvl.blackhole_1 and lvl.blackhole_2 and lvl.blackhole_3 and lvl.blackhole_4 and lvl.blackhole_5 and lvl.blackhole_6 then
	leveldata.blackHoles = 
	{
		
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_1.x,
			y = lvl.blackhole_1.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole2 = 
		 { 
			id =  "BlackHole2",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_2.x,
			y = lvl.blackhole_2.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole3 = 
		 { 
			id =  "BlackHole3",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_3.x,
			y = lvl.blackhole_3.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole4 = 
		 { 
			id =  "BlackHole4",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_4.x,
			y = lvl.blackhole_4.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole5 = 
		 { 
			id =  "BlackHole5",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_5.x,
			y = lvl.blackhole_5.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole6 = 
		 { 
			id =  "BlackHole6",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_6.x,
			y = lvl.blackhole_6.y,
			myName = "blackhole",
			forceFactor = 10
		},
	}
	
	elseif lvl.blackhole_1 and lvl.blackhole_2 and lvl.blackhole_3 and lvl.blackhole_4 and lvl.blackhole_5 then
	leveldata.blackHoles = 
	{
		
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_1.x,
			y = lvl.blackhole_1.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole2 = 
		 { 
			id =  "BlackHole2",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_2.x,
			y = lvl.blackhole_2.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole3 = 
		 { 
			id =  "BlackHole3",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_3.x,
			y = lvl.blackhole_3.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole4 = 
		 { 
			id =  "BlackHole4",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_4.x,
			y = lvl.blackhole_4.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole5 = 
		 { 
			id =  "BlackHole5",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_5.x,
			y = lvl.blackhole_5.y,
			myName = "blackhole",
			forceFactor = 10
		},
	}
	
	elseif lvl.blackhole_1 and lvl.blackhole_2 and lvl.blackhole_3 and lvl.blackhole_4 then
	leveldata.blackHoles = 
	{
		
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_1.x,
			y = lvl.blackhole_1.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole2 = 
		 { 
			id =  "BlackHole2",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_2.x,
			y = lvl.blackhole_2.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole3 = 
		 { 
			id =  "BlackHole3",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_3.x,
			y = lvl.blackhole_3.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole4 = 
		 { 
			id =  "BlackHole4",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_4.x,
			y = lvl.blackhole_4.y,
			myName = "blackhole",
			forceFactor = 10
		},
		

	}
	
	elseif lvl.blackhole_1 and lvl.blackhole_2 and lvl.blackhole_3 then
	leveldata.blackHoles = 
	{
		
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_1.x,
			y = lvl.blackhole_1.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole2 = 
		 { 
			id =  "BlackHole2",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_2.x,
			y = lvl.blackhole_2.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole3 = 
		 { 
			id =  "BlackHole3",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_3.x,
			y = lvl.blackhole_3.y,
			myName = "blackhole",
			forceFactor = 10
		},
		

	}

	elseif lvl.blackhole_1 and lvl.blackhole_2 then
	leveldata.blackHoles = 
	{
		
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_1.x,
			y = lvl.blackhole_1.y,
			myName = "blackhole",
			forceFactor = 10
		},
		
		BlackHole2 = 
		 { 
			id =  "BlackHole2",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_2.x,
			y = lvl.blackhole_2.y,
			myName = "blackhole",
			forceFactor = 10
		},
		

	}
	
	elseif lvl.blackhole_1 then
	leveldata.blackHoles = 
	{
		
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = lvl.blackhole_1.x,
			y = lvl.blackhole_1.y,
			myName = "blackhole",
			forceFactor = 10
		},
		

	}
	else
		leveldata.blackHoles = 
		{
			
		}
	end
	
	if lvl.whitehole_1 and lvl.whitehole_2 then
	leveldata.whiteHoles = 
	{
		
		WhiteHole1 = 
		 { 
			id =  "WhiteHole1",
			src = "images/whitehole.png",
			width = 25,
			height = 25,
		 	x = lvl.whitehole_1.x,
			y = lvl.whitehole_1.y,
			myName = "whitehole",
			forceFactor = 500
		},
		
		WhiteHole2 = 
		 { 
			id =  "WhiteHole2",
			src = "images/whitehole.png",
			width = 25,
			height = 25,
		 	x = lvl.whitehole_2.x,
			y = lvl.whitehole_2.y,
			myName = "whitehole",
			forceFactor = 500
		},
		

	}
	elseif lvl.whitehole_1 then
	leveldata.whiteHoles = 
	{
		
		WhiteHole1 = 
		 { 
			id =  "WhiteHole1",
			src = "images/whitehole.png",
			width = 25,
			height = 25,
		 	x = lvl.whitehole_1.x,
			y = lvl.whitehole_1.y,
			myName = "whitehole",
			forceFactor = 500
		},
		

	}
	else
		leveldata.whiteHoles = 
		{
			
		}
	end
	
	if lvl.teleporterpurple_1 and lvl.teleporterpurple_2 and lvl.teleporterwhite_1 and lvl.teleporterwhite_2 and lvl.teleporteryellow_1 and lvl.teleporteryellow_2 and lvl.teleporterblue_1 and lvl.teleporterblue_2 and lvl.teleporterred_1 and lvl.teleporterred_2 and lvl.teleportergreen_1 and lvl.teleportergreen_2 and lvl.teleporterorange_1 and lvl.teleporterorange_2 then
	leveldata.teleporters = 
	{
		teleporterpurple = 
		{
			id1 = "teleporterpurple-1",
			id2 = "teleporterpurple-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterpurple.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterpurple_1.x,
			y1 = lvl.teleporterpurple_1.y,
			rotateAngle1 = -lvl.teleporterpurple_1.rotation,
			x2 = lvl.teleporterpurple_2.x,
			y2 = lvl.teleporterpurple_2.y,
			rotateAngle2 = -lvl.teleporterpurple_2.rotation,
			
		},
		
		teleporterwhite = 
		{
			id1 = "teleporterwhite-1",
			id2 = "teleporterwhite-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterwhite.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterwhite_1.x,
			y1 = lvl.teleporterwhite_1.y,
			rotateAngle1 = -lvl.teleporterwhite_1.rotation,
			x2 = lvl.teleporterwhite_2.x,
			y2 = lvl.teleporterwhite_2.y,
			rotateAngle2 = -lvl.teleporterwhite_2.rotation,
			
		},
		
		teleporteryellow = 
		{
			id1 = "teleporteryellow-1",
			id2 = "teleporteryellow-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporteryellow.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporteryellow_1.x,
			y1 = lvl.teleporteryellow_1.y,
			rotateAngle1 = -lvl.teleporteryellow_1.rotation,
			x2 = lvl.teleporteryellow_2.x,
			y2 = lvl.teleporteryellow_2.y,
			rotateAngle2 = -lvl.teleporteryellow_2.rotation,
			
		},
		
		teleporterblue = 
		{
			id1 = "teleporterblue-1",
			id2 = "teleporterblue-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterblue.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterblue_1.x,
			y1 = lvl.teleporterblue_1.y,
			rotateAngle1 = -lvl.teleporterblue_1.rotation,
			x2 = lvl.teleporterblue_2.x,
			y2 = lvl.teleporterblue_2.y,
			rotateAngle2 = -lvl.teleporterblue_2.rotation,
			
		},
		
		teleporterred = 
		{
			id1 = "teleporterred-1",
			id2 = "teleporterred-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterred.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterred_1.x,
			y1 = lvl.teleporterred_1.y,
			rotateAngle1 = -lvl.teleporterred_1.rotation,
			x2 = lvl.teleporterred_2.x,
			y2 = lvl.teleporterred_2.y,
			rotateAngle2 = -lvl.teleporterred_2.rotation,
			
		},
		
		teleportergreen = 
		{
			id1 = "teleportergreen-1",
			id2 = "teleportergreen-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleportergreen.png",
			width = 15,
			height = 70,
			x1 = lvl.teleportergreen_1.x,
			y1 = lvl.teleportergreen_1.y,
			rotateAngle1 = -lvl.teleportergreen_1.rotation,
			x2 = lvl.teleportergreen_2.x,
			y2 = lvl.teleportergreen_2.y,
			rotateAngle2 = -lvl.teleportergreen_2.rotation,
			
		},
		
		teleporterorange = 
		{
			id1 = "teleporterorange-1",
			id2 = "teleporterorange-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterorange.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterorange_1.x,
			y1 = lvl.teleporterorange_1.y,
			rotateAngle1 = -lvl.teleporterorange_1.rotation,
			x2 = lvl.teleporterorange_2.x,
			y2 = lvl.teleporterorange_2.y,
			rotateAngle2 = -lvl.teleporterorange_2.rotation,
			
		},
	}
	
	elseif lvl.teleporterpurple_1 and lvl.teleporterpurple_2 and lvl.teleporterwhite_1 and lvl.teleporterwhite_2 and lvl.teleporteryellow_1 and lvl.teleporteryellow_2 and lvl.teleporterblue_1 and lvl.teleporterblue_2 and lvl.teleporterred_1 and lvl.teleporterred_2 and lvl.teleportergreen_1 and lvl.teleportergreen_2 then
	leveldata.teleporters = 
	{
		teleporterpurple = 
		{
			id1 = "teleporterpurple-1",
			id2 = "teleporterpurple-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterpurple.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterpurple_1.x,
			y1 = lvl.teleporterpurple_1.y,
			rotateAngle1 = -lvl.teleporterpurple_1.rotation,
			x2 = lvl.teleporterpurple_2.x,
			y2 = lvl.teleporterpurple_2.y,
			rotateAngle2 = -lvl.teleporterpurple_2.rotation,
			
		},
		
		teleporterwhite = 
		{
			id1 = "teleporterwhite-1",
			id2 = "teleporterwhite-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterwhite.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterwhite_1.x,
			y1 = lvl.teleporterwhite_1.y,
			rotateAngle1 = -lvl.teleporterwhite_1.rotation,
			x2 = lvl.teleporterwhite_2.x,
			y2 = lvl.teleporterwhite_2.y,
			rotateAngle2 = -lvl.teleporterwhite_2.rotation,
			
		},
		
		teleporteryellow = 
		{
			id1 = "teleporteryellow-1",
			id2 = "teleporteryellow-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporteryellow.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporteryellow_1.x,
			y1 = lvl.teleporteryellow_1.y,
			rotateAngle1 = -lvl.teleporteryellow_1.rotation,
			x2 = lvl.teleporteryellow_2.x,
			y2 = lvl.teleporteryellow_2.y,
			rotateAngle2 = -lvl.teleporteryellow_2.rotation,
			
		},
		
		teleporterblue = 
		{
			id1 = "teleporterblue-1",
			id2 = "teleporterblue-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterblue.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterblue_1.x,
			y1 = lvl.teleporterblue_1.y,
			rotateAngle1 = -lvl.teleporterblue_1.rotation,
			x2 = lvl.teleporterblue_2.x,
			y2 = lvl.teleporterblue_2.y,
			rotateAngle2 = -lvl.teleporterblue_2.rotation,
			
		},
		
		teleporterred = 
		{
			id1 = "teleporterred-1",
			id2 = "teleporterred-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterred.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterred_1.x,
			y1 = lvl.teleporterred_1.y,
			rotateAngle1 = -lvl.teleporterred_1.rotation,
			x2 = lvl.teleporterred_2.x,
			y2 = lvl.teleporterred_2.y,
			rotateAngle2 = -lvl.teleporterred_2.rotation,
			
		},
		
		teleportergreen = 
		{
			id1 = "teleportergreen-1",
			id2 = "teleportergreen-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleportergreen.png",
			width = 15,
			height = 70,
			x1 = lvl.teleportergreen_1.x,
			y1 = lvl.teleportergreen_1.y,
			rotateAngle1 = -lvl.teleportergreen_1.rotation,
			x2 = lvl.teleportergreen_2.x,
			y2 = lvl.teleportergreen_2.y,
			rotateAngle2 = -lvl.teleportergreen_2.rotation,
			
		},
	}
	
	elseif lvl.teleporterpurple_1 and lvl.teleporterpurple_2 and lvl.teleporterwhite_1 and lvl.teleporterwhite_2 and lvl.teleporteryellow_1 and lvl.teleporteryellow_2 and lvl.teleporterblue_1 and lvl.teleporterblue_2 and lvl.teleporterred_1 and lvl.teleporterred_2 then
	leveldata.teleporters = 
	{
		teleporterpurple = 
		{
			id1 = "teleporterpurple-1",
			id2 = "teleporterpurple-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterpurple.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterpurple_1.x,
			y1 = lvl.teleporterpurple_1.y,
			rotateAngle1 = -lvl.teleporterpurple_1.rotation,
			x2 = lvl.teleporterpurple_2.x,
			y2 = lvl.teleporterpurple_2.y,
			rotateAngle2 = -lvl.teleporterpurple_2.rotation,
			
		},
		
		teleporterwhite = 
		{
			id1 = "teleporterwhite-1",
			id2 = "teleporterwhite-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterwhite.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterwhite_1.x,
			y1 = lvl.teleporterwhite_1.y,
			rotateAngle1 = -lvl.teleporterwhite_1.rotation,
			x2 = lvl.teleporterwhite_2.x,
			y2 = lvl.teleporterwhite_2.y,
			rotateAngle2 = -lvl.teleporterwhite_2.rotation,
			
		},
		
		teleporteryellow = 
		{
			id1 = "teleporteryellow-1",
			id2 = "teleporteryellow-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporteryellow.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporteryellow_1.x,
			y1 = lvl.teleporteryellow_1.y,
			rotateAngle1 = -lvl.teleporteryellow_1.rotation,
			x2 = lvl.teleporteryellow_2.x,
			y2 = lvl.teleporteryellow_2.y,
			rotateAngle2 = -lvl.teleporteryellow_2.rotation,
			
		},
		
		teleporterblue = 
		{
			id1 = "teleporterblue-1",
			id2 = "teleporterblue-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterblue.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterblue_1.x,
			y1 = lvl.teleporterblue_1.y,
			rotateAngle1 = -lvl.teleporterblue_1.rotation,
			x2 = lvl.teleporterblue_2.x,
			y2 = lvl.teleporterblue_2.y,
			rotateAngle2 = -lvl.teleporterblue_2.rotation,
			
		},
		
		teleporterred = 
		{
			id1 = "teleporterred-1",
			id2 = "teleporterred-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterred.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterred_1.x,
			y1 = lvl.teleporterred_1.y,
			rotateAngle1 = -lvl.teleporterred_1.rotation,
			x2 = lvl.teleporterred_2.x,
			y2 = lvl.teleporterred_2.y,
			rotateAngle2 = -lvl.teleporterred_2.rotation,
			
		},
	}
	
	elseif lvl.teleporterpurple_1 and lvl.teleporterpurple_2 and lvl.teleporterwhite_1 and lvl.teleporterwhite_2 and lvl.teleporteryellow_1 and lvl.teleporteryellow_2 and lvl.teleporterblue_1 and lvl.teleporterblue_2 then
	leveldata.teleporters = 
	{
		teleporterpurple = 
		{
			id1 = "teleporterpurple-1",
			id2 = "teleporterpurple-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterpurple.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterpurple_1.x,
			y1 = lvl.teleporterpurple_1.y,
			rotateAngle1 = -lvl.teleporterpurple_1.rotation,
			x2 = lvl.teleporterpurple_2.x,
			y2 = lvl.teleporterpurple_2.y,
			rotateAngle2 = -lvl.teleporterpurple_2.rotation,
			
		},
		
		teleporterwhite = 
		{
			id1 = "teleporterwhite-1",
			id2 = "teleporterwhite-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterwhite.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterwhite_1.x,
			y1 = lvl.teleporterwhite_1.y,
			rotateAngle1 = -lvl.teleporterwhite_1.rotation,
			x2 = lvl.teleporterwhite_2.x,
			y2 = lvl.teleporterwhite_2.y,
			rotateAngle2 = -lvl.teleporterwhite_2.rotation,
			
		},
		
		teleporteryellow = 
		{
			id1 = "teleporteryellow-1",
			id2 = "teleporteryellow-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporteryellow.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporteryellow_1.x,
			y1 = lvl.teleporteryellow_1.y,
			rotateAngle1 = -lvl.teleporteryellow_1.rotation,
			x2 = lvl.teleporteryellow_2.x,
			y2 = lvl.teleporteryellow_2.y,
			rotateAngle2 = -lvl.teleporteryellow_2.rotation,
			
		},
		
		teleporterblue = 
		{
			id1 = "teleporterblue-1",
			id2 = "teleporterblue-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterblue.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterblue_1.x,
			y1 = lvl.teleporterblue_1.y,
			rotateAngle1 = -lvl.teleporterblue_1.rotation,
			x2 = lvl.teleporterblue_2.x,
			y2 = lvl.teleporterblue_2.y,
			rotateAngle2 = -lvl.teleporterblue_2.rotation,
			
		},
	}
	
	elseif lvl.teleporterpurple_1 and lvl.teleporterpurple_2 and lvl.teleporterwhite_1 and lvl.teleporterwhite_2 and lvl.teleporteryellow_1 and lvl.teleporteryellow_2 then
	leveldata.teleporters = 
	{
		teleporterpurple = 
		{
			id1 = "teleporterpurple-1",
			id2 = "teleporterpurple-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterpurple.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterpurple_1.x,
			y1 = lvl.teleporterpurple_1.y,
			rotateAngle1 = -lvl.teleporterpurple_1.rotation,
			x2 = lvl.teleporterpurple_2.x,
			y2 = lvl.teleporterpurple_2.y,
			rotateAngle2 = -lvl.teleporterpurple_2.rotation,
			
		},
		
		teleporterwhite = 
		{
			id1 = "teleporterwhite-1",
			id2 = "teleporterwhite-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterwhite.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterwhite_1.x,
			y1 = lvl.teleporterwhite_1.y,
			rotateAngle1 = -lvl.teleporterwhite_1.rotation,
			x2 = lvl.teleporterwhite_2.x,
			y2 = lvl.teleporterwhite_2.y,
			rotateAngle2 = -lvl.teleporterwhite_2.rotation,
			
		},
		
		teleporteryellow = 
		{
			id1 = "teleporteryellow-1",
			id2 = "teleporteryellow-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporteryellow.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporteryellow_1.x,
			y1 = lvl.teleporteryellow_1.y,
			rotateAngle1 = -lvl.teleporteryellow_1.rotation,
			x2 = lvl.teleporteryellow_2.x,
			y2 = lvl.teleporteryellow_2.y,
			rotateAngle2 = -lvl.teleporteryellow_2.rotation,
			
		},
	}
	
	elseif lvl.teleporterpurple_1 and lvl.teleporterpurple_2 and lvl.teleporterwhite_1 and lvl.teleporterwhite_2 then
	leveldata.teleporters = 
	{
		teleporterpurple = 
		{
			id1 = "teleporterpurple-1",
			id2 = "teleporterpurple-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterpurple.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterpurple_1.x,
			y1 = lvl.teleporterpurple_1.y,
			rotateAngle1 = -lvl.teleporterpurple_1.rotation,
			x2 = lvl.teleporterpurple_2.x,
			y2 = lvl.teleporterpurple_2.y,
			rotateAngle2 = -lvl.teleporterpurple_2.rotation,
			
		},
		
		teleporterwhite = 
		{
			id1 = "teleporterwhite-1",
			id2 = "teleporterwhite-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterwhite.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterwhite_1.x,
			y1 = lvl.teleporterwhite_1.y,
			rotateAngle1 = -lvl.teleporterwhite_1.rotation,
			x2 = lvl.teleporterwhite_2.x,
			y2 = lvl.teleporterwhite_2.y,
			rotateAngle2 = -lvl.teleporterwhite_2.rotation,
			
		},
	}

	elseif lvl.teleporterpurple_1 and lvl.teleporterpurple_2 then
	leveldata.teleporters = 
	{
		teleporter1 = 
		{
			id1 = "teleporter1-1",
			id2 = "teleporter1-2",
			myName1 = "teleporter1",
			myName2 = "teleporter2",
			src = "images/teleporterpurple.png",
			width = 15,
			height = 70,
			x1 = lvl.teleporterpurple_1.x,
			y1 = lvl.teleporterpurple_1.y,
			rotateAngle1 = -lvl.teleporterpurple_1.rotation,
			x2 = lvl.teleporterpurple_2.x,
			y2 = lvl.teleporterpurple_2.y,
			rotateAngle2 = -lvl.teleporterpurple_2.rotation,
			
		},
	}
	else
		leveldata.teleporters = 
		{
			
		}
	end
	
	if lvl.bomb_1 and lvl.bomb_2 and lvl.bomb_3 and lvl.bomb_4 and lvl.bomb_5 and lvl.bomb_6 and lvl.bomb_7 and lvl.bomb_8 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
		bomb2 = 
			{
				id = "bomb2",
				bombIndex = 2,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_2.x,
				y = lvl.bomb_2.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb3 = 
			{
				id = "bomb3",
				bombIndex = 3,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_3.x,
				y = lvl.bomb_3.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb4 = 
			{
				id = "bomb4",
				bombIndex = 4,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_4.x,
				y = lvl.bomb_4.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
			
		bomb5 = 
			{
				id = "bomb5",
				bombIndex = 5,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_5.x,
				y = lvl.bomb_5.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
			
		bomb6 = 
			{
				id = "bomb6",
				bombIndex = 6,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_6.x,
				y = lvl.bomb_6.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb7 = 
			{
				id = "bomb7",
				bombIndex = 7,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_7.x,
				y = lvl.bomb_7.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb8 = 
			{
				id = "bomb8",
				bombIndex = 8,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_8.x,
				y = lvl.bomb_8.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	}
	
	elseif lvl.bomb_1 and lvl.bomb_2 and lvl.bomb_3 and lvl.bomb_4 and lvl.bomb_5 and lvl.bomb_6 and lvl.bomb_7 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
		bomb2 = 
			{
				id = "bomb2",
				bombIndex = 2,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_2.x,
				y = lvl.bomb_2.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb3 = 
			{
				id = "bomb3",
				bombIndex = 3,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_3.x,
				y = lvl.bomb_3.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb4 = 
			{
				id = "bomb4",
				bombIndex = 4,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_4.x,
				y = lvl.bomb_4.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
			
		bomb5 = 
			{
				id = "bomb5",
				bombIndex = 5,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_5.x,
				y = lvl.bomb_5.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
			
		bomb6 = 
			{
				id = "bomb6",
				bombIndex = 6,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_6.x,
				y = lvl.bomb_6.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb7 = 
			{
				id = "bomb7",
				bombIndex = 7,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_7.x,
				y = lvl.bomb_7.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	}
	
	elseif lvl.bomb_1 and lvl.bomb_2 and lvl.bomb_3 and lvl.bomb_4 and lvl.bomb_5 and lvl.bomb_6 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
		bomb2 = 
			{
				id = "bomb2",
				bombIndex = 2,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_2.x,
				y = lvl.bomb_2.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb3 = 
			{
				id = "bomb3",
				bombIndex = 3,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_3.x,
				y = lvl.bomb_3.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb4 = 
			{
				id = "bomb4",
				bombIndex = 4,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_4.x,
				y = lvl.bomb_4.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
			
		bomb5 = 
			{
				id = "bomb5",
				bombIndex = 5,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_5.x,
				y = lvl.bomb_5.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
			
		bomb6 = 
			{
				id = "bomb6",
				bombIndex = 6,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_6.x,
				y = lvl.bomb_6.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	}
	
	elseif lvl.bomb_1 and lvl.bomb_2 and lvl.bomb_3 and lvl.bomb_4 and lvl.bomb_5 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
		bomb2 = 
			{
				id = "bomb2",
				bombIndex = 2,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_2.x,
				y = lvl.bomb_2.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb3 = 
			{
				id = "bomb3",
				bombIndex = 3,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_3.x,
				y = lvl.bomb_3.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb4 = 
			{
				id = "bomb4",
				bombIndex = 4,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_4.x,
				y = lvl.bomb_4.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
			
		bomb5 = 
			{
				id = "bomb5",
				bombIndex = 5,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_5.x,
				y = lvl.bomb_5.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
	}
	
	elseif lvl.bomb_1 and lvl.bomb_2 and lvl.bomb_3 and lvl.bomb_4 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
		bomb2 = 
			{
				id = "bomb2",
				bombIndex = 2,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_2.x,
				y = lvl.bomb_2.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb3 = 
			{
				id = "bomb3",
				bombIndex = 3,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_3.x,
				y = lvl.bomb_3.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb4 = 
			{
				id = "bomb4",
				bombIndex = 4,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_4.x,
				y = lvl.bomb_4.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},	
	}
	
	elseif lvl.bomb_1 and lvl.bomb_2 and lvl.bomb_3 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
		bomb2 = 
			{
				id = "bomb2",
				bombIndex = 2,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_2.x,
				y = lvl.bomb_2.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
			
		bomb3 = 
			{
				id = "bomb3",
				bombIndex = 3,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_3.x,
				y = lvl.bomb_3.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	}
	
	elseif lvl.bomb_1 and lvl.bomb_2 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
		bomb2 = 
			{
				id = "bomb2",
				bombIndex = 2,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_2.x,
				y = lvl.bomb_2.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	}
	
	elseif lvl.bomb_1 then
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/dynamite1.png",
				width = 30,
				height = 30,
				x = lvl.bomb_1.x,
				y = lvl.bomb_1.y,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	
	}
	else
		leveldata.bombs = 
		{
			
		}
	
	end
	
	if lvl.stone_1 and lvl.stone_2 and lvl.stone_3 and lvl.stone_4 then
	leveldata.stones = 
	{

		stone1 = 
		{
			id = "stone1",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_1.x,
			y = lvl.stone_1.y,
			rotate = lvl.stone_1.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		stone2 = 
		{
			id = "stone2",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_2.x,
			y = lvl.stone_2.y,
			rotate = lvl.stone_2.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		stone3 = 
		{
			id = "stone3",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_3.x,
			y = lvl.stone_3.y,
			rotate = lvl.stone_3.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		stone4 = 
		{
			id = "stone4",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_4.x,
			y = lvl.stone_4.y,
			rotate = lvl.stone_4.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	elseif lvl.stone_1 and lvl.stone_2 and lvl.stone_3 then
	leveldata.stones = 
	{

		stone1 = 
		{
			id = "stone1",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_1.x,
			y = lvl.stone_1.y,
			rotate = lvl.stone_1.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		stone2 = 
		{
			id = "stone2",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_2.x,
			y = lvl.stone_2.y,
			rotate = lvl.stone_2.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		stone3 = 
		{
			id = "stone3",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_3.x,
			y = lvl.stone_3.y,
			rotate = lvl.stone_3.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	elseif lvl.stone_1 and lvl.stone_2 then
	leveldata.stones = 
	{

		stone1 = 
		{
			id = "stone1",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_1.x,
			y = lvl.stone_1.y,
			rotate = lvl.stone_1.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		stone2 = 
		{
			id = "stone2",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_2.x,
			y = lvl.stone_2.y,
			rotate = lvl.stone_2.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	elseif lvl.stone_1 then
	leveldata.stones = 
	{

		stone1 = 
		{
			id = "stone1",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = lvl.stone_1.x,
			y = lvl.stone_1.y,
			rotate = lvl.stone_1.rotation,
			myName = "stone",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	else
		leveldata.stones = 
		{

		}
		
	end
	
	if lvl.metal_1 and lvl.metal_2 and lvl.metal_3 and lvl.metal_4 and lvl.metal_5 then
	leveldata.metals = 
	{

		Metal1 = 
		{
			id = "Metal1",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_1.x,
			y = lvl.metal_1.y,
			rotate = lvl.metal_1.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal2 = 
		{
			id = "Metal2",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_2.x,
			y = lvl.metal_2.y,
			rotate = lvl.metal_2.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal3 = 
		{
			id = "Metal3",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_3.x,
			y = lvl.metal_3.y,
			rotate = lvl.metal_3.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal4 = 
		{
			id = "Metal4",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_4.x,
			y = lvl.metal_4.y,
			rotate = lvl.metal_4.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal5 = 
		{
			id = "Metal5",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_5.x,
			y = lvl.metal_5.y,
			rotate = lvl.metal_5.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	elseif lvl.metal_1 and lvl.metal_2 and lvl.metal_3 and lvl.metal_4 then
	leveldata.metals = 
	{

		Metal1 = 
		{
			id = "Metal1",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_1.x,
			y = lvl.metal_1.y,
			rotate = lvl.metal_1.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal2 = 
		{
			id = "Metal2",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_2.x,
			y = lvl.metal_2.y,
			rotate = lvl.metal_2.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal3 = 
		{
			id = "Metal3",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_3.x,
			y = lvl.metal_3.y,
			rotate = lvl.metal_3.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal4 = 
		{
			id = "Metal4",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_4.x,
			y = lvl.metal_4.y,
			rotate = lvl.metal_4.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	elseif lvl.metal_1 and lvl.metal_2 and lvl.metal_3 then
	leveldata.metals = 
	{

		Metal1 = 
		{
			id = "Metal1",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_1.x,
			y = lvl.metal_1.y,
			rotate = lvl.metal_1.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal2 = 
		{
			id = "Metal2",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_2.x,
			y = lvl.metal_2.y,
			rotate = lvl.metal_2.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal3 = 
		{
			id = "Metal3",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_3.x,
			y = lvl.metal_3.y,
			rotate = lvl.metal_3.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	elseif lvl.metal_1 and lvl.metal_2 then
	leveldata.metals = 
	{

		Metal1 = 
		{
			id = "Metal1",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_1.x,
			y = lvl.metal_1.y,
			rotate = lvl.metal_1.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		Metal2 = 
		{
			id = "Metal2",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_2.x,
			y = lvl.metal_2.y,
			rotate = lvl.metal_2.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	elseif lvl.metal_1 then
	leveldata.metals = 
	{

		Metal1 = 
		{
			id = "Metal1",
			src = "images/v_metalpiece.png",
			width = 14,
			height = 98,
			x = lvl.metal_1.x,
			y = lvl.metal_1.y,
			rotate = lvl.metal_1.rotation,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
	}
	
	else
		leveldata.metals = 
		{

		}
		
	end
	
	if lvl.wood_1 and lvl.wood_2 and lvl.wood_3 and lvl.wood_4 and lvl.wood_5 and lvl.wood_6 and lvl.wood_7 and lvl.wood_8 and lvl.wood_9 and lvl.wood_10 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood4 = 
		{
			id = "Wood4",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_4.x,
			y = lvl.wood_4.y,
			rotate = lvl.wood_4.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood5 = 
		{
			id = "Wood5",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_5.x,
			y = lvl.wood_5.y,
			rotate = lvl.wood_5.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood6 = 
		{
			id = "Wood6",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_6.x,
			y = lvl.wood_6.y,
			rotate = lvl.wood_6.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood7 = 
		{
			id = "Wood7",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_7.x,
			y = lvl.wood_7.y,
			rotate = lvl.wood_7.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood8 = 
		{
			id = "Wood8",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_8.x,
			y = lvl.wood_8.y,
			rotate = lvl.wood_8.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood9 = 
		{
			id = "Wood9",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_9.x,
			y = lvl.wood_9.y,
			rotate = lvl.wood_9.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood10 = 
		{
			id = "Wood10",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_10.x,
			y = lvl.wood_10.y,
			rotate = lvl.wood_10.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 and lvl.wood_3 and lvl.wood_4 and lvl.wood_5 and lvl.wood_6 and lvl.wood_7 and lvl.wood_8 and lvl.wood_9 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood4 = 
		{
			id = "Wood4",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_4.x,
			y = lvl.wood_4.y,
			rotate = lvl.wood_4.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood5 = 
		{
			id = "Wood5",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_5.x,
			y = lvl.wood_5.y,
			rotate = lvl.wood_5.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood6 = 
		{
			id = "Wood6",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_6.x,
			y = lvl.wood_6.y,
			rotate = lvl.wood_6.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood7 = 
		{
			id = "Wood7",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_7.x,
			y = lvl.wood_7.y,
			rotate = lvl.wood_7.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood8 = 
		{
			id = "Wood8",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_8.x,
			y = lvl.wood_8.y,
			rotate = lvl.wood_8.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood9 = 
		{
			id = "Wood9",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_9.x,
			y = lvl.wood_9.y,
			rotate = lvl.wood_9.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 and lvl.wood_3 and lvl.wood_4 and lvl.wood_5 and lvl.wood_6 and lvl.wood_7 and lvl.wood_8 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood4 = 
		{
			id = "Wood4",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_4.x,
			y = lvl.wood_4.y,
			rotate = lvl.wood_4.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood5 = 
		{
			id = "Wood5",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_5.x,
			y = lvl.wood_5.y,
			rotate = lvl.wood_5.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood6 = 
		{
			id = "Wood6",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_6.x,
			y = lvl.wood_6.y,
			rotate = lvl.wood_6.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood7 = 
		{
			id = "Wood7",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_7.x,
			y = lvl.wood_7.y,
			rotate = lvl.wood_7.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood8 = 
		{
			id = "Wood8",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_8.x,
			y = lvl.wood_8.y,
			rotate = lvl.wood_8.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 and lvl.wood_3 and lvl.wood_4 and lvl.wood_5 and lvl.wood_6 and lvl.wood_7 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood4 = 
		{
			id = "Wood4",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_4.x,
			y = lvl.wood_4.y,
			rotate = lvl.wood_4.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood5 = 
		{
			id = "Wood5",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_5.x,
			y = lvl.wood_5.y,
			rotate = lvl.wood_5.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood6 = 
		{
			id = "Wood6",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_6.x,
			y = lvl.wood_6.y,
			rotate = lvl.wood_6.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood7 = 
		{
			id = "Wood7",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_7.x,
			y = lvl.wood_7.y,
			rotate = lvl.wood_7.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 and lvl.wood_3 and lvl.wood_4 and lvl.wood_5 and lvl.wood_6 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood4 = 
		{
			id = "Wood4",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_4.x,
			y = lvl.wood_4.y,
			rotate = lvl.wood_4.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood5 = 
		{
			id = "Wood5",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_5.x,
			y = lvl.wood_5.y,
			rotate = lvl.wood_5.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood6 = 
		{
			id = "Wood6",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_6.x,
			y = lvl.wood_6.y,
			rotate = lvl.wood_6.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 and lvl.wood_3 and lvl.wood_4 and lvl.wood_5 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood4 = 
		{
			id = "Wood4",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_4.x,
			y = lvl.wood_4.y,
			rotate = lvl.wood_4.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood5 = 
		{
			id = "Wood5",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_5.x,
			y = lvl.wood_5.y,
			rotate = lvl.wood_5.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 and lvl.wood_3 and lvl.wood_4 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood4 = 
		{
			id = "Wood4",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_4.x,
			y = lvl.wood_4.y,
			rotate = lvl.wood_4.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 and lvl.wood_3 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood3 = 
		{
			id = "Wood3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_3.x,
			y = lvl.wood_3.y,
			rotate = lvl.wood_3.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 and lvl.wood_2 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		Wood2 = 
		{
			id = "Wood2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_2.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_2.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
	
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	elseif lvl.wood_1 then
	leveldata.woods = 
	{

		Wood1 = 
		{
			id = "Wood1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = lvl.wood_1.x,
			y = lvl.wood_1.y,
			rotate = lvl.wood_1.rotation,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
	
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = lvl.switch_1.x,
			y = lvl.switch_1.y,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	else
		leveldata.woods = 
		{

			switch1 = 
			{
				id = "switch1",
				src = "images/button.png",
				width = 30,
				height = 30,
				x = lvl.switch_1.x,
				y = lvl.switch_1.y,
				myName = "switch",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},

		}
		
	end
	
	leveldata.restartLevel = currentLevel
	leveldata.nextLevel = next_level
	
	leveldata.characters = 
	{
		character1 = {
		id = "character",
		myName = "character",
		src1 = "images/character1.png",
		src2 = "images/character1-waiting.png",
		width = 26,
		height = 26,
		},
		
		character2 = {
		id = "robot1",
		myName = "character",
		src1 = "images/character1.png",
		src2 = "images/character1-waiting.png",
		-- src1 = "images/greenpoof.png",
		-- src2 = "images/greenpoof.png",
		width = 26,
		height = 26,
		},
		
		character3 = {
		id = "robot2",
		myName = "character",
		src1 = "images/character1.png",
		src2 = "images/character1-waiting.png",
		-- src1 = "images/exitportal.png",
		-- src2 = "images/exitportal.png",
		width = 26,
		height = 26,
		},
		
		character4 = {
		id = "robot3",
		myName = "character",
		src1 = "images/character1.png",
		src2 = "images/character1-waiting.png",
		-- src1 = "images/orb.png",
		-- src2 = "images/orb.png",
		width = 26,
		height = 26,
		},
		
		
	}
	
	leveldata.backgrounds = 
	{
		lvl.background[1],
		lvl.background[2]
	}
	
	return leveldata

end

