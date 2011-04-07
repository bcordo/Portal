module(..., package.seeall)

function getData()

	print("this is level 1.2 setup")	
	
	local leveldata = {}
	
	
	leveldata.restartLevel = 1.2
	leveldata.nextLevel = 1.3
	
	leveldata.backgrounds = 
	{
		"images/level1.1_background-2.png",
		"images/level1.1_background-2.png"
	}
	
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
	
	leveldata.portal = 
	{ 
		id =  "portal",
		src = "images/portal1.png",
		width = 112,
		height = 77,
		x = 300,
		y = 100,
		myName = "mages/portal1",
		bodyType = "dynamic",
		density = "mages/portal1Density",
		bounce = 0,
		friction = 0.5,
		shape = "images/portal1Shape"
	}
	

	
	leveldata.objects = 
	{
	
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = 350+420 + 50,
			y = 180 - 50 ,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
		
	}
	
	leveldata.interactions = 
	{

	}

	
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
			x1 = 350,
			y1 = 250,
			rotateAngle1 = 0,
			x2 = 350+250,
			y2 = 250,
			rotateAngle2 = 30,
			
		},

	}
	leveldata.bombs = 
	{

			
	}
	

	
	return leveldata

end

