module(..., package.seeall)

function getData()

	print("this is level 1.1 setup")	
	
	local leveldata = {}
	
	
	leveldata.restartLevel = 1.1
	leveldata.nextLevel = 1.2
	
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
	
	leveldata.backgrounds = 
	{
		"images/level1.1_background-2.png",
		"images/level1.1_background-2.png"
	}
	
	leveldata.objects = 
	{
	
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = 350,
			y = 250,
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

	}
	leveldata.bombs = 
	{

			
	}
	

	
	return leveldata

end

