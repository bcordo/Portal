module(..., package.seeall)



-- Main function - MUST return a display.newGroup()
function new()
	local main_sprt 		= nil
	local bck_shp			= nil
	local slider			= nil
	local slider_sprt		= nil
	local ui = require("ui")
	
	-- local director = require("director")
	-- mainGroup:insert(director.directorView)

	-- forward declerations

	----------------------------------------------------------------------------------------------------
	-- init
	----------------------------------------------------------------------------------------------------
	local function init()

		-- main_sprt
		main_sprt = display.newGroup()

		-- bck
		bck_shp = display.newImage("images/blast_background.png")
		bck_shp.x = display.contentWidth/2
		bck_shp.y = display.contentHeight/2
		main_sprt:insert( bck_shp )
		-- bck_shp:setFillColor( 0, 0, 0 )

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

		-- slide 1
		textInfo_tbl = {}
		btnInfo_tbl = { "level_orb1" }
		slide_sprt = renderSlide( 1, textInfo_tbl, btnInfo_tbl )
		btn_sprt = renderSlideBtn( 1, 256 )
		-- slider
		slider.addSlide( slide_sprt, btn_sprt )

		-- slide 2
		textInfo_tbl = {}
		btnInfo_tbl = {"level_orb2"}
		slide_sprt = renderSlide( 2, textInfo_tbl, btnInfo_tbl )
		btn_sprt = renderSlideBtn( 2, 256 )
		-- slider
		slider.addSlide( slide_sprt, btn_sprt )

		-- slide 3
		textInfo_tbl = {}
		btnInfo_tbl = {"level_orb3"}
		slide_sprt = renderSlide( 3, textInfo_tbl, btnInfo_tbl )
		btn_sprt = renderSlideBtn( 3, 256 )
		-- slider
		slider.addSlide( slide_sprt, btn_sprt )
		

	end

	----------------------------------------------------------------------------------------------------
	-- renderSlide
	----------------------------------------------------------------------------------------------------
	function renderSlide( slideIndex, textInfo_tbl, btnInfo_tbl )

		-- slide_sprt
		local slide_sprt = display.newGroup()

		-- bck_sprt
		local bck_sprt = display.newImage("images/blackhole.png")
		bck_sprt:scale(.8,.8)
		bck_sprt.alpha = 0.01
		slide_sprt:insert( bck_sprt )
		
		
		bck_sprt.x = display.contentWidth*.3
		bck_sprt.y = display.contentHeight *.3
		
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
		local this_btn = nil
		for i=1, #btnInfo_tbl do
			this_btn = display.newImage( "images/" .. btnInfo_tbl[ i ] .. ".png" )
			slide_sprt:insert( this_btn )
			this_btn:scale(.21,.21)
			this_btn.x = display.contentWidth*.3
			this_btn.y = display.contentHeight *.3
			this_btn.id = slideIndex
			this_btn:addEventListener( "tap", tapCb )
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

		local btnId = evt.target.id
		print( "btnId = " .. btnId )

		if ( 1 == btnId ) then
			_G.loadLevel=1
			director:changeScene("loadlevel", "fade", 0,0,0)
		elseif ( 2 == btnId ) then
			_G.loadLevel=2
			director:changeScene("loadlevel", "fade", 0,0,0)
		elseif ( 3 == btnId ) then
			_G.loadLevel=2
			director:changeScene("loadlevel", "fade", 0,0,0)
		end

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