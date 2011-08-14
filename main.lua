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
require "saveit"
_G.filesavepathname = "portalerData7.txt"

-- INITIALIZE THE FX LIBRARY. THIS PRELOADS IMAGES FOR BETTER 
-- PERFORMANCE & CREATES THE PARTICLE TYPES USED.
-- ON LEVEL END, CALL FXLibrary.CleanUp() TO REMOVE PRELOADED IMAGES
-- FXLibrary.Initialize()
-- Hide Status Bar
display.setStatusBar(display.HiddenStatusBar)

director = require( "director" )
local mainGroup = display.newGroup()       
mainGroup:insert( director.directorView )

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
			local path = system.pathForFile( _G.filesavepathname, system.DocumentsDirectory )                
				local file = io.open( path, "r" )

				if file then
					print("Loading our data...")
					local contents = file:read( "*a" )
					-- Loads our data

					local prevState = explode(", ", contents)

                        _G.highestLevel1 = 10--prevState[1]
						_G.levelTracker1 = 10--prevState[2]


					io.close( file )

				else
					_G.highestLevel1=10;
					_G.levelTracker1=0;
				end
end

local onSystem = function( event )

if event.type == "applicationExit" then
	--Saves data
	local path = system.pathForFile( _G.filesavepathname, system.DocumentsDirectory )                
	local file = io.open( path, "w+b" )
	-- Creates the file where we save our data
	
	file:write( _G.highestLevel1..", ".._G.levelTracker1)          
	io.close( file )
	if system.getInfo( "environment" ) == "device" then
		-- prevents iOS 4+ multi-tasking crashes
		os.exit()
	end
end
end

-- Main function
local function main()
	
	Runtime:addEventListener( "system", onSystem )

	resumeStart()
	
	-- Uncomment below code and replace init() arguments with valid ones to enable openfeint
	--[[
	openfeint = require ("openfeint")
	openfeint.init( "App Key Here", "App Secret Here", "Ghosts vs. Monsters", "App ID Here" )
	]]--
	
	director:changeScene( "start_menu" )
	
	clean = function()
		Runtime:removeEventListener( "system", onSystem )
	end
	
	return true
end

-- Begin
main()

-- local fps = require("fps")
-- local performance = fps.PerformanceOutput.new();
-- performance.group.x, performance.group.y = display.contentWidth/2,  0;
-- performance.alpha = 0.6;	




