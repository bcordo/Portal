module(..., package.seeall)

function getData()

	print("this is level 1 setup")	
	
	local leveldata = {}
	
	leveldata.monsterCount=2
	
	leveldata.restartLevel = 1
	leveldata.nextLevel = 2
	
	leveldata.portal = 
	{
		id = "monster2",
		src = "images/monster.png",
		width = 26,
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
		"images/background1.png",
		"images/background2.png"
	}
	
	leveldata.interactions = 
	{
		BlackHole1 = 
		 { 
			id =  "BlackHole1",
			src = "images/blackhole.png",
			width = 25,
			height = 25,
			x = 50,
			y = 100,
			myName = "blackhole",
			forceFactor = 10
		},
		
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
			src = "images/whitehole.png",
			width = 30,
			height = 30,
			x = 300,
			y = 250,
			myName = "switch",
			bodyType = "static",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
			shape="monsterShape"				
		},
		
	}
	
	return leveldata

end

