-- 
-- Abstract: Portal- Physics Game 
-- Designed and created by Brad G Cordova 
-- http://bcordova.com

-- (This is easiest to play on iPad or other large devices, but should work on all iOS and Android devices)
-- 
-- Version: 1.0
--

--renders selected level to screen




module(..., package.seeall)

-- Main function - MUST return a display.newGroup()
function new()
	local localGroup = display.newGroup()
	
	local theTimer
	local loadingImage
	
	local showLoadingScreen = function()
		loadingImage = display.newImageRect( "images/loading.png", 480, 320 )
		loadingImage.x = 240; loadingImage.y = 160
		
		local goToLevel = function()
			
			_G.currentLevel = _G.loadLevel
			if _G.levelTracker1 > tonumber(_G.highestLevel1) then
				_G.highestLevel1 = _G.levelTracker1
			end
			_G.loadLevel = nil
			
			print("Hightest Level Var: ",_G.highestLevel1,"/n")
			print("levelTracker Var: ",_G.levelTracker1,"/n")
			
			director:changeScene( "level", "fade" )
		end
		
		theTimer = timer.performWithDelay( 1000, goToLevel, 1 )
	end
	
	showLoadingScreen()
	
	clean = function()
		if theTimer then timer.cancel( theTimer ); end
		
		if loadingImage then
			loadingImage:removeSelf()
			loadingImage = nil
		end
	end
	
	-- MUST return a display.newGroup()
	return localGroup
end
