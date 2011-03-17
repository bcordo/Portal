local ui = require("ui")
-- local Particles = require("lib_particle_candy")

-- Hide Status Bar
display.setStatusBar(display.HiddenStatusBar)

-- Import director class
local director = require("director")


-- Create a main group
local mainGroup = display.newGroup()


-- Main function
local function main()
	
	-- Add the group from director class
	mainGroup:insert(director.directorView)
	
	-- Uncomment below code and replace init() arguments with valid ones to enable openfeint
	--[[
	openfeint = require ("openfeint")
	openfeint.init( "App Key Here", "App Secret Here", "Ghosts vs. Monsters", "App ID Here" )
	]]--
	
	director:changeScene( "start_menu" )
	
	return true
end

-- Begin
main()

local fps = require("fps")
local performance = fps.PerformanceOutput.new();
performance.group.x, performance.group.y = display.contentWidth/2,  0;
performance.alpha = 0.6;	



-- local displayGroup = display.newGroup()
--  
-- ---------------------------------------------------------
--  
-- local slideView = require("SimpleSlideView")
--  
-- local slides = {}
--  
-- local svTop = 100
-- local svLeft = 40
-- local svWidth = 400
-- local svHeight = 120
--  
-- -- Items to be displayed
-- slides = {
--     ch1 = "myPhotos1.png",
--     ch2 = "myPhotos2.png",
--     ch3 = "myPhotos3.png",
--     ch4 = "myPhotos4.png",
-- }
--  
-- -- Call back function to use when a selection is made
-- function onSelectSlideViewItem( slideViewItem )
--     print( "Clicked " .. slideViewItem.key )
-- end
--  
-- -- In this example the overlay image should be 480x120 with a window of 400x100 as a cutout
-- slideViewUI = SimpleSlideView:new( svTop, 
--                              svLeft, 
--                              svWidth, 
--                              svHeight, 
--                              slides, 
--                              "myPhotos1.png", 
--                              onSelectSlideViewItem )
--  
-- displayGroup:insert( slideViewUI )