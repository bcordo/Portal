-- 
-- Abstract: Portal- Physics Game 
-- Designed and created by Brad G Cordova 
-- http://bcordova.com

-- (This is easiest to play on iPad or other large devices, but should work on all iOS and Android devices)
-- 
-- Version: 1.0
--

--main file. 

local ui = require("ui")
-- LOAD PARTICLE LIB
Particles	= require("lib_particle_candy")
FXLibrary	= require("lib_particleEffects_01")

-- INITIALIZE THE FX LIBRARY. THIS PRELOADS IMAGES FOR BETTER 
-- PERFORMANCE & CREATES THE PARTICLE TYPES USED.
-- ON LEVEL END, CALL FXLibrary.CleanUp() TO REMOVE PRELOADED IMAGES
-- FXLibrary.Initialize()
-- Hide Status Bar
display.setStatusBar(display.HiddenStatusBar)

director = require( "director" )
local mainGroup = display.newGroup()       
mainGroup:insert( director.directorView )


-- Main function
local function main()

	
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

-- local fps = require("fps")
-- local performance = fps.PerformanceOutput.new();
-- performance.group.x, performance.group.y = display.contentWidth/2,  0;
-- performance.alpha = 0.6;	




