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
		id = "monster2",
		src = "images/portal1.png",
		width = 45,
		height = 30,
		x = 723-420,
		y = 135,
		myName = "portal",
		bodyType = "static",
		density = "monsterDensity",
		bounce=0,
		friction=0.5,
		shape="monsterShape"				
	}
	
	leveldata.backgrounds = 
	{
		"images/space1.png",
		"images/space1-2.png"
	}
	
	leveldata.interactions = 
	{
		-- BlackHole1 = 
		--  { 
		-- 	id =  "BlackHole1",
		-- 	src = "images/blackhole.png",
		-- 	width = 25,
		-- 	height = 25,
		-- 	x = 50,
		-- 	y = 100,
		-- 	myName = "blackhole",
		-- 	forceFactor = 10
		-- },
		
		BlackHole2 = 
		 { 
			id =  "BlackHole2",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
			x = 200,
			y = 200,
			myName = "blackhole",
			forceFactor = 10
		},
		
		WhiteHole1 = 
		 { 
			id =  "WhiteHole1",
			src = "images/whitehole.png",
			width = 25,
			height = 25,
			x = 50,
			y = 100,
			myName = "whitehole",
			forceFactor = 10
		},
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
			x1 = 50,
			y1 = 120,
			rotateAngle1 = 30,
			x2 = 600,
			y2 = 175,
			rotateAngle2 = 30,
			
		},
	}
	leveldata.bombs = 
	{
		bomb1 = 
			{
				id = "bomb1",
				bombIndex = 1,
				src = "images/bomb.png",
				width = 30,
				height = 30,
				x = 70,
				y = 199,
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
				src = "images/bomb.png",
				width = 30,
				height = 30,
				x = 150,
				y = 250,
				myName = "bomb",
				bodyType = "static",
				density = "monsterDensity",
				bounce=0,
				friction=0.5,
			},
	}
	
	leveldata.objects = 
	{
		-- vSlab1 = 
		-- { 
		-- 	id = "vSlab1",
		-- 	src = "images/vertical-stone.png",
		-- 	width = 28,
		-- 	height = 58,
		-- 	x = 575-420,
		-- 	y = 215,
		-- 	myName = "stone",
		-- 	bodyType = "dynamic",
		-- 	density = "stoneDensity",
		-- 	bounce=0,
		-- 	friction=0.5,
		-- 	shape="vSlabShape"
		-- },
		-- 
		-- vSlab2 = 
		-- {
		-- 	id = "vSlab2",
		-- 	src = "images/vertical-stone.png",
		-- 	width = 28,
		-- 	height = 58,
		-- 	x = 575-420,
		-- 	y = 155,
		-- 	myName = "stone",
		-- 	bodyType = "dynamic",
		-- 	density = "stoneDensity",
		-- 	bounce=0,
		-- 	friction=0.5,
		-- 	shape="vSlabShape"			
		-- },
		
		vPlank1 = 
		{
			id = "vPlank1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = 623-420,
			y = 215,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		vPlank2 = 
		{
			id = "vPlank2",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = 723-420,
			y = 215,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},

		vPlank3 = 
		{
			id = "vPlank3",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = 823-420,
			y = 215,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="vPlankShape"				
		},
		
		vSlab3 = 
		{
			id = "vSlab3",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = 871-420,
			y = 215,
			myName = "stone",
			bodyType = "dynamic",
			density = "stoneDensity",
			bounce=0,
			friction=0.5,
			shape="vSlabShape"			
		},		
		
		vSlab4 = 
		{
			id = "vSlab4",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = 871-420,
			y = 155,
			myName = "stone",
			bodyType = "dynamic",
			density = "stoneDensity",
			bounce=0,
			friction=0.5,
			shape="vSlabShape"			
		},	
		
		hPlank1 = 
		{
			id = "hPlank1",
			src = "images/horizontal-wood.png",
			width = 98,
			height = 14,
			x = 674-420,
			y = 162,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="hPlankShape"				
		},		
		
		hPlank2 = 
		{
			id = "hPlank2",
			src = "images/horizontal-wood.png",
			width = 98,
			height = 14,
			x = 772-420,
			y = 162,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="hPlankShape"				
		},	
		
		hPlank4 = 
		{
			id = "hPlank4",
			src = "images/horizontal-wood.png",
			width = 98,
			height = 14,
			x = 723-420,
			y = 143,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="hPlankShape"				
		},			
		
		vSlab5 = 
		{
			id = "vSlab5",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = 685-420,
			y = 128,
			myName = "stone",
			bodyType = "dynamic",
			density = "stoneDensity",
			bounce=0,
			friction=0.5,
			shape="vSlabShape"			
		},			

		vSlab6 = 
		{
			id = "vSlab6",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = 760-420,
			y = 128,
			myName = "stone",
			bodyType = "dynamic",
			density = "stoneDensity",
			bounce=0,
			friction=0.5,
			shape="vSlabShape"			
		},	
		
		hPlank3 = 
		{
			id = "hPlank3",
			src = "images/horizontal-wood.png",
			width = 98,
			height = 14,
			x = 723-420,
			y = 70,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="hPlankShape"				
		},			
	
		
		switch1 = 
		{
			id = "switch1",
			src = "images/button.png",
			width = 30,
			height = 30,
			x = 300,
			y = 250,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
		},
		
		
	}
	
	return leveldata

end

