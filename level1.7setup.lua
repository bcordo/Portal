module(..., package.seeall)

function getData()
	
	currentLevel = 1.7
	nextLevel = 1.8

	print("this is level " .. currentLevel .. " n setup")	
	
	local leveldata = {}
	
	
	
	leveldata.portal = 
	{
		id = "portal",
		src = "images/portal1.png",
		width = 60,
		height = 40,
		x = 294,
		y = 102,
		myName = "portal",
		bodyType = "static",				
	}
	

	
	leveldata.interactions = 
	{
		
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
		 	x = 101,
			y = 165,
			myName = "blackhole",
			forceFactor = 10
		},
		

	}

	
	leveldata.teleporters = 
	{
		-- teleporter1 = 
		-- {
		-- 	id1 = "teleporter1-1",
		-- 	id2 = "teleporter1-2",
		-- 	myName1 = "teleporter1",
		-- 	myName2 = "teleporter2",
		-- 	src = "images/teleporterpurple.png",
		-- 	width = 15,
		-- 	height = 70,
		-- 	x1 = 50,
		-- 	y1 = 120,
		-- 	rotateAngle1 = 30,
		-- 	x2 = 100,
		-- 	y2 = 200,
		-- 	rotateAngle2 = 30,
		-- 	
		-- },
	}
	leveldata.bombs = 
	{
		-- bomb1 = 
		-- 	{
		-- 		id = "bomb1",
		-- 		bombIndex = 1,
		-- 		src = "images/bomb.png",
		-- 		width = 30,
		-- 		height = 30,
		-- 		x = 70,
		-- 		y = 199,
		-- 		myName = "bomb",
		-- 		bodyType = "static",
		-- 		density = "monsterDensity",
		-- 		bounce=0,
		-- 		friction=0.5,
		-- 	},
	
			-- bomb2 = 
			-- {
			-- 	id = "bomb2",
			-- 	bombIndex = 2,
			-- 	src = "images/dynamite1.png",
			-- 	width = 30,
			-- 	height = 30,
			-- 	x = 150,
			-- 	y = 250,
			-- 	myName = "bomb",
			-- 	bodyType = "static",
			-- 	density = "monsterDensity",
			-- 	bounce=0,
			-- 	friction=0.5,
			-- },
	}
	
	leveldata.objects = 
	{
		metal1 = 
		 { 
			id =  "metal1",
			src = "images/h_metalpiece.png",
			width = 98,
			height = 14,
			x = 50,
			y = 190,
			myName = "metal",
			bodyType = "static",
			density = "monsterDensity",
			bounce = 0,
			friction = 0.5,
		},
		
	
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = 52,
			y = 150,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	leveldata.restartLevel = currentLevel
	leveldata.nextLevel = nextLevel
	
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
		"images/space1.png",
		"images/space1-2.png"
	}
	
	return leveldata

end

