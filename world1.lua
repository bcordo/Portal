-- 
-- Abstract: Portal- Physics Game 
-- Designed and created by Brad G Cordova 
-- http://bcordova.com

-- (This is easiest to play on iPad or other large devices, but should work on all iOS and Android devices)
-- 
-- Version: 1.0
--

--world 1 module

module(..., package.seeall)

require "saveit"



-- Main function - MUST return a display.newGroup()
function new()
	local main_sprt 		= nil
	local bck_shp			= nil
	local slider			= nil
	local slider_sprt		= nil
	local ui = require("ui")
	nLevelsComplete = 30
	
	local saveValue = function( strFilename, strValue )
		-- will save specified value to specified file
		local theFile = strFilename
		local theValue = strValue
		
		local path = system.pathForFile( theFile, system.DocumentsDirectory )
		
		-- io.open opens a file at path. returns nil if no file found
		local file = io.open( path, "w+" )
		if file then
		   -- write game score to the text file
		   file:write( theValue )
		   io.close( file )
		end
	end
	
	function explode(div,str)
	  if (div=='') then return false end
	  local pos,arr = 0,{}
	  -- for each divider found
	  for st,sp in function() return string.find(str,div,pos,true) end do
	    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
	    pos = sp + 1 -- Jump past current divider
	  end
	  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
	  return arr
	end
	
	local function resumeStart()
				local path = system.pathForFile( "portalerData6.txt", system.DocumentsDirectory )                
					local file = io.open( path, "r" )

					if file then
						print("Loading our data...")
						local contents = file:read( "*a" )
						-- Loads our data

						local prevState = explode(", ", contents)

	                        _G.highestLevel1 = prevState[1]
							_G.levelTracker1 = prevState[2]


						io.close( file )

					else
						_G.highestLevel1=1;
						_G.levelTracker1=0;
					end
	end

	-- forward declerations

	----------------------------------------------------------------------------------------------------
	-- init
	----------------------------------------------------------------------------------------------------
	local function init()
		
		resumeStart()
		
		print("highest level var: ", _G.highestLevel1)
		print("level tracker var: ", _G.levelTracker1)

		-- main_sprt
		main_sprt = display.newGroup()
		-- local director = require("director")
		-- main_sprt:insert(director.directorView)

		-- bck
		bck_shp = display.newImage("images/levelselect_background.png")
		-- bck_shp = display.newRect(0,0, display.contentWidth,display.contentHeight)
		bck_shp.x = display.contentWidth/2
		bck_shp.y = display.contentHeight/2
		main_sprt:insert( bck_shp )
		-- bck_shp:setFillColor( 0, 0, 0 )
		
		local backButton = nil
		  local function onBack ( event )
		    if event.phase == "release" and backButton.isActive then
				director:changeScene("world_select", "fade", 0,0,0)
		
				audio.play( tapSound )
		
		    end
		  end	
		
		backButton = ui.newButton{
			defaultSrc = "images/backbtn.png",
			defaultX = 60,
			defaultY = 60,
			overSrc = "images/backbtn-over.png",
			overX = 60,
			overY = 60,
			onEvent = onBack,
			id = "NextButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
			backButton:scale(.7,.7)
			backButton.x = display.contentWidth*.1 
			backButton.y = display.contentHeight*0.88
			-- backButton:rotate(180)
			backButton.isActive = true
			main_sprt:insert(backButton)

		-- slider
		slider = require( "slider" )
		slider:init()
		slider_sprt = slider:getSprite()
		main_sprt:insert( slider_sprt )
		slider_sprt.x = 0.5 * ( display.contentWidth - 256 - 16 )
		slider_sprt.y = 64

		local slide_sprt = nil
		local btn_sprt = nil
		local textInfo_tbl = {}
		local btnInfo_tbl = {}
		index = 1
		

		-- slide 1
		btnInfo_tbl = { "images/level_icon.png" }
		slide_sprt = renderSlide( 1, btnInfo_tbl )
		btn_sprt = renderSlideBtn( 1, 256 )
		-- slider
		slider.addSlide( slide_sprt, btn_sprt )

		-- slide 2
		btnInfo_tbl = { "images/level_icon.png" }
		slide_sprt = renderSlide( 2, btnInfo_tbl )
		btn_sprt = renderSlideBtn( 2, 256 )
		-- slider
		slider.addSlide( slide_sprt, btn_sprt )

		-- slide 3
		btnInfo_tbl = { "images/level_icon.png" }
		slide_sprt = renderSlide( 3, btnInfo_tbl )
		btn_sprt = renderSlideBtn( 3, 256 )
		-- slider
		slider.addSlide( slide_sprt, btn_sprt )
		


	end

	----------------------------------------------------------------------------------------------------
	-- renderSlide
	----------------------------------------------------------------------------------------------------
	function renderSlide( slideIndex, btnInfo_tbl )

		-- slide_sprt
		local slide_sprt = display.newGroup()

		-- bck_sprt
		local bck_shp = display.newRect( 0, 0, 256, 320 )
		slide_sprt:insert( bck_shp )
		bck_shp.alpha = 0.01
	
		
		-- -- text
		-- local this_txt = nil
		-- for i=1, #textInfo_tbl do
		-- 	if ( 1 == i or 6 == i ) then
		-- 		this_txt = display.newText( textInfo_tbl[ i ], 0, 0, native.systemFontBold, 16 )
		-- 	else
		-- 		this_txt = display.newText( textInfo_tbl[ i ], 0, 0, native.systemFont, 16 )
		-- 	end
		-- 	slide_sprt:insert( this_txt )
		-- 	this_txt:setTextColor( 64, 64, 64 )
		-- 	this_txt.x = 0.5 * bck_sprt.contentWidth
		-- 	this_txt.y = 0 + 32 * i
		-- end

		-- btns
		-- local this_btn = nil
		-- for i=1, #btnInfo_tbl do
		-- 	this_btn = display.newImage( "images/" .. btnInfo_tbl[ i ] .. ".png" )
		-- 	slide_sprt:insert( this_btn )
		-- 	this_btn:scale(.21,.21)
		-- 	this_btn.x = display.contentWidth*.3
		-- 	this_btn.y = display.contentHeight *.3
		-- 	this_btn.id = slideIndex
		-- 	this_btn:addEventListener( "tap", tapCb )
		-- end
		
		local crates = {}
		for j = 1,3 do
		for k = 1,4 do
		crates[index] = display.newImage("images/level_icon.png", -90 + (k*70), -115 + (j*70) )
		crates[index]:scale(.5,.5)
		crates[index].id = index
		slide_sprt:insert(crates[index])
		
		if index <= 9 then	
			txt = display.newText( slide_sprt,"level " .. index, -50 + (k*70)-5, -80 + (j*70)+5, "Danube", 6.5 )
		else
			txt = display.newText( slide_sprt,"level " .. index, -50 + (k*70) - 8, -80 + (j*70)+5, "Danube", 6.5 )
		end
			
		
		if index > nLevelsComplete then
			crates[index].alpha = 0
			txt.alpha = 0
		else 
			crates[index]:addEventListener("tap",tapCb)
		end
		
		print(index)
		index = index + 1
		end
		end

		return slide_sprt

	end

	----------------------------------------------------------------------------------------------------
	-- renderSlideBtn
	----------------------------------------------------------------------------------------------------
	function renderSlideBtn( btnIndex, slideWidth )
		
		local numBtns = 3

		-- btn
		local btn_sprt = display.newGroup()
		btn_sprt.x = 12 + 0.5 * slideWidth + (btnIndex - 0.5 * numBtns - 1) * 64*.4
		btn_sprt.y = 0.65 * display.contentHeight
		btn_sprt.id = btnIndex

		-- on
		local btnOn_sprt = display.newImage( "images/btn_slide" .. btnIndex .. ".png" )
		btn_sprt:insert(btnOn_sprt)
		btn_sprt:scale(.4,.4)

		-- off
		local btnOff_sprt = display.newImage( "images/btn_slide" .. btnIndex .. "_off.png" )
		btn_sprt:insert(btnOff_sprt)
		btnOff_sprt:scale(.5,.5)
		btnOff_sprt.isVisible = false
		
		
		return btn_sprt

	end

	----------------------------------------------------------------------------------------------------
	-- tapCb
	----------------------------------------------------------------------------------------------------
	function tapCb( evt )

		local btnId = "1-" .. evt.target.id
		print( "btnId = " .. btnId )
		_G.loadLevel= btnId
		_G.levelTracker1 = evt.target.id 
		director:changeScene("loadlevel", "fade", 0,0,0)

	end



	--##################################################################################################
	-- START
	--##################################################################################################
	init()
	unloadMe = function()
	end
	
	-- MUST return a display.newGroup()
	return main_sprt
end