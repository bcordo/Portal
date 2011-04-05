-- 
-- Abstract: characters Vs Monsters sample project 
-- Designed and created by Jonathan and Biffy Beebe of Beebe Games exclusively for Ansca, Inc.
-- http://beebegamesonline.appspot.com/

-- (This is easiest to play on iPad or other large devices, but should work on all iOS and Android devices)
-- 
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.


module(..., package.seeall)




--***********************************************************************************************--
--***********************************************************************************************--

-- LEVEL MODULE

-- To create a new level, change "MODULE-SPECIFIC VARIABLES" (below) and also the
-- createLevel() function. Everything else should be identical between level modules.

--***********************************************************************************************--
--***********************************************************************************************--


-- Main function - MUST return a display.newGroup()
function new()


	local levelsetup = require("level".._G.currentLevel.."setup")
	local leveldata = levelsetup.getData()

	local hudGroup = display.newGroup()
	
	local gameGroup = display.newGroup()
	gameGroup.x = 0
	
	local trailGroup = display.newGroup()
	local dotTimer
	
		
	local levelGroup = display.newGroup()
	

	
	-- EXTERNAL MODULES / LIBRARIES
	

	local movieclip = require( "movieclip" )
	local ui = require("ui")
	--local facebook = require "facebook"
	local physics = require("physics") 
	


	
	local mCeil = math.ceil
	local mAtan2 = math.atan2
	local mPi = math.pi
	local mSqrt = math.sqrt
	
	-- OBJECTS
	
	local backgroundImage1
	local backgroundImage2
	local clouds1
	local clouds2
	local clouds3
	local clouds4
	local groundLight1
	local groundObject1
	local groundObject2
	local shotOrb
	local shotArrow
	local blastGlow
	local characterObject = {}
	local poofObject
	local greenPoof; local poofTween

	--New UI Elements
	local portalObject
	local switch
	local pendulum
	local balloon
	local fulcrum
	local bomb
	local whitehole
	local blackhole
	local gear
	
	
	local life1; local life2; local life3; local life4
	local scoreText; local bestScoreText
	local continueText; local continueTimer
	local pauseMenuBtn; local pauseRestartBtn; local pauseBtn; local pauseShade
	
	-- VARIABLES
	
	local gameIsActive = false
	local waitingForNewRound
	local restartTimer
	local characterTween
	local screenPosition = "left"	--> "left" or "right"
	local canSwipe = true
	local swipeTween
	local gameLives = 4
	local gameScore = 0
	local bestScore
	local ThroughExitPortal = false
	local portalOpen = false
	characterBoolean = 1

	

	
	-- MODULE-SPECIFIC VARIABLES
	local backgroundFilename1 = leveldata.backgrounds[1]
	local backgroundFilename2 = leveldata.backgrounds[2]

	
	
	-- LEVEL SETTINGS
	
	local restartLevel  -- = 1,2,3
	local nextLevel
	
	local properties = {}
	
	properties.woodDensity = .7
	properties.vPlankShape = { -6,-48, 6,-48, 6,48, -6,48 }
	properties.hPlankShape = { -48,-6, 48,-6, 48,6, -48,6 }
	properties.stoneDensity = 1.3
	properties.vSlabShape = { -12,-26, 12,-26, 12,26, -12,26 }
	properties.tombDensity = 1.4
	properties.tombShape = { -18,-21, 18,-21, 18,21, -18,21 }
	properties.portalDensity = 1.0
	properties.portalShape = { -12,-13, 12,-13, 12,13, -12,13 }
	
	
	-- AUDIO
	local explosionSound = media.newEventSound( "soundfx/explosion.mp3" )
	local portalOpenSound = audio.loadSound("soundfx/portalopen.wav")
	local portalExitSound = audio.loadSound("soundfx/portal.wav")
	-- local telporterSound = audio.loadSound("soundfx/teleporter.wav")
	local tapSound = audio.loadSound( "soundfx/tapsound.wav" )
	local blastOffSound = audio.loadSound( "soundfx/blastoff.wav" )
	local characterPoofSound = audio.loadSound( "soundfx/characterpoof.wav" )
	local monsterPoofSound = audio.loadSound( "soundfx/monsterpoof.wav" )
	local impactSound = audio.loadSound( "soundfx/impact.wav" )
	local weeSound = audio.loadSound( "soundfx/wee.wav" )
	local newRoundSound = audio.loadSound( "soundfx/entersound.wav" )
	local youWinSound = audio.loadSound( "soundfx/win.wav" )
	local youLoseSound = audio.loadSound( "soundfx/lose.wav" )
	
	--***************************************************

	-- saveValue() --> used for saving high score, etc.
	
	--***************************************************
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
	
	--***************************************************

	-- loadValue() --> load saved value from file (returns loaded value as string)
	
	--***************************************************
	local loadValue = function( strFilename )
		-- will load specified file, or create new file if it doesn't exist
		
		local theFile = strFilename
		
		local path = system.pathForFile( theFile, system.DocumentsDirectory )
		
		-- io.open opens a file at path. returns nil if no file found
		local file = io.open( path, "r" )
		if file then
		   -- read all contents of file into a string
		   local contents = file:read( "*a" )
		   io.close( file )
		   return contents
		else
		   -- create file b/c it doesn't exist yet
		   file = io.open( path, "w" )
		   file:write( "0" )
		   io.close( file )
		   return "0"
		end
	end
	
	local startNewRound = function()
		createcharacter()
		if characterObject then
			
			local activateRound = function()
				
				canSwipe = true
				waitingForNewRound = false
						
				if restartTimer then
					timer.cancel( restartTimer )
				end
				
				groundLight1:toFront()
				-- groundObject1:toFront()
				-- groundObject2:toFront()
				characterObject.x = 52; --characterObject.y = 195
				characterObject.y = 320;
				characterObject:stopAtFrame( 1 )
				characterObject.rotation = 0
				characterObject.isVisible = true
				characterObject.isBodyActive = true
				characterObject.isBullet = true
				
				audio.play( newRoundSound )
				
				local characterLoaded = function()
					
					gameIsActive = true
					characterObject.inAir = false
					characterObject.isHit = false
					characterObject:toFront()
					
					characterObject.bodyType = "static"
					
					-- Show the pause button
					pauseBtn.isVisible = true
					pauseBtn.isActive = true
					
					-- START up and down animation
					if characterTween then
						transition.cancel( characterTween )
					end
					
					local function characterAnimation()
						local animUp = function()
							if characterObject.inAir or shotOrb.isVisible then
								transition.cancel( characterTween )
							else
								characterTween = transition.to( characterObject, { time=375, y=250, onComplete=characterAnimation })
							end
						end
						
						if characterObject.inAir or shotOrb.isVisible then
							transition.cancel( characterTween )
						else
							characterTween = transition.to( characterObject, { time=375, y=260, onComplete=animUp })
						end
					end
					
					characterTween = transition.to( characterObject, { time=375, y=250, onComplete=characterAnimation })
					
					-- END up and down animation
				end
				
				transition.to( characterObject, { time=1000, y=255, onComplete=characterLoaded } )
			end
			
			-- reset camera
			if gameGroup.x < 0 then
				transition.to( gameGroup, { time=1000, x=0, transition=easing.inOutExpo, onComplete=activateRound } )
			else
				gameGroup.x = 0
				activateRound()
			end
		end
	end
	
	local comma_value = function(amount)
		local formatted = amount
			while true do  
			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
			if (k==0) then
		  		break
			end
	  	end
		
		return formatted
	end
	
	local setScore = function( scoreNum )
		local newScore = scoreNum
		
		gameScore = newScore
		
		if gameScore < 0 then gameScore = 0; end
		
		scoreText.text = comma_value(gameScore)
		scoreText.xScale = 0.5; scoreText.yScale = 0.5	--> for clear retina display text
		scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 15
		scoreText.y = 20
	end
	
	local callGameOver = function( isWin )
		
		local isWin = isWin
		
		if isWin == "yes" then
			audio.play( youWinSound )
		else
			audio.play( youLoseSound )
		end
		
		gameIsActive = false	--> temporarily disable gameplay touches, enterFrame listener, etc.
		physics.pause()
		
		-- Make sure pause button is hidden/inactive
		pauseBtn.isVisible = false
		pauseBtn.isActive = false
		
		if continueTimer then timer.cancel( continueTimer ); end
		continueText.isVisible = false
		
		-- Create all game over objects and insert them into the HUD group
		
		-- SHADE
		local shadeRect = display.newRect( 0, 0, 480, 320 )
		shadeRect:setFillColor( 0, 0, 0, 255 )
		shadeRect.alpha = 0
		
		
		-- GAME OVER WINDOW
		local gameOverDisplay
		
		if isWin == "yes" then
			gameOverDisplay = display.newImageRect( "images/youwin.png", 390, 154 )
			
			-- Give score bonus depending on how many characters left
			local characterBonus = gameLives * 20000
			local newScore = gameScore + characterBonus
			setScore( newScore )
			
		else
			gameOverDisplay = display.newImageRect( "images/youlose.png", 390, 154 )
		end
		
		gameOverDisplay.x = 240; gameOverDisplay.y = 165
		gameOverDisplay.alpha = 0
		
		-- MENU BUTTON
		local onMenuTouch = function( event )
			if event.phase == "release" then
				audio.play( tapSound )
				director:changeScene( "world_select" )
			end
		end
		
		local menuBtn = ui.newButton{
			defaultSrc = "images/menubtn.png",
			defaultX = 60,
			defaultY = 60,
			overSrc = "images/menubtn-over.png",
			overX = 60,
			overY = 60,
			onEvent = onMenuTouch,
			id = "MenuButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		if isWin == "yes" then
			menuBtn.x = 227
		else
			menuBtn.x = 266
		end
		
		menuBtn.y = 186
		menuBtn.alpha = 0
		
		-- RESTART BUTTON
		local onRestartTouch = function( event )
			if event.phase == "release" then
				audio.play( tapSound )
				--local theModule = "load" .. restartModule
				
				_G.loadLevel = restartLevel
				local theModule = "loadlevel"
				
				director:changeScene( theModule )
			end
		end
		
		local restartBtn = ui.newButton{
			defaultSrc = "images/restartbtn.png",
			defaultX = 60,
			defaultY = 60,
			overSrc = "images/restartbtn-over.png",
			overX = 60,
			overY = 60,
			onEvent = onRestartTouch,
			id = "RestartButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		restartBtn.x = menuBtn.x + 72; restartBtn.y = 186
		restartBtn.alpha = 0
		
		-- NEXT BUTTON
		local onNextTouch = function( event )
			if event.phase == "release" then
				audio.play( tapSound )
				_G.loadLevel = nextLevel
				local theModule = "loadlevel" 
				director:changeScene( theModule )
			end
		end
		
		local nextBtn = ui.newButton{
			defaultSrc = "images/nextlevelbtn.png",
			defaultX = 60,
			defaultY = 60,
			overSrc = "images/nextlevelbtn-over.png",
			overX = 60,
			overY = 60,
			onEvent = onNextTouch,
			id = "NextButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		nextBtn.x = restartBtn.x + 72; nextBtn.y = 186
		nextBtn.alpha = 0
		if isWin ~= "yes" then nextBtn.isVisible = false; end
		
		-- OPENFEINT BUTTON
		local onOFTouch = function( event )
			if event.phase == "release" then
				audio.play( tapSound )
				-- Launch OpenFeint Leaderboards Panel:
				--openfeint.launchDashboard("leaderboards")
				
			end
		end
		
		-- local ofBtn = ui.newButton{
		-- 			defaultSrc = "images/openfeintbtn.png",
		-- 			defaultX = 168,
		-- 			defaultY = 40,
		-- 			overSrc = "images/openfeintbtn-over.png",
		-- 			overX = 168,
		-- 			overY = 40,
		-- 			onEvent = onOFTouch,
		-- 			id = "OpenfeintButton",
		-- 			text = "",
		-- 			font = "Helvetica",
		-- 			textColor = { 255, 255, 255, 255 },
		-- 			size = 16,
		-- 			emboss = false
		-- 		}
		-- 		
		-- 		ofBtn.x = 168; ofBtn.y = 110
		-- 		ofBtn.alpha = 0
		-- 		
		-- 		local fbBtn
		-- 		
		-- 		-- FACEBOOK BUTTON
		-- 		local onFBTouch = function( event )
		-- 			if event.phase == "release" and fbBtn.isActive then
		-- 				audio.play( tapSound )
		-- 				
		-- 				-- Code to Post Status to Facebook (don't forget the 'require "facebook"' line at top of module)
		-- 				-- The Code below is fully functional as long as you replace the fbAppID var with valid app ID.
		-- 				
		-- 				--[[
		-- 				local fbAppID = "1234567890"	--> (string) Your FB App ID from facebook developer's panel
		-- 				
		-- 				local facebookListener = function( event )
		-- 					if ( "session" == event.type ) then
		-- 						-- upon successful login, update their status
		-- 						if ( "login" == event.phase ) then
		-- 							
		-- 							local scoreToPost = comma_value(gameScore)
		-- 							
		-- 							local statusUpdate = "just scored a " .. gameScore .. " on characters v.s Monsters!"
		-- 							
		-- 							facebook.request( "me/feed", "POST", {
		-- 								message=statusUpdate,
		-- 								name="Download characters vs. Monsters to Compete with Me!",
		-- 								caption="characters vs. Monsters - Sample app created with the Corona SDK by Ansca Mobile.",
		-- 								link="http://itunes.apple.com/us/app/your-app-name/id382456881?mt=8",
		-- 								picture="http://www.yoursite.com/link-to-90x90-image.png" } )
		-- 						end
		-- 					end
		-- 				end
		-- 				
		-- 				facebook.login( fbAppID, facebookListener, { "publish_stream" } )
		-- 				]]--
		-- 			end
		-- 		end
		-- 		
		-- 		fbBtn = ui.newButton{
		-- 			defaultSrc = "images/facebookbtn.png",
		-- 			defaultX = 302,
		-- 			defaultY = 40,
		-- 			overSrc = "images/facebookbtn-over.png",
		-- 			overX = 302,
		-- 			overY = 40,
		-- 			onEvent = onFBTouch,
		-- 			id = "FacebookButton",
		-- 			text = "",
		-- 			font = "Helvetica",
		-- 			textColor = { 255, 255, 255, 255 },
		-- 			size = 16,
		-- 			emboss = false
		-- 		}
		-- 		
		-- 		fbBtn.x = 240; fbBtn.y = 220
		-- 		fbBtn.alpha = 0
		-- 
		-- if isWin == "yes" then
		-- 	fbBtn.isVisible = true
		-- 	fbBtn.isActive = true
		-- else
		-- 	fbBtn.isVisible = false
		-- 	fbBtn.isActive = false
		-- end
		
		-- INSERT ALL ITEMS INTO GROUP
		hudGroup:insert( shadeRect )
		-- hudGroup:insert( ofBtn )
		-- hudGroup:insert( fbBtn )
		hudGroup:insert( gameOverDisplay )
		hudGroup:insert( menuBtn )
		hudGroup:insert( restartBtn )
		if isWin == "yes" then hudGroup:insert( nextBtn ); end
		
		-- FADE IN ALL GAME OVER ELEMENTS
		transition.to( shadeRect, { time=200, alpha=0.65 } )
		transition.to( gameOverDisplay, { time=500, alpha=1 } )
		transition.to( menuBtn, { time=500, alpha=1 } )
		transition.to( restartBtn, { time=500, alpha=1 } )
		if isWin == "yes" then transition.to( nextBtn, { time=500, alpha=1 } ); end
		-- transition.to( ofBtn, { time=500, alpha=1, y=68, transition=easing.inOutExpo } )
		-- 		if isWin == "yes" then transition.to( fbBtn, { time=500, alpha=1, y=255, transition=easing.inOutExpo } ); end
		
		-- MAKE SURE SCORE TEXT IS VISIBLE (if player won the round)
		if isWin == "yes" then
			scoreText.isVisible = false
			local oldScoreText = scoreText.text
			scoreText.text = "Score: " .. oldScoreText
			scoreText.xScale = 0.5; scoreText.yScale = 0.5	--> for clear retina display text
			scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 30
			scoreText.y = 30
			scoreText:toFront()
			timer.performWithDelay( 1000, function() scoreText.isVisible = true; end, 1 )
		else
			scoreText:removeSelf()
			scoreText = nil
		end
		
		-- Update Best Score
		if gameScore > bestScore then
			bestScore = gameScore
			local bestScoreFilename = restartLevel .. ".data"
			saveValue( bestScoreFilename, tostring(bestScore) )
		end
		
		-- MAKE SURE BEST SCORE TEXT IS VISIBLE
		bestScoreText = display.newText( "0", 10, 300, "Helvetica-Bold", 32 )
		bestScoreText:setTextColor( 228, 228, 228, 255 )	--> white
		bestScoreText.text = "Best Score For This Level: " .. comma_value( bestScore )
		bestScoreText.xScale = 0.5; bestScoreText.yScale = 0.5	--> for clear retina display text
		bestScoreText.x = (bestScoreText.contentWidth * 0.5) + 15
		bestScoreText.y = 304
		
		hudGroup:insert( bestScoreText )
	end
	
	local callNewRound = function( shouldPoof, instantPoof )
		local shouldPoof = shouldPoof
		local instantPoof = instantPoof
		local isGameOver = false
		
		if blastGlow.isVisible then
			blastGlow.isVisible = false
		end
		
		if gameLives >= 1 then
			gameLives = gameLives - 1
			
			if gameLives == 3 then
				life4.alpha = 0.3
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 2 then
				life4.alpha = 0.3
				life3.alpha = 0.3
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 1 then
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 0.3
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 0 then
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 0.3
				life1.alpha = 0.3
				isGameOver = true
			end
		elseif gameLives < 0 then
			gameLives = 0
			life4.alpha = 0.3
			life3.alpha = 0.3
			life2.alpha = 0.3
			life1.alpha = 0.3
			isGameOver = true
		else
			life4.alpha = 0.3
			life3.alpha = 0.3
			life2.alpha = 0.3
			life1.alpha = 0.3
			isGameOver = true
		end	
		
		if shouldPoof and characterObject.isExited ~= true then
			
			if characterObject.isExited == true then
				characterObject.isVisible = false
				shouldPoof = false
				instantPoof = "no"
			end
					
			local poofThecharacter = function()
				local theDelay = 300
				
				-- Make character disappear and show "poof" animation
				characterObject:setLinearVelocity( 0, 0 )
				characterObject.bodyType = "static"
				characterObject.isVisible = false
				characterObject.isBodyActive = false
				characterObject.isBullet = false
				characterObject.rotation = 0
				
				-- Poof code below --
				audio.play( characterPoofSound )
				poofObject.x = characterObject.x; poofObject.y = characterObject.y
				poofObject.alpha = 0
				poofObject.isVisible = true
				
				if characterObject.isExited ~= true then
					local fadePoof = function()
						transition.to( poofObject, { time=2000, alpha=0 } )	
					end
					transition.to( poofObject, { time=10, alpha=1.0, onComplete=fadePoof } )
				end
				
				-- Move camera to far right to see effect
				-- if gameGroup.x > -480 then
				-- 					local camTween = transition.to( gameGroup, { time=500, x=-480 } )
				-- 				end
				
				local continueBlink = function()
					 local startBlinking = function()
					 	if continueText.isVisible then
					 		continueText.isVisible = false
					 	else
					 		continueText.isVisible = true
					 	end
					 end
					 
					 continueTimer = timer.performWithDelay( 350, startBlinking, 0 )
				end
				
				restartTimer = timer.performWithDelay( theDelay, function()
					waitingForNewRound = true;
					continueBlink();
				end, 1 )
				
				--[[
				if not isGameOver then
					restartTimer = timer.performWithDelay( theDelay, function() waitingForNewRound = true; end, 1 )
				else
					if monsterCount > 0 then
						restartTimer = timer.performWithDelay( theDelay, function() callGameOver( "no" ); end, 1 )
					else
						restartTimer = timer.performWithDelay( 3000, function() callGameOver( "yes" ); end, 1 )
					end
				end
				]]--
			end
			
			if instantPoof == "yes" then
				local poofTimer = timer.performWithDelay( 10, poofThecharacter, 1 ) --makes the character last longer 
			else
				local poofTimer = timer.performWithDelay( 1500, poofThecharacter, 1 )
			end
		else
			
			characterObject:setLinearVelocity( 0, 0 )
			characterObject.bodyType = "static"
			characterObject.isVisible = false
			characterObject.isBodyActive = false
			characterObject.isBullet = false
			characterObject.rotation = 0
			
			--restartTimer = timer.performWithDelay( 300, startNewRound, 1 )
			
			if not isGameOver then
				restartTimer = timer.performWithDelay( 300, startNewRound, 1 )
			else
				if ThroughExitPortal == false then
					restartTimer = timer.performWithDelay( 300, function() callGameOver( "no" ); end, 1 )
				else
					restartTimer = timer.performWithDelay( 300, function() callGameOver( "yes" ); end, 1 )
				end
			end
		end
	end
	
	local drawBackground = function()
		-- Background gets drawn in this order: backdrop, clouds, trees, red glow
		
		-- BACKDROP
		backgroundImage1 = display.newImageRect( backgroundFilename1, 480, 320 )
		backgroundImage1:setReferencePoint( display.CenterLeftReferencePoint )
		backgroundImage1.x = 0; backgroundImage1.y = 160
		
		backgroundImage2 = display.newImageRect( backgroundFilename2, 480, 320 )
		backgroundImage2:setReferencePoint( display.CenterLeftReferencePoint )
		backgroundImage2.x = 480; backgroundImage2.y = 160
		
		gameGroup:insert( backgroundImage1 )
		gameGroup:insert( backgroundImage2 )
		
		-- -- CLOUDS
		-- 	clouds1 = display.newImageRect( "images/clouds-left.png", 480, 320 )
		-- 	clouds1.x = 240; clouds1.y = 160
		-- 	
		-- 	clouds2 = display.newImageRect( "images/clouds-right.png", 480, 320 )
		-- 	clouds2.x = 720; clouds2.y = 160
		-- 	
		-- 	clouds3 = display.newImageRect( "images/clouds-left.png", 480, 320 )
		-- 	clouds3.x = 1200; clouds3.y = 160
		-- 	
		-- 	clouds4 = display.newImageRect( "images/clouds-right.png", 480, 320 )
		-- 	clouds4.x = 1680; clouds4.y = 160
		-- 	
		-- 	gameGroup:insert( clouds1 )
		-- 	gameGroup:insert( clouds2 )
		-- 	gameGroup:insert( clouds3 )
		-- 	gameGroup:insert( clouds4 )
		
		-- -- TREES
		-- 	local treesLeft = display.newImageRect( "trees-left.png", 480, 320 )
		-- 	treesLeft.x = 240; treesLeft.y = 160
		-- 	
		-- 	local treesRight = display.newImageRect( "trees-right.png", 480, 320 )
		-- 	treesRight.x = 720; treesRight.y = 160
		-- 	
		-- 	gameGroup:insert( treesLeft )
		-- 	gameGroup:insert( treesRight )
		
		-- RED GLOW
		--[[
		local redGlow = display.newImageRect( "redglow.png", 480, 320 )
		redGlow.x = 725; redGlow.y = 160
		redGlow.alpha = 0.5
		
		gameGroup:insert( redGlow )
		]]--
	end
	
	local drawHUD = function()
		-- TWO BLACK RECTANGLES AT TOP AND BOTTOM (for those viewing from iPad)
		local topRect = display.newRect( 0, -160, 480, 160 )
		topRect:setFillColor( 0, 0, 0, 255 )
		
		local bottomRect = display.newRect( 0, 320, 480, 160 )
		bottomRect:setFillColor( 0, 0, 0, 255 )
		
		hudGroup:insert( topRect )
		hudGroup: insert( bottomRect )
		
		-- LIVES DISPLAY
		life1 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life1.x = 20; life1.y = 18
		
		life2 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life2.x = life1.x + 25; life2.y = 18
		
		life3 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life3.x = life2.x + 25; life3.y = 18
		
		life4 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life4.x = life3.x + 25; life4.y = 18
		
		hudGroup:insert( life1 )
		hudGroup:insert( life2 )
		hudGroup:insert( life3 )
		hudGroup:insert( life4 )
		
		-- SCORE DISPLAY
		scoreText = display.newText( "0", 470, 22, "Helvetica-Bold", 52 )
		scoreText:setTextColor( 255, 255, 255, 255 )	--> white
		scoreText.text = gameScore
		scoreText.xScale = 0.5; scoreText.yScale = 0.5	--> for clear retina display text
		scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 15
		scoreText.y = 20
		
		hudGroup:insert( scoreText )
		
		-- TAP TO CONTINUE DISPLAY
		continueText = display.newText( "TAP TO CONTINUE", 240, 18, "Helvetica", 36 )
		continueText:setTextColor( 249, 203, 64, 255 )
		continueText.xScale = 0.5; continueText.yScale = 0.5
		continueText.x = 240; continueText.y = 18
		continueText.isVisible = false
		
		hudGroup:insert( continueText )
		
		-- PAUSE BUTTON
		local onPauseTouch = function( event )
			if event.phase == "release" and pauseBtn.isActive then
				audio.play( tapSound )
				
				-- Pause the game
				
				if gameIsActive then
				
					gameIsActive = false
					physics.pause()
					
					-- SHADE
					if not shadeRect then
						shadeRect = display.newRect( 0, 0, 480, 320 )
						shadeRect:setFillColor( 0, 0, 0, 255 )
						hudGroup:insert( shadeRect )
					end
					shadeRect.alpha = 0.5
					
					-- SHOW MENU BUTTON
					if pauseMenuBtn then
						pauseMenuBtn.isVisible = true
						pauseMenuBtn.isActive = true
						pauseMenuBtn:toFront()
					end
					
					-- SHOW RESTART BUTTON
					if pauseRestartBtn then
						pauseRestartBtn.isVisible = true
						pauseRestartBtn.isActive = true
						pauseRestartBtn:toFront()
					end
					
					pauseBtn:toFront()
					
					
					
					-- STOP character ANIMATION
					if characterTween then
						transition.cancel( characterTween )
					end
				else
					
					if shadeRect then
						shadeRect:removeSelf()
						shadeRect = nil
					end
					
					if pauseMenuBtn then
						pauseMenuBtn.isVisible = false
						pauseMenuBtn.isActive = false
					end
					
					if pauseRestartBtn then
						pauseRestartBtn.isVisible = false
						pauseRestartBtn.isActive = false
					end
					
					gameIsActive = true
					physics.start()
					
					-- START character animation back up
					if characterTween then
						transition.cancel( characterTween )
					end
					
					local function characterAnimation()
						local animUp = function()
							if characterObject.inAir or shotOrb.isVisible then
								transition.cancel( characterTween )
							else
								characterTween = transition.to( characterObject, { time=375, y=250, onComplete=characterAnimation })
							end
						end
						
						if characterObject.inAir or shotOrb.isVisible then
							transition.cancel( characterTween )
						else
							characterTween = transition.to( characterObject, { time=375, y=260, onComplete=animUp })
						end
					end
					
					characterTween = transition.to( characterObject, { time=375, y=250, onComplete=characterAnimation })
				end
			end
		end
		
		pauseBtn = ui.newButton{
			defaultSrc = "images/pausebtn.png",
			defaultX = 44,
			defaultY = 44,
			overSrc = "images/pausebtn-over.png",
			overX = 44,
			overY = 44,
			onEvent = onPauseTouch,
			id = "PauseButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		pauseBtn.x = 442; pauseBtn.y = 288
		pauseBtn.isVisible = false
		pauseBtn.isActive = false
		
		hudGroup:insert( pauseBtn )
		
		-- MENU BUTTON (on Pause Display)
		local onMenuPauseTouch = function( event )
			if event.phase == "release" and pauseMenuBtn.isActive then
				
				audio.play( tapSound )
				
				local onComplete = function ( event )
					if "clicked" == event.action then
						local i = event.index
						if i == 2 then
							-- Player click 'Cancel'; do nothing, just exit the dialog
						elseif i == 1 then
							-- Player clicked Yes, go to main menu
							director:changeScene( "world_select" )
						end
					end
				end
				
				-- Show alert with two buttons
				local alert = native.showAlert( "Are You Sure?", "Your current game will end.", 
														{ "Yes", "Cancel" }, onComplete )
			end
		end
		
		pauseMenuBtn = ui.newButton{
			defaultSrc = "images/pausemenubtn.png",
			defaultX = 44,
			defaultY = 44,
			overSrc = "images/pausemenubtn-over.png",
			overX = 44,
			overY = 44,
			onEvent = onMenuPauseTouch,
			id = "PauseMenuButton",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		pauseMenuBtn.x = 38; pauseMenuBtn.y = 288
		pauseMenuBtn.isVisible = false
		pauseMenuBtn.isActive = false
		
		hudGroup:insert( pauseMenuBtn )
		
		
		-- RESTART BUTTON (on Pause Display)
		local onRestartPauseTouch = function( event )
			if event.phase == "release" and pauseRestartBtn.isActive then
				audio.play( tapSound )
				--local theModule = "load" .. restartModule
				
				_G.loadLevel = restartLevel
				local theModule = "loadlevel"
				
				director:changeScene( theModule )
			end
		end
		
		pauseRestartBtn = ui.newButton{
			defaultSrc = "images/pauserestartbtn.png",
			defaultX = 44,
			defaultY = 44,
			overSrc = "images/pauserestartbtn-over.png",
			overX = 44,
			overY = 44,
			onEvent = onRestartPauseTouch,
			id = "RestartPauseTouch",
			text = "",
			font = "Helvetica",
			textColor = { 255, 255, 255, 255 },
			size = 16,
			emboss = false
		}
		
		pauseRestartBtn.x = 85; pauseRestartBtn.y = 288
		pauseRestartBtn.isVisible = false
		pauseRestartBtn.isActive = false
		
		hudGroup:insert( pauseRestartBtn )
	end
	
	local createGround = function()
		groundLight1 = display.newImageRect( "images/groundlight.png", 228, 156 )
		groundLight1.x = 50; groundLight1.y = 282
		groundLight1:scale(.5,.5)
		
		-- groundObject1 = display.newImageRect( "images/ground1.png", 480, 37 )
		-- groundObject1:setReferencePoint( display.BottomLeftReferencePoint )
		-- groundObject1.x = 0; groundObject1.y = 320
		-- --groundObject1:scale(1,.5)
		-- 
		-- groundObject2 = display.newImageRect( "images/ground2.png", 480, 37 )
		-- groundObject2:setReferencePoint( display.BottomLeftReferencePoint )
		-- groundObject2.x = 480; groundObject2.y = 320
		-- --groundObject2:scale(1,.5)
		-- 
		-- groundObject1.myName = "ground"
		-- groundObject2.myName = "ground"
		
		-- local groundShape = { -240,-10, 240,-10, 240,10, -240,10 }
		-- physics.addBody( groundObject1, "static", { density=1.0, bounce=0, friction=0.5, shape=groundShape } )
		-- physics.addBody( groundObject2, "static", { density=1.0, bounce=0, friction=0.5, shape=groundShape } )
		
		gameGroup:insert( groundLight1 )
		-- gameGroup:insert( groundObject1 )
		-- gameGroup:insert( groundObject2 )
	end
	
	local createShotOrb = function()
		shotOrb = display.newImageRect( "images/orb.png", 96, 96 )
		shotOrb.xScale = 1.0; shotOrb.yScale = 1.0
		shotOrb.isVisible = false
		
		gameGroup:insert( shotOrb )
	end
	
	-- local createPortal = function()
	-- 	portal = display.newImageRect( "images/monster.png", 723-420, 135 )
	-- 	portal.xScale = 1.0; portal.yScale = 1.0
	-- 	portal.isVisible = false
	-- 	
	-- 	gameGroup:insert( portal )
	-- end
	
	-- local createPortal = function()
	-- 	portal = display.newImageRect(leveldata.portal.src, leveldata.portal.width, leveldata.portal.height)
	-- 	portal.x = leveldata.portal.x
	-- 	portal.y = leveldata.portal.y
	-- 	portal.myName = leveldata.portal.myName
	-- 	print("This is the portal name:" .. portal.x)
	-- 	portalObject = physics.addBody(portal, leveldata.portal.bodyType, {density=properties[leveldata.portal.density], bounce=leveldata.portal.bounce, friction = leveldata.portal.friction, shape=properties[leveldata.portal.shape]})
	-- 	gameGroup:insert(portal)
	-- 	portal.isVisible = false
	-- 	print("Portal Invisible!!!!")
	-- end
	
	createcharacter = function()
		
		local oncharacterCollision = function( self, event )
			if event.phase == "began" then
				
				if event.other.myName ~= "portal" then
				audio.play( impactSound )
				end
				
				
				if event.other.myName == "switch" then
						portalOpen = true
						audio.play( portalOpenSound )
				end
				
				if event.other.myName == "portal" and portalOpen == true then
						characterObject.isExited = true
						print("isExited = true")	
				end

				if event.other.myName ~= "portal" and event.other.myName ~= "teleporter1" and event.other.myName ~= "teleporter2" then
					
					if characterObject.isHit == false then
				
						if blastGlow.isVisible then
							blastGlow.isVisible = false
						end
					
					
						if dotTimer then timer.cancel( dotTimer ); end
						characterObject.isHit = true

					
						if event.other.myName == "wood" or event.other.myName == "stone" then
							callNewRound( true, "yes" )
							characterBoolean = characterBoolean + 1
						else
							callNewRound( true, "no" )
							characterBoolean = characterBoolean + 1
						end
					
						local newScore = gameScore + 500
						setScore( newScore )
				
					elseif characterObject.isHit then
						return true
					end
				end
			end
		end
		
		
		-- first, create the transparent arrow that shows up 
		shotArrow = display.newImageRect( "images/arrow.png", 240, 240 )
		shotArrow.x = 52; shotArrow.y = 255
		shotArrow.isVisible = false
		
		gameGroup:insert( shotArrow )
		
		i = 1
		characterTable = {}
		for key,data in pairs(leveldata.characters) do 
			characterTable[ i ] = data
			-- print(characterTable[ i ].src1)
			i = i + 1
		end
	
		print(characterBoolean)
		characterObject = movieclip.newAnim({ characterTable[characterBoolean].src2, characterTable[characterBoolean].src1 }, characterTable[characterBoolean].width, characterTable[characterBoolean].height )
		characterObject.x = -500; characterObject.y = -500
		characterObject.isVisible = false
		
		characterObject.isReady = false	--> Not "flingable" until touched.
		characterObject.inAir = false
		characterObject.isHit = false
		characterObject.isBullet = true
		characterObject.trailNum = 0
		
		characterObject.radius = 12
		characterObject.myName = "character"
		physics.addBody( characterObject, "static", { density=1.0, bounce=0.1, friction=0.15, radius=movieclip.newAnimradius } )
		characterObject.rotation = 0
		characterObject:stopAtFrame( 1 )
		
		-- START up and down animation
		
		--characterTween = transition.to( characterObject, { time=200, y=192, onComplete=characterAnimation })
		
		-- END up and down animation
		
		-- Set up collisions
		characterObject.collision = oncharacterCollision
		characterObject:addEventListener( "collision", characterObject )
		
		
		
		-- Create the Blast Glow
		blastGlow = display.newImageRect( "images/blastglow.png", 54, 54 )
		blastGlow.x = characterObject.x; blastGlow.y = characterObject.y
		blastGlow.isVisible = false
		
		-- Create Poof Objects
		poofObject = display.newImageRect( "images/poof.png", 80, 70 )
		poofObject.alpha = 1.0
		poofObject.isVisible = false
		
		greenPoof = display.newImageRect( "images/poof.png", 80, 70 )
		greenPoof.alpha = 1.0
		greenPoof.isVisible = false
		
		-- Insert objects into main group
		gameGroup:insert( trailGroup )
		gameGroup:insert( blastGlow )
		gameGroup:insert( characterObject )
		gameGroup:insert( poofObject )
		gameGroup:insert( greenPoof )
		
	end
	
	local function BombBlastWave( self, event )
	        if ( event.phase == "began" and self.myName == "circle" ) then
				forceConstant = 0
				local forcex = forceConstant*(event.other.x-self.x)
				local forcey = forceConstant*(event.other.y-self.y)
				if(forcex < 0) then
					forcex = 0-(80 + forcex)-12
				else
					forcex = 80 - forcex+12
				end
				event.other:applyLinearImpulse( forcex, forcey, self.x, self.y )
				if(math.abs(forcex) > 60 or math.abs(forcey) > 60) then
					local explosion = display.newImage( "images/explosion.png", event.other.x, event.other.y )
					event.other:removeSelf()
					local function removeExplosion( event )
						explosion:removeSelf()
					end

					timer.performWithDelay( 50,  removeExplosion)
				end

	        end
	end

	local function onBombTouch ( self, event )
			
			if(event.phase == "began" and self.bombArmedQ == "yes") then
				print("bomb id " .. self.bombIndex)
				local circle = ""
				local explosion = ""
				local function blast( event )
					media.playEventSound( explosionSound )
				    circle = display.newCircle( self.x, self.y, 100 )
					explosion = display.newImage( "images/explosion.png", self.x, self.y )
					self:removeSelf()
					circle:setFillColor(0,0,0, 0)
					physics.addBody( circle, "static", {isSensor = true} )
					circle.myName = "circle"
					circle.collision = BombBlastWave
					circle:addEventListener( "collision", circle )
				 end

				 local function removeStuff( event )
					circle:removeSelf()
					explosion:removeSelf()
				 end
				 timer.performWithDelay(10, blast )
				 timer.performWithDelay(110, removeStuff)
			end
		self.bombArmedQ = "no"
	end
	
	
	local onExitPortalTouch = function( self, event )
		if self.isHit == false and portalOpen == true and event.other.myName == "character" then
			audio.play( portalExitSound )
			self.isHit = true
			print( "Exited Portal!! " )
			self.isVisible = false
			self.isBodyActive = false
			self.isBullet = false
			characterObject:setLinearVelocity( 0, 0 )
			characterObject.isVisible = false
			characterObject.isBullet = false
			characterObject.trailNum = 0
			
			-- Poof code below --
			if poofTween then transition.cancel( poofTween ); end
			
			greenPoof.x = self.x; greenPoof.y = self.y
			greenPoof.alpha = 0
			greenPoof.isVisible = true
			
			local fadePoof = function()
				transition.to( greenPoof, { time=500, alpha=0 } )	
			end
			poofTween = transition.to( greenPoof, { time=50, alpha=1.0, onComplete=fadePoof } )
			
			ThroughExitPortal = true
			
			self.parent:remove( self )
			self = nil
			
			local newScore = gameScore + mCeil(5000)
			setScore( newScore )
		end
	end
	
	onTeleporter1Touch = function( self, event )
		print("teleporter 1 touch")
		if event.other.myName == "character" then
			-- audio.play( telporterSound )
			needToTeleport1 = true
			needToTeleport2 = false
			c2x = self.xo
			c2y = self.yo
			rotateAngle1 = self.rotations 
			rotateAngle2 = self.rotationo
			print("rotations angles " .. self.rotations .. " " .. self.rotationo)
			-- characterObject.x = 100
			-- characterObject.y = 200
			
		end
	end
	
	onTeleporter2Touch = function( self, event )
		if event.other.myName == "character" then
			-- audio.play( telporterSound )
			needToTeleport1 = false
			needToTeleport2 = true
			c1x = self.xo
			c1y = self.yo
			rotateAngle2 = self.rotations 
			rotateAngle1 = self.rotationo 
			print("rotations angles " .. rotateAngle1 .. " " .. rotateAngle2)
			-- characterObject.x = 100
			-- characterObject.y = 200
			
		end
	end
	
	
	local onScreenTouch = function( event )
		if gameIsActive then
			if event.phase == "began" and characterObject.inAir == false and event.xStart > 50 and event.xStart < 60 and event.yStart > 245 and event.yStart < 265 and screenPosition == "left" then
				--
				--
				--
				--
				--
				transition.cancel( characterTween )
				characterObject.y = 255
				characterObject.isReady = true
				shotOrb.isVisible = true
				shotOrb.alpha = 0.75
				shotOrb.x = characterObject.x; shotOrb.y = characterObject.y
				shotOrb.xScale = 0.1; shotOrb.yScale = 0.1
				
				
				shotArrow.isVisible = true
			
			elseif event.phase == "began" and waitingForNewRound then
				
				waitingForNewRound = false
				if continueTimer then timer.cancel( continueTimer ); end
				continueText.isVisible = false
				
				if gameLives < 1 then
					-- GAME OVER
					if ThroughExitPortal == true then
						callGameOver( "yes" )
					else
						callGameOver( "no" )
					end
				elseif ThroughExitPortal == true and gameLives >= 1 then
					
					callGameOver( "yes" )
				else
					startNewRound()
				end
			
			elseif event.phase == "began" and waitingForNewRound == false then
				
				if continueTimer then timer.cancel( continueTimer ); end
				continueText.isVisible = false
				
				if gameLives < 1 then
					-- GAME OVER
					if ThroughExitPortal == true then
						callGameOver( "yes" )
					else
						callGameOver( "no" )
					end
				elseif ThroughExitPortal == true and gameLives >= 1 then
					
					callGameOver( "yes" )
				end
				
			elseif event.phase == "ended" and characterObject.isReady == false and characterObject.inAir == false and canSwipe == true then
				
				local leftRight
				
				if event.xStart > event.x then
					leftRight = "left"
				elseif event.xStart < event.x then
					leftRight = "right"
				end
				
				-- Swipe to view other end of the screen
				if leftRight == "left" and screenPosition == "left" and event.xStart > 180 then
					-- Swiped game screen to the left
					print( "Swiped left!" )
					canSwipe = false
					
					local switchPosition = function()
						screenPosition = "right"
						local swipeTimer = timer.performWithDelay( 200, function() canSwipe = true; end, 1 )
					end
					
					if swipeTween then
						transition.cancel( swipeTween )
					end
					
					if (event.xStart - event.x) >= 100 then
						swipeTween = transition.to( gameGroup, { time=700, x=-480, onComplete=switchPosition } )
					else
						swipeTween = transition.to( gameGroup, { time=100, x=0, onComplete=function() canSwipe = true; end } )
					end
					
				elseif leftRight == "right" and screenPosition == "right" then
					-- Swiped screen to the right
					print( "Swiped right!" )
					canSwipe = false
					
					local switchPosition = function()
						screenPosition = "left"
						local swipeTimer = timer.performWithDelay( 200, function() canSwipe = true; end, 1 )
					end
					
					if swipeTween then
						transition.cancel( swipeTween )
					end
					
					if (event.x - event.xStart) >= 100 then
						swipeTween = transition.to( gameGroup, { time=700, x=0, onComplete=switchPosition } )
					else
						swipeTween = transition.to( gameGroup, { time=100, x=-480, onComplete=function() canSwipe = true; end } )
					end
					
				end
				
			elseif event.phase == "ended" and characterObject.isReady then
				-- Finger lifted from screen; fling the Roly Poly!
				
				local flingNow = function()
					-- handle the shot orb and disable screen swiping
					transition.cancel( characterTween )
					shotOrb.isVisible = false
					shotArrow.isVisible = false
					canSwipe = false
					
					local x = event.x
					local y = event.y
					local xForce = (1 * (x - characterObject.x)) * 3.5	--> 2.75
					local yForce = (1 * (y - characterObject.y)) * 3.5	--> 2.75
					
					audio.play( weeSound )
					
					characterObject:stopAtFrame( 2 )
					characterObject.bodyType = "dynamic"
					characterObject:applyForce( xForce, yForce, characterObject.x, characterObject.y )
					characterObject.isReady = false
					characterObject.inAir = true
					
					
					-- START TRAILING DOTS BLOCK
					local i
					
					-- First, delete previous trail
					for i = trailGroup.numChildren,1,-1 do
						local child = trailGroup[i]
						child.parent:remove( child )
						child = nil
					end
					
					local startDotCreation = function()
						local createDot = function()
							local trailDot
							
							if characterObject.trailNum == 0 then
								trailDot = display.newCircle( gameGroup, characterObject.x, characterObject.y, 2.5 )
							else
								trailDot = display.newCircle( gameGroup, characterObject.x, characterObject.y, 1.5 )
							end
							trailDot:setFillColor( 255, 255, 255, 255 )
							trailDot.alpha = 1.0
							
							trailGroup:insert( trailDot )
							--gameGroup:insert( trailGroup )
							
							
							if characterObject.trailNum == 0 then
								characterObject.trailNum = 1
							else
								characterObject.trailNum = 0
							end
						end
						
						dotTimer = timer.performWithDelay( 50, createDot, 50 )
					end
					
					local startDotTimer = timer.performWithDelay( 50, startDotCreation, 1 )
					-- END TRAILING DOTS BLOCK
					
					-- Show the blast glow
					blastGlow.x = characterObject.x
					blastGlow.y = characterObject.y
					blastGlow.isVisible = true
				end
				
				transition.to( shotOrb, { time=175, xScale=0.1, yScale=0.1, onComplete=flingNow } )
				
				audio.play( blastOffSound )
				
				
				-- -- Make sure pause button is hidden/inactive
				-- pauseBtn.isVisible = false
				-- pauseBtn.isActive = false
			end
			
			if shotOrb.isVisible == true then
				
				local xOffset = characterObject.x
				local yOffset = characterObject.y
				
				-- Formula math.sqrt( ((event.y - yOffset) ^ 2) + ((event.x - xOffset) ^ 2) )
				local distanceBetween = mCeil(mSqrt( ((event.y - yOffset) ^ 2) + ((event.x - xOffset) ^ 2) ))
				
				shotOrb.xScale = -distanceBetween * 0.027
				shotOrb.yScale = -distanceBetween * 0.027
				
				-- Formula: 90 + (math.atan2(y2 - y1, x2 - x1) * 180 / PI)
				local angleBetween = mCeil(mAtan2( (event.y - yOffset), (event.x - xOffset) ) * 180 / mPi) + 90
				
				characterObject.rotation = angleBetween --+ 180
				shotArrow.rotation = characterObject.rotation
			end
			
			if canSwipe == true then
				
				if screenPosition == "left" then
					-- Swipe left to go right
					if event.xStart > 180 then
						gameGroup.x = event.x - event.xStart
						
						if gameGroup.x > 0 then
							gameGroup.x = 0
							canSwipe = true
						end
					end
						
				elseif screenPosition == "right" then
					-- Swipe right to go to the left
					gameGroup.x = (event.x - event.xStart) - 480
					
					if gameGroup.x < -480 then
						gameGroup.x = -480
						canSwipe = true
					end
				end
			end
		end
	end
	
	-- Main enterFrame Listener
	local gameLoop = function()
		if gameIsActive then
			
			-- Create Interactions
			for key,data in pairs(leveldata.interactions) do 
				if(data.myName=="blackhole") then

					dx = data.x - characterObject.x
					dy = data.y - characterObject.y
					r = math.sqrt(dx^2 + dy^2)
					forceFactor = data.forceFactor
					fx = forceFactor*dx/r; fy = forceFactor*dy/r
					characterObject:applyForce( fx, fy, characterObject.x, characterObject.y )

				end
				
			end

			
			for key,data in pairs(leveldata.interactions) do 
				if(data.myName=="whitehole") then

					dx = data.x - characterObject.x
					dy = data.y - characterObject.y
					r = math.sqrt(dx^2 + dy^2)
					forceFactor = data.forceFactor
					fx = forceFactor*dx/(r^2); fy = forceFactor*dy/(r^2)
					characterObject:applyForce( -fx, -fy, characterObject.x, characterObject.y )

				end
				
			end
			
			
			--Teleporter Function
			if(needToTeleport1 == true and needToTeleport2 ~= true) then
				local cvx,cvy = characterObject:getLinearVelocity()
				local cx = characterObject.x
				local cy = characterObject.y
				local vTotal = math.sqrt(cvx^2 + cvy^2)
				local cvxPrime = cvx*math.cos((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1)) ) + cvy*math.sin((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1)))
				local cvyPrime = -cvx*math.sin((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1))) + cvy*math.cos((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1)))
				local cxPrime = cx*math.cos((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1))) + cy*math.sin((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1)))
				local cyPrime = -cx*math.sin((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1))) + cy*math.cos((mPi/180)*(math.abs(rotateAngle2 - rotateAngle1)))
				
				characterObject:setLinearVelocity(vTotal*math.cos((mPi/180)*rotateAngle2),-vTotal*math.sin((mPi/180)*rotateAngle2))
				characterObject.x = c2x + (math.cos((mPi/180)*rotateAngle2)*(2*teleWidth + 20)) 
				characterObject.y = c2y - (math.sin((mPi/180)*rotateAngle2)*(2*teleWidth + 20))
				
				-- characterObject:setLinearVelocity(cvxPrime,cvyPrime)
				-- characterObject.x = teleporter2.x + (cvxPrime/(math.abs(cyPrime)))*(2*teleporter2.width + 20)
				-- characterObject.y = teleporter2.y + (cvyPrime/(math.abs(cyPrime)))*(2*teleporter2.width + 20)
				
				needToTeleport1 = false
			end
			
			if(needToTeleport2 == true and needToTeleport1 ~= true) then
					local cvx,cvy = characterObject:getLinearVelocity()
					local cx = characterObject.x
					local cy = characterObject.y
					local vTotal = math.sqrt(cvx^2 + cvy^2)
					local cvxPrime = cvx*math.cos((mPi/180)*(rotateAngle1 - rotateAngle2)) + cvy*math.sin((mPi/180)*(rotateAngle1 - rotateAngle2))
					local cvyPrime = -cvx*math.sin((mPi/180)*(rotateAngle1 - rotateAngle2)) + cvy*math.cos((mPi/180)*(rotateAngle1 - rotateAngle2))
					local cxPrime = cx*math.cos((mPi/180)*(rotateAngle1 - rotateAngle2)) + cy*math.sin((mPi/180)*(rotateAngle1 - rotateAngle2))
					local cyPrime = -cx*math.sin((mPi/180)*(rotateAngle1 - rotateAngle2)) + cy*math.cos((mPi/180)*(rotateAngle1 - rotateAngle2))
			
					characterObject:setLinearVelocity(vTotal*math.cos((mPi/180)*rotateAngle1),-vTotal*math.sin((mPi/180)*rotateAngle1))
					characterObject.x = c1x + (math.cos((mPi/180)*rotateAngle1)*(2*teleWidth + 20)) 
					characterObject.y = c1y - (math.sin((mPi/180)*rotateAngle1)*(2*teleWidth + 20) ) 
					
					-- characterObject:setLinearVelocity(cvxPrime,cvyPrime)
					-- characterObject.x = teleporter1.x + (cvxPrime/(math.abs(cyPrime)))*(2*teleporter1.width + 20)
					-- characterObject.y = teleporter1.y + (cyPrime/(math.abs(cyPrime)))*(2*teleporter1.width + 20)
			
					needToTeleport2 = false
			end
		
			-- CAMERA CONTROL
			if characterObject.x > 240 and characterObject.x < 720 and not waitingForNewRound then
				gameGroup.x = -characterObject.x + 240
			end
			
			
			-- MAKE SURE character's Rotation Doesn't Go Past Limits
			if characterObject.inAir then
				if characterObject.rotation < -45 then
					characterObject.rotation = -45
				elseif characterObject.rotation > 30 then
					characterObject.rotation = 30
				end
			end
			
			-- Make sure Blast Glow's Rotation is Equal to the character's
			if blastGlow.isVisible then
				blastGlow.rotation = characterObject.rotation
				blastGlow.x = characterObject.x - 10
				blastGlow.y = characterObject.y + 3
			end
			
			if portalOpen == true then
				portal.isVisible = true
			end

			
			-- CHECK IF character GOES PAST SCREEN
			if characterObject.isHit == false and characterObject.x >= 1800 then
				characterObject.isHit = true
				if dotTimer then timer.cancel( dotTimer ); end
				callNewRound( false, "no" )
				characterBoolean = characterBoolean + 1
			end
			
			if characterObject.isHit == false and characterObject.x < -800 then
				if dotTimer then timer.cancel( dotTimer ); end
				characterObject.isHit = true
				if dotTimer then timer.cancel( dotTimer ); end
				callNewRound( false, "no" )
				characterBoolean = characterBoolean + 1
			end
		end
	end
	
	local reorderLayers = function()
		
		
		gameGroup:insert( levelGroup )
		characterObject:toFront()
		poofObject:toFront()
		greenPoof:toFront()
		hudGroup:toFront()
		
	end
	
	-- *********************************************************************************************
	
	-- createLevel() function (should be the only function that's different in each level module)
	
	-- *********************************************************************************************
	
	local createLevel = function()

	
		restartLevel = leveldata.restartLevel
		nextLevel =  leveldata.nextLevel

		
		for key,data in pairs(leveldata.teleporters) do
			local tele1 = display.newImageRect(data.src, data.width, data.height)
			tele1.x = data.x1
			tele1.y = data.y1
			tele1.rotations = data.rotateAngle1
			tele1.xo = data.x2
			tele1.yo = data.y2
			tele1.rotationo = data.rotateAngle2
			tele1.myName = data.myName1
			tele1:rotate(-data.rotateAngle1)
			physics.addBody(tele1,"static",{isSensor = true})
			gameGroup:insert(tele1)
			tele1.collision = onTeleporter1Touch
			tele1:addEventListener("collision",tele1)
			
			
			local tele2 = display.newImageRect(data.src, data.width, data.height)
			tele2.x = data.x2
			tele2.y = data.y2
			tele2.rotations = data.rotateAngle2
			tele2.xo = data.x1
			tele2.yo = data.y1
			tele2.rotationo = data.rotateAngle1
			tele2.myName = data.myName2
			tele2:rotate(-data.rotateAngle2)
			physics.addBody(tele2,"static",{isSensor = true})
			gameGroup:insert(tele2)
			tele2.collision = onTeleporter2Touch
			tele2:addEventListener("collision",tele2)
			
			teleWidth = data.width
			teleHeight = data.height
			
		end	
		
		bomb = {}
		bombArmedQ = {}
		for key,data in pairs(leveldata.bombs) do
			index = data.bombIndex
			bomb = display.newImageRect(data.src, data.width, data.height)
			bomb.x = data.x
			bomb.y = data.y
			bomb.bombIndex = data.bombIndex
			bomb.id = data.id
			bomb.myName = data.myName
			physics.addBody(bomb, data.bodyType, {density=properties[data.density], bounce=data.bounce, friction = data.friction, shape=properties[data.shape]})			
			gameGroup:insert(bomb)
			bomb.bombArmedQ = "yes"
			
			bomb.isHit=false
			bomb.collision = onBombTouch
			bomb:addEventListener("collision",bomb)
			print("bomb index " .. bomb.x .. " index " .. index .. " bomb is on " .. bomb.bombArmedQ)
		end
			
		for key,data in pairs(leveldata.objects) do 
			
			local obj = display.newImageRect(data.src, data.width, data.height)
			obj.x = data.x
			obj.y = data.y
			obj.myName = data.myName
			physics.addBody(obj, data.bodyType, {density=properties[data.density], bounce=data.bounce, friction = data.friction, shape=properties[data.shape]})
			gameGroup:insert(obj)
			
		end
		
		--Create Portal
		portal = display.newImageRect(leveldata.portal.src, leveldata.portal.width, leveldata.portal.height)
		portal.x = leveldata.portal.x
		portal.y = leveldata.portal.y
		portal.myName = leveldata.portal.myName
		print("This is the portal name:" .. portal.x)
		portalObject = physics.addBody(portal, leveldata.portal.bodyType, {isSensor = true})--{density=properties[leveldata.portal.density], bounce=leveldata.portal.bounce, friction = leveldata.portal.friction, shape=properties[leveldata.portal.shape]})
		gameGroup:insert(portal)
		portal.isVisible = false
		print("Portal Invisible!!!!")
		
		portal.isHit=false
		portal.collision = onExitPortalTouch
		portal:addEventListener("collision",portal)
		
		for key,data in pairs(leveldata.interactions) do 
		
			local obj = display.newImageRect(data.src, data.width, data.height)
			obj.x = data.x
			obj.y = data.y
			obj.myName = data.myName
			levelGroup:insert(obj)
		
		end
		
	
		-- SET PROPER DRAW ORDER:
		reorderLayers()
	
	end
	
	
	-- *********************************************************************************************
	
	-- END createLevel() function
	
	-- *********************************************************************************************
	
	local onSystem = function( event )
		if event.type == "applicationSuspend" then
			if gameIsActive and pauseBtn.isVisible then
				gameIsActive = false
				physics.pause()
				
				-- SHADE
				if not shadeRect then
					shadeRect = display.newRect( 0, 0, 480, 320 )
					shadeRect:setFillColor( 0, 0, 0, 255 )
					hudGroup:insert( shadeRect )
				end
				shadeRect.alpha = 0.5
				
				-- SHOW MENU BUTTON
				if pauseMenuBtn then
					pauseMenuBtn.isVisible = true
					pauseMenuBtn.isActive = true
					pauseMenuBtn:toFront()
				end
				
				-- SHOW RESTART BUTTON
				if pauseRestartBtn then
					pauseRestartBtn.isVisible = true
					pauseRestartBtn.isActive = true
					pauseRestartBtn:toFront()
				end
				
				pauseBtn:toFront()
				
				-- STOP character ANIMATION
				if characterTween then
					transition.cancel( characterTween )
				end
			end
			
		elseif event.type == "applicationExit" then
			if system.getInfo( "environment" ) == "device" then
				-- prevents iOS 4+ multi-tasking crashes
				os.exit()
			end
		end
	end
	
	local gameInit = function()
		
		-- PHYSICS
		physics.start( true )
		physics.setDrawMode( "normal" )	-- set to "debug" or "hybrid" to see collision boundaries
		physics.setGravity( 0, 0 )	--> 0, 9.8 = Earth-like gravity


		
		-- DRAW GAME OBJECTS
		drawBackground()
		createGround()
		createShotOrb()
		createcharacter()
		
		-- createMagnet()
		-- magnet1 = display.newCircle( 100, 50, 20 )
		-- 		magnet1:setFillColor(0,255,00)
		
		-- CREATE LEVEL
		createLevel()

		-- local boxy = display.newRect(100,50,50,100)
		
		-- DRAW HEADS-UP DISPLAY (score, lives, etc)
		drawHUD()
		
		-- LOAD BEST SCORE FOR THIS LEVEL
		local bestScoreFilename = "level"..restartLevel .. ".data"
		local loadedBestScore = loadValue( bestScoreFilename )	--> restarLevel should be "1" or "2", etc.
		
		bestScore = tonumber(loadedBestScore)
		
		-- START EVENT LISTENERS
		Runtime:addEventListener( "touch", onScreenTouch )
		Runtime:addEventListener( "enterFrame", gameLoop )
		Runtime:addEventListener( "system", onSystem )
		
		local startTimer = timer.performWithDelay( 2000, function() startNewRound(); end, 1 )
	end
	
	unloadMe = function()
		-- STOP PHYSICS ENGINE
		physics.stop()
		
		-- REMOVE EVENT LISTENERS
		Runtime:removeEventListener( "touch", onScreenTouch )
		Runtime:removeEventListener( "enterFrame", gameLoop )
		Runtime:removeEventListener( "system", onSystem )
		
		-- REMOVE everything in other groups
		for i = hudGroup.numChildren,1,-1 do
			local child = hudGroup[i]
			child.parent:remove( child )
			child = nil
		end
		
		-- Stop any transitions
		if characterTween then transition.cancel( characterTween ); end
		if poofTween then transition.cancel( poofTween ); end
		if swipeTween then transition.cancel( swipeTween ); end
		
		-- Stop any timers
		if restartTimer then timer.cancel( restartTimer ); end
		if continueTimer then timer.cancel( continueTimer ); end
	end
	
	gameInit()
	
	-- MUST return a display.newGroup()
	return gameGroup
end
