module(..., package.seeall)

function getData()

	print("this is level 2 setup")	
	
	local leveldata = {}
	
	leveldata.monsterCount=2
	
	leveldata.restartLevel = 2
	leveldata.nextLevel = 1
	
	leveldata.backgrounds = 
	{
		"images/background1.png",
		"images/background2.png"
	}
	
	leveldata.objects = 
	{
		vSlab1 = 
		{ 
			id = "vSlab1",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = 575,
			y = 215,
			myName = "stone",
			bodyType = "dynamic",
			density = "stoneDensity",
			bounce=0,
			friction=0.5,
			shape="vSlabShape"
		},
		
		vSlab2 = 
		{
			id = "vSlab2",
			src = "images/vertical-stone.png",
			width = 28,
			height = 58,
			x = 575,
			y = 155,
			myName = "stone",
			bodyType = "dynamic",
			density = "stoneDensity",
			bounce=0,
			friction=0.5,
			shape="vSlabShape"			
		},
		
		vPlank1 = 
		{
			id = "vPlank1",
			src = "images/vertical-wood.png",
			width = 14,
			height = 98,
			x = 623,
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
			x = 723,
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
			x = 823,
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
			x = 871,
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
			x = 871,
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
			x = 674,
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
			x = 772,
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
			x = 723,
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
			x = 685,
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
			x = 760,
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
			x = 723,
			y = 70,
			myName = "wood",
			bodyType = "dynamic",
			density = "woodDensity",
			bounce=0,
			friction=0.5,
			shape="hPlankShape"				
		},			

		monster1 = 
		{
			id = "monster1",
			src = "images/monster.png",
			width = 26,
			height = 30,
			x = 772,
			y = 235,
			myName = "monster",
			bodyType = "dynamic",
			density = "monsterDensity",
			bounce=0,
			friction=0.5,
			shape="monsterShape"				
		},
		
		
		
	}
	

	return leveldata
	

end

