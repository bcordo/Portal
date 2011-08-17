-- 
-- Abstract: Portal- Physics Game 
-- Designed and created by Brad G Cordova 
-- http://bcordova.com

-- (This is easiest to play on iPad or other large devices, but should work on all iOS and Android devices)
-- 
-- Version: 1.0
-- 



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

	FXLibrary.Initialize()
	
	
	

	
	local levelsetup = require("level_creator")
	local easingx  = require("easing")
	require "saveit"
	
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
	local outArrow
	local blastGlow
	local characterObject = {}
	local poofObject
	local greenPoof; local poofTween
	local switch_obj

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
	
	
	local life1; local life2; local life3; local life4; local life5; local life6; local life7; local life8;
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
	local characterBoolean = 1
	local charactertouchdie = false
	local trainingStep = 1 
	local characterTrainingDeath = true
	local bombArmedQ 


	

	
	
	

	
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
	
	local scoreAnimText1000 = display.newImage("images/1000.png")
	scoreAnimText1000.alpha = 0
	scoreAnimText1000.xScale = .01
	scoreAnimText1000.yScale = .01
	scoreAnimText1000.opacity = .6
	gameGroup:insert(scoreAnimText1000)
	
	local scoreAnimText500 = display.newImage("images/500.png")
	scoreAnimText500.alpha = 0
	scoreAnimText500.xScale = .01
	scoreAnimText500.yScale = .01
	scoreAnimText500.opacity = .6
	gameGroup:insert(scoreAnimText500)
	
	local scoreAnimText100 = display.newImage("images/100.png")
	scoreAnimText100.alpha = 0
	scoreAnimText100.xScale = .01
	scoreAnimText100.yScale = .01
	scoreAnimText100.opacity = .6
	gameGroup:insert(scoreAnimText100)
	
	local scoreAnim2Text100 = display.newImage("images/100.png")
	scoreAnim2Text100.alpha = 0
	scoreAnim2Text100.xScale = .01
	scoreAnim2Text100.yScale = .01
	scoreAnim2Text100.opacity = .6
	gameGroup:insert(scoreAnim2Text100)
	
	local lifeAnimText1 = display.newImage("images/pluslife.png")
	lifeAnimText1.alpha = 0
	lifeAnimText1.xScale = .01
	lifeAnimText1.yScale = .01
	lifeAnimText1.opacity = .6
	gameGroup:insert(lifeAnimText1)
		
	
	-- gameGroup:insert(scoreAnimText500)
	
	-- AUDIO
	local explosionSound = media.newEventSound( "soundfx/explosion.mp3" )
	local portalOpenSound = audio.loadSound("soundfx/portalopen.wav")
	local portalExitSound = audio.loadSound("soundfx/portal_3.wav")
	local portalExitSound2 = audio.loadSound("soundfx/portal2.wav")
	local portalOpen2Sound = audio.loadSound("soundfx/portalopen.wav")
	local tapSound = audio.loadSound( "soundfx/tapsound.wav" )
	local blastOffSound = audio.loadSound( "soundfx/blastoff.wav" )
	local characterPoofSound = audio.loadSound( "soundfx/characterpoof.wav" )
	local monsterPoofSound = audio.loadSound( "soundfx/monsterpoof.wav" )
	local impactSound = audio.loadSound( "soundfx/impact.wav" )
	local weeSound = audio.loadSound( "soundfx/wee.wav" )
	local newRoundSound = audio.loadSound( "soundfx/entersound.wav" )
	local youWinSound = audio.loadSound( "soundfx/win.wav" )
	local youLoseSound = audio.loadSound( "soundfx/lose.wav" )
	local switchSound = audio.loadSound( "soundfx/switch_activate.wav" )
	local gemSound = audio.loadSound( "soundfx/gem.wav" )
	local lifegemSound = audio.loadSound( "soundfx/lifegem.wav" )
	
	local BackgroundMusicMix = function()
	
	levelBackgroundMusicTable = {"SnakesOnTheTake.mp3","ShesWarpedAgain.mp3","LightSpeed.mp3","HurryScurry.mp3"}
	indexOfLevelBackgroundMusicTable = math.random(#levelBackgroundMusicTable)
	levelBackgroundMusicName = levelBackgroundMusicTable[indexOfLevelBackgroundMusicTable]
	levelBackgroundMusic = audio.loadStream("soundfx/backgroundMusic/"..levelBackgroundMusicName)
	backgroundMusicChannel = audio.play(levelBackgroundMusic, { channel=2, loops=0, onComplete=BackgroundMusicMix }  )
	audio.setVolume( 0.327, { channel=2 } )
	end
	
	
	------------------Text Wrapping Functions -----------------------
	-- Wrap text
	local function autoWrappedText(text, font, size, color, width)
	--print("text: " .. text)
	  if text == '' then return false end
	  font = font or native.systemFont
	  size = tonumber(size) or 12
	  color = color or {255, 255, 255}
	  width = width or display.stageWidth

	  result = display.newGroup()
	  local lineCount = 0
	  -- do each line separately
	  for line in string.gmatch(text, "[^\n]+") do
	    local currentLine = ''
	    local currentLineLength = 0 -- the current length of the string in chars
	    local currentLineWidth = 0 -- the current width of the string in pixs
	    local testLineLength = 0 -- the target length of the string (starts at 0)
	    -- iterate by each word
	    for word, spacer in string.gmatch(line, "([^%s%-]+)([%s%-]*)") do
	      local tempLine = currentLine..word..spacer
	      local tempLineLength = string.len(tempLine)
	      -- test to see if we are at a point to try to render the string
	      if testLineLength > tempLineLength then
	        currentLine = tempLine
	        currentLineLength = tempLineLength
	      else
	        -- line could be long enough, try to render and compare against the max width
	        local tempDisplayLine = display.newText(tempLine, 0, 0, font, size)
	        local tempDisplayWidth = tempDisplayLine.width
	        tempDisplayLine:removeSelf();
	        tempDisplayLine=nil;
	        if tempDisplayWidth <= width then
	          -- line not long enough yet, save line and recalculate for the next render test
	          currentLine = tempLine
	          currentLineLength = tempLineLength
	          testLineLength = math.floor((width*0.9) / (tempDisplayWidth/currentLineLength))
	        else
	          -- line long enough, show the old line then start the new one
	          local newDisplayLine = display.newText(currentLine, 0, (size * 1.3) * (lineCount - 1), font, size)
	          newDisplayLine:setTextColor(color[1], color[2], color[3])
	          result:insert(newDisplayLine)
	          lineCount = lineCount + 1
	          currentLine = word..spacer
	          currentLineLength = string.len(word)
	        end
	      end
	    end
	    -- finally display any remaining text for the current line
	    local newDisplayLine = display.newText(currentLine, 0, (size * 1.3) * (lineCount - 1), font, size)
	    newDisplayLine:setTextColor(color[1], color[2], color[3])
		result:insert(newDisplayLine)
	    lineCount = lineCount + 1
	    currentLine = ''
	    currentLineLength = 0
	  end
	  result:setReferencePoint(display.TopLeftReferencePoint)
	  return result
	end

	------------------End Text Wrapping Functions -----------------------
	
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
	
	--***************************************************

	-- resumeStart() --> Function Loads data
	
	--***************************************************
	
	local function resumeStart()
				local path = system.pathForFile( _G.filesavepathname, system.DocumentsDirectory )                
					local file = io.open( path, "r" )

					if file then
						print("Loading our data...")
						local contents = file:read( "*a" )
						-- Loads our data

						local prevState = explode(", ", contents)

	                        _G.highestLevel1 = prevState[1]
							_G.levelTracker1 = prevState[2]
							_G.highestWorld = prevState[3]


						io.close( file )

					else
						_G.highestLevel1=1;
						_G.levelTracker1=0;
						_G.highestWorld=1;
					end
	end
	
	--***************************************************

	-- animScore() --> for score animation
	
	--***************************************************
	
	local animScore =  function(scoreText) 
	scoreText:toFront( )
		
	if scoreText == scoreAnimText1000 then
		scaleFactor = .8
	elseif scoreText == lifeAnimText1 then
		scaleFactor = .6
	else
		scaleFactor = .5
	end
	scoreText.alpha = .80
	transition.to(scoreText, {
	                time = 250,
	                x = scoreText.x,
	                y = scoreText.y - 13,
					xScale = scaleFactor,
					yScale = scaleFactor,
					delay = 0, 
	                transition = easingx.easeInOut})
	transition.to(scoreText, {
					time = 250,
	                delay = 380,
					xScale = .001,
					yScale = .001, 
					alpha = 0,
					x = scoreText.x,
	                y = scoreText.y + 13,
	                transition = easingx.easeInOut})
	-- transition.to(scoreText, {
	-- 					time = 500,
	-- 	                delay = 400,
	-- 					x = scoreText.x,
	-- 	                y = scoreText.y - 100, 
	-- 					alpha = 0,
	-- 					rotation = math.random(-180,180),
	-- 	                transition = easingx.easeOutExpo})
	end
	
	
	--***************************************************

	-- animLife() --> for life animation
	
	--***************************************************
	
	local animLife =  function(lifeText) 
	lifeText:toFront( )
	if ThroughExitPortal == true then
		scaleFactor = 2.1
		endScale = 1
		durationOf = 400
	else
		scaleFactor = 1.7
		endScale = 1
		durationOf = 250
	end
	
	lifeText.alpha = 1
	transition.to(lifeText, {
	                time = durationOf,
	                x = lifeText.x,
	                y = lifeText.y + 18,
					xScale = scaleFactor,
					yScale = scaleFactor,
					delay = 0, 
	                transition = easingx.easeInOut})
	transition.to(lifeText, {
					time = durationOf,
	                delay = durationOf+120,
					xScale = endScale,
					yScale = endScale, 
					alpha = 1,
					x = lifeText.x,
	                y = lifeText.y,
	                transition = easingx.easeInOut})
	-- transition.to(lifeText, {
	-- 					time = 500,
	-- 	                delay = 400,
	-- 					x = lifeText.x,
	-- 	                y = lifeText.y - 100, 
	-- 					alpha = 0,
	-- 					rotation = math.random(-180,180),
	-- 	                transition = easingx.easeOutExpo})
	end
	
	local animEndScore =  function(lifeText) 
	lifeText:toFront( )
	
	scaleFactor = 1.05
	endScale = .5
	durationOf = 400
	
	lifeText.alpha = 1
	transition.to(lifeText, {
	                time = durationOf,
	                x = lifeText.x,
	                y = lifeText.y + 18,
					xScale = scaleFactor,
					yScale = scaleFactor,
					delay = 0, 
	                transition = easingx.easeInOut})
	transition.to(lifeText, {
					time = durationOf,
	                delay = durationOf +120,
					xScale = endScale,
					yScale = endScale, 
					alpha = 1,
					x = lifeText.x,
	                y = lifeText.y,
	                transition = easingx.easeInOut})
	-- transition.to(lifeText, {
	-- 					time = 500,
	-- 	                delay = 400,
	-- 					x = lifeText.x,
	-- 	                y = lifeText.y - 100, 
	-- 					alpha = 0,
	-- 					rotation = math.random(-180,180),
	-- 	                transition = easingx.easeOutExpo})
	end
	
	

	--***************************************************
	
	
	
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
		charactertouchdie = false
		characterTrainingDeath = true
		
		if audio.isChannelActive( 2 ) then
			audio.resume(2)
		else
			
			levelBackgroundMusicTable = {"SnakesOnTheTake.mp3","ShesWarpedAgain.mp3","LightSpeed.mp3","HurryScurry.mp3"}
			indexOfLevelBackgroundMusicTable = math.random(#levelBackgroundMusicTable)
			levelBackgroundMusicName = levelBackgroundMusicTable[indexOfLevelBackgroundMusicTable]
			levelBackgroundMusic = audio.loadStream("soundfx/backgroundMusic/"..levelBackgroundMusicName)
			backgroundMusicChannel = audio.play(levelBackgroundMusic, { channel=2, loops=0, onComplete=BackgroundMusicMix }  )
			audio.setVolume( 0.327, { channel=2 } )
			
		end
		
		if leveldata.restartLevel == "1-1" then
			bomb.x = -10000
			bomb.y = 10000
		end
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
			_G.levelTracker1 = leveldata.tracker1Next
			-- audio.play( youWinSound )
			
			
			endScoreText = display.newText( "+"..tostring(gameLives*1000).." life bonus", 20, 25, "Helvetica Neue", 28 )
			endScoreText:setReferencePoint(display.TopLeftReferencePoint)
			endScoreText.xScale = .5
			endScoreText.yScale = .5
			endScoreText:setTextColor(255, 255, 255)
			endScoreText.alpha = 0
			delayOfEndScore = 400
			
			if gameLives >= 8 then
				local animEndScore8 = function()
				animEndScore(endScoreText)
				animLife(life8)
				animLife(life7)
				animLife(life6)
				animLife(life5)
				animLife(life4)
				animLife(life3)
				animLife(life2)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore8,1)
				life8.alpha = 1
				life7.alpha = 1
				life6.alpha = 1
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
			elseif gameLives == 7 then
				local animEndScore7 = function()
				animEndScore(endScoreText)
				animLife(life7)
				animLife(life6)
				animLife(life5)
				animLife(life4)
				animLife(life3)
				animLife(life2)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore7,1)
				life8.alpha = 0
				life7.alpha = 1
				life6.alpha = 1
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
			elseif gameLives == 6 then
				local animEndScore6 = function()
				animEndScore(endScoreText)
				animLife(life6)
				animLife(life5)
				animLife(life4)
				animLife(life3)
				animLife(life2)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore6,1)
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 1
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
			elseif gameLives == 5 then
				local animEndScore5 = function()
				animEndScore(endScoreText)
				animLife(life5)
				animLife(life4)
				animLife(life3)
				animLife(life2)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore5,1)
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
			elseif gameLives == 4 then
				local animEndScore4 = function()
				animEndScore(endScoreText)
				animLife(life4)
				animLife(life3)
				animLife(life2)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore4,1)
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
			elseif gameLives == 3 then
				local animEndScore3 = function()
				animEndScore(endScoreText)
				animLife(life3)
				animLife(life2)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore3,1)
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
			elseif gameLives == 2 then
				local animEndScore2 = function()
				animEndScore(endScoreText)
				animLife(life2)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore2,1)
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 1
				life1.alpha = 1
			elseif gameLives == 1 then
				local animEndScore1 = function()
				animEndScore(endScoreText)
				animLife(life1)
				end
				timer.performWithDelay(delayOfEndScore,animEndScore1,1)
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 0.3
				life1.alpha = 1
			elseif gameLives <= 0 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 0.3
				life1.alpha = 0.3
			end
			
		else
			audio.play( youLoseSound )
		end
		
		local callEndOfGame = function()
		
		gameIsActive = false	--> temporarily disable gameplay touches, enterFrame listener, etc.
		physics.pause()
		if audio.isChannelActive( 2 ) then
			audio.pause(2)
		end
		
		-- Make sure pause button is hidden/inactive
		pauseBtn.isVisible = false
		pauseBtn.isActive = false
		
		if continueTimer then timer.cancel( continueTimer ); end
		-- continueText.isVisible = false
		if leveldata.restartLevel == "1-1" then
		trainingText.isVisible = true
		end
		
		-- Create all game over objects and insert them into the HUD group
		
		-- SHADE
		local shadeRect = display.newRect( 0, 0, 480, 320 )
		shadeRect:setFillColor( 0, 0, 0, 255 )
		shadeRect.alpha = 0
	
		
		
		-- GAME OVER WINDOW
		local gameOverDisplay
		-- local textObject1
		-- local textObject2
		
		if endScoreText ~= nil then
		local getRidofScoreText = function()
		endScoreText.alpha = 0
		end
		timer.performWithDelay(900,getRidofScoreText,1)
		end
		if isWin == "yes" then
			
			gameOverDisplay = display.newImageRect( "images/youwin.png", 390, 154 )
			winTextSoundTable = {{"a nigga gonna hate on foods with lettuce, if I do say so myself son...","win.wav"},{"biotches aren't shit so aren't hoes, if I do say my self son","win.wav"}}

			indexOfTableWin = math.random(#winTextSoundTable)
			winText = winTextSoundTable[indexOfTableWin][1]
			winSoundText = winTextSoundTable[indexOfTableWin][2]
			
			currentSoundWin = audio.loadSound( "soundfx/" .. winSoundText )
			audio.play( currentSoundWin )
	
			local textWinObject = autoWrappedText( winText, "Danube", 14*2, {255,255,255}, 480 );
			-- textObject1:setReferencePoint(display.TopLeftReferencePoint)
			textWinObject.xScale = 0.5; textWinObject.yScale = 0.5;
			textWinObject.x = 190
			textWinObject.y = 90

			local characterBonus = gameLives * 1000
			local newScore = gameScore + characterBonus
			setScore( newScore )
			
		else
			gameOverDisplay = display.newImageRect( "images/youlose.png", 390, 154 )
			loseTextSoundTable = {{"You lose bitch... Hahaha you are a faggot!!","lose.wav"},{"Hahahah you suck. I can't believe you lost. GO kill yourself!!","lose.wav"}} 	
				
			indexOfTableLose = math.random(#loseTextSoundTable)
			loseText = loseTextSoundTable[indexOfTableLose][1]
			loseSoundText = loseTextSoundTable[indexOfTableLose][2]
			
			currentSoundLose = audio.loadSound( "soundfx/" .. loseSoundText )
			audio.play( currentSoundLose )
	
			local textLoseObject = autoWrappedText( loseText, "Danube", 14*2, {255,255,255}, 480 );
			-- textObject1:setReferencePoint(display.TopLeftReferencePoint)
			textLoseObject.xScale = 0.5; textLoseObject.yScale = 0.5;
			textLoseObject.x = 190
			textLoseObject.y = 90
		end
		
		gameOverDisplay.x = 240; gameOverDisplay.y = 165
		gameOverDisplay.alpha = 0
		-- textObject1.alpha = 0
		-- textObject2.alpha = 0
		
		-- MENU BUTTON
		local onMenuTouch = function( event )
			if event.phase == "release" then
				
				if endScoreText ~= nil then
				endScoreText.alpha = 0
								end
				audio.play( tapSound )
				if audio.isChannelActive( 2 ) then
					audio.stop(2)
				end
				for i = result.numChildren,1,-1 do
					local child = result[i]
					child.parent:remove( child )
					child = nil
				end
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
				if audio.isChannelActive( 2 ) then
					audio.stop(2)
				end
				if endScoreText ~= nil then
				endScoreText.alpha = 0
				end
				audio.play( tapSound )
				--local theModule = "load" .. restartModule
				
				_G.loadLevel = restartLevel
				local theModule = "loadlevel"
				for i = result.numChildren,1,-1 do
					local child = result[i]
					child.parent:remove( child )
					child = nil
				end
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
				if endScoreText ~= nil then
				endScoreText.alpha = 0
				end
				audio.play( tapSound )
				_G.loadLevel = nextLevel
				local theModule = "loadlevel" 
				for i = result.numChildren,1,-1 do
					local child = result[i]
					child.parent:remove( child )
					child = nil
				end
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
		
		-- INSERT ALL ITEMS INTO GROUP
		hudGroup:insert( shadeRect )
		-- hudGroup:insert( ofBtn )
		-- hudGroup:insert( fbBtn )
		hudGroup:insert( gameOverDisplay )
		-- hudGroup:insert( textObject1 )
		-- hudGroup:insert( textObject2 )
		hudGroup:insert( menuBtn )
		hudGroup:insert( restartBtn )
		if isWin == "yes" then hudGroup:insert( nextBtn ); end
		
		-- FADE IN ALL GAME OVER ELEMENTS
		transition.to( shadeRect, { time=200, alpha=0.65 } )
		transition.to( gameOverDisplay, { time=500, alpha=1 } )
		transition.to( textObject1, { time=500, alpha=1 } )
		transition.to( textObject2, { time=500, alpha=1 } )
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
			local bestScoreFilename = "level"..restartLevel .. ".data"
			saveValue( bestScoreFilename, tostring(bestScore) )
		end
		
		-- MAKE SURE BEST SCORE TEXT IS VISIBLE
		bestScoreText = display.newText( "0", 10, 300, "Helvetica Neue", 32 )
		bestScoreText:setTextColor( 228, 228, 228, 255 )	--> white
		bestScoreText.text = "Best Score For This Level: " .. comma_value( bestScore )
		bestScoreText.xScale = 0.5; bestScoreText.yScale = 0.5	--> for clear retina display text
		bestScoreText.x = (bestScoreText.contentWidth * 0.5) + 15
		bestScoreText.y = 304
		
		hudGroup:insert( bestScoreText )
		
		end
		
		timer.performWithDelay(1800,callEndOfGame,1) -- time it takes after exiting portal to displaying end of game dialogue
	end
	
	local callNewRound = function( shouldPoof, instantPoof )
		local shouldPoof = shouldPoof
		local instantPoof = instantPoof
		local isGameOver = false
		
		if blastGlow.isVisible then
			blastGlow.isVisible = false
		end
		
		print("Game Lives:" .. gameLives)
		
		if gameLives >= 1 then
			if leveldata.restartLevel == "1-1" then
			gameLives = gameLives
			else
			gameLives = gameLives - 1	
			end
				
			if gameLives >= 8 then
				life8.alpha = 1
				life7.alpha = 1
				life6.alpha = 1
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 7 then
				life8.alpha = 0
				life7.alpha = 1
				life6.alpha = 1
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 6 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 1
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 5 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 1
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 4 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 1
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 3 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 1
				life2.alpha = 1
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 2 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 1
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 1 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 0.3
				life1.alpha = 1
				if ThroughExitPortal == true then isGameOver = true; end
			elseif gameLives == 0 then
				life8.alpha = 0
				life7.alpha = 0
				life6.alpha = 0
				life5.alpha = 0
				life4.alpha = 0.3
				life3.alpha = 0.3
				life2.alpha = 0.3
				life1.alpha = 0.3
				isGameOver = true
			end
		elseif gameLives < 0 then
			gameLives = 0
			life8.alpha = 0
			life7.alpha = 0
			life6.alpha = 0
			life5.alpha = 0
			life4.alpha = 0.3
			life3.alpha = 0.3
			life2.alpha = 0.3
			life1.alpha = 0.3
			isGameOver = true
		else
			life8.alpha = 0
			life7.alpha = 0
			life6.alpha = 0
			life5.alpha = 0
			life4.alpha = 0.3
			life3.alpha = 0.3
			life2.alpha = 0.3
			life1.alpha = 0.3
			isGameOver = true
		end	
		
		if shouldPoof then
			
			-- if characterObject.isExited == true then
			-- 				characterObject.isVisible = false
			-- 				shouldPoof = false
			-- 				instantPoof = "no"
			-- 			end
					
			local poofThecharacter = function()
				local theDelay = 280
				
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
					
				else
					local fadePoof = function()
						transition.to( poofObject, { time=10, alpha=0 } )	
					end
					transition.to( poofObject, { time=10, alpha=1.0, onComplete=fadePoof } )
				end
				
				-- Move camera to far right to see effect
				-- if gameGroup.x > -480 then
				-- 					local camTween = transition.to( gameGroup, { time=500, x=-480 } )
				-- 				end
				
				-- local continueBlink = function()
				-- 					 local startBlinking = function()
				-- 					 	if continueText.isVisible then
				-- 					 		continueText.isVisible = false
				-- 					 	else
				-- 					 		continueText.isVisible = true
				-- 							if leveldata.restartLevel == "1-1" then
				-- 							trainingText.isVisible = false
				-- 							end
				-- 					 	end
				-- 					 end
				-- 					 
				-- 					 continueTimer = timer.performWithDelay( 350, startBlinking, 0 )
				-- 				end
				
				restartTimer = timer.performWithDelay( theDelay, function()
					charactertouchdie = false
					waitingForNewRound = true;
					-- continueBlink();
				end, 1 )
				
	
			end
			
			if instantPoof == "yes" then
				local poofTimer = timer.performWithDelay( 10, poofThecharacter, 1 ) --makes the character last longer 
			else
				-- if leveldata.restartLevel == "1-1" then
				-- 					if characterObject.isHit == false and characterObject.inAir and gameIsActive then
				-- 						characterObject.isHit = true
				-- 						local poofTimer = timer.performWithDelay( 3000, poofThecharacter, 1 )
				-- 						print("real timer")
				-- 					end
				-- 				else
					local poofTimer = timer.performWithDelay( 1500, poofThecharacter, 1 )
				-- end
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
				restartTimer = timer.performWithDelay( 1, startNewRound, 1 )
			else
				if ThroughExitPortal == false then
					restartTimer = timer.performWithDelay( 300, function() callGameOver( "no" ); end, 1 )
				-- else
				-- 					restartTimer = timer.performWithDelay( 1750, function() callGameOver( "yes" ); end, 1 )
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
		
		life5 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life5.x = life4.x + 25; life5.y = 18
		life5.alpha = 0
		
		life6 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life6.x = life5.x + 25; life6.y = 18
		life6.alpha = 0
		
		life7 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life7.x = life6.x + 25; life7.y = 18
		life7.alpha = 0
		
		life8 = display.newImageRect( "images/lifeicon.png", 22, 22 )
		life8.x = life7.x + 25; life8.y = 18
		life8.alpha = 0
		
		hudGroup:insert( life1 )
		hudGroup:insert( life2 )
		hudGroup:insert( life3 )
		hudGroup:insert( life4 )
		hudGroup:insert( life5 )
		hudGroup:insert( life6 )
		hudGroup:insert( life7 )
		hudGroup:insert( life8 )
		
		-- SCORE DISPLAY
		scoreText = display.newText( "0", 470, 22, "Helvetica Neue", 52 )
		scoreText:setTextColor( 255, 255, 255, 255 )	--> white
		scoreText.text = gameScore
		scoreText.xScale = 0.5; scoreText.yScale = 0.5	--> for clear retina display text
		scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 15
		scoreText.y = 20
		
		hudGroup:insert( scoreText )
		
		-- TAP TO CONTINUE DISPLAY
		-- continueText = display.newText( "TAP TO CONTINUE", 240, 18, "Helvetica", 36 )
		if leveldata.restartLevel == "1-1" then
			-- continueText:setTextColor( 254, 113, 2, 200 ) --( 0, 0, 0, 255 )
			trainingText = display.newText("TRAINING LEVEL ", 240, 18, "Danube", 36)
			trainingText:setTextColor( 254, 113, 2, 200 )
			trainingText.xScale = 0.5; trainingText.yScale = 0.5
			trainingText.x = 240; trainingText.y = 18
			hudGroup:insert(trainingText)
		else
			-- continueText:setTextColor( 249, 203, 64, 255 )
			
		end
		-- continueText.xScale = 0.5; continueText.yScale = 0.5
		-- continueText.x = 240; continueText.y = 18
		-- continueText.isVisible = false
		-- 
		-- hudGroup:insert( continueText )
		
		-- PAUSE BUTTON
		local onPauseTouch = function( event )
			if event.phase == "release" and pauseBtn.isActive then
				audio.play( tapSound )

				-- Pause the game
				
				if gameIsActive then
				
					gameIsActive = false
					physics.pause()
					if audio.isChannelActive( 2 ) then
						audio.pause(2)
					end
					-- if portalOpen == true then
					-- 	Particles.StopEmitter("PortalEmitter")
					-- end
					Particles.Freeze()
					
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
					
					-- if portalOpen == true then
					-- 						Particles.StartEmitter("PortalEmitter")
					-- 					end
					Particles.WakeUp()
					
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
					if audio.isChannelActive( 2 ) then
						audio.resume(2)
					else
						levelBackgroundMusicTable = {"SnakesOnTheTake.mp3","ShesWarpedAgain.mp3","LightSpeed.mp3","HurryScurry.mp3"}
						indexOfLevelBackgroundMusicTable = math.random(#levelBackgroundMusicTable)
						levelBackgroundMusicName = levelBackgroundMusicTable[indexOfLevelBackgroundMusicTable]
						levelBackgroundMusic = audio.loadStream("soundfx/backgroundMusic/"..levelBackgroundMusicName)
						backgroundMusicChannel = audio.play(levelBackgroundMusic, { channel=2, loops=0, onComplete=BackgroundMusicMix }  )
						audio.setVolume( 0.327, { channel=2 } )
					end
					
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
				if audio.isChannelActive( 2 ) then
					audio.stop(2)
				end
				local onComplete = function ( event )
					if "clicked" == event.action then
						local i = event.index
						if i == 2 then
							-- Player click 'Cancel'; do nothing, just exit the dialog
						elseif i == 1 then
							-- Player clicked Yes, go to main menu
							-- if portalOpen == true then
							-- 	Particles.StopEmitter("PortalEmitter")
							-- end
							Particles.WakeUp()

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
				Particles.WakeUp()

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
	
	
	createcharacter = function()
		
		local oncharacterCollision = function( self, event )
			if event.phase == "began" then
				
							
				if event.other.myName == "gem" then
						local newScore = gameScore + 500
						setScore( newScore )
						scoreAnimText500.x = event.other.x
						scoreAnimText500.y = event.other.y
						animScore(scoreAnimText500)
						

						event.other:removeSelf()
						audio.play( gemSound )

				end
				
				if event.other.myName == "lifegem" then

						gameLives = gameLives + 1
						
						
						if gameLives >= 8 then
							animLife(life8)
							life8.alpha = 1
							life7.alpha = 1
							life6.alpha = 1
							life5.alpha = 1
							life4.alpha = 1
							life3.alpha = 1
							life2.alpha = 1
							life1.alpha = 1
						elseif gameLives == 7 then
							animLife(life7)
							life8.alpha = 0
							life7.alpha = 1
							life6.alpha = 1
							life5.alpha = 1
							life4.alpha = 1
							life3.alpha = 1
							life2.alpha = 1
							life1.alpha = 1
						elseif gameLives == 6 then
							animLife(life6)
							life8.alpha = 0
							life7.alpha = 0
							life6.alpha = 1
							life5.alpha = 1
							life4.alpha = 1
							life3.alpha = 1
							life2.alpha = 1
							life1.alpha = 1
						elseif gameLives == 5 then
							animLife(life5)
							life8.alpha = 0
							life7.alpha = 0
							life6.alpha = 0
							life5.alpha = 1
							life4.alpha = 1
							life3.alpha = 1
							life2.alpha = 1
							life1.alpha = 1
						elseif gameLives == 4 then
							animLife(life4)
							life8.alpha = 0
							life7.alpha = 0
							life6.alpha = 0
							life5.alpha = 0
							life4.alpha = 1
							life3.alpha = 1
							life2.alpha = 1
							life1.alpha = 1
						elseif gameLives == 3 then
							animLife(life3)
							life8.alpha = 0
							life7.alpha = 0
							life6.alpha = 0
							life5.alpha = 0
							life4.alpha = 0.3
							life3.alpha = 1
							life2.alpha = 1
							life1.alpha = 1
						elseif gameLives == 2 then
							animLife(life2)
							life8.alpha = 0
							life7.alpha = 0
							life6.alpha = 0
							life5.alpha = 0
							life4.alpha = 0.3
							life3.alpha = 0.3
							life2.alpha = 1
							life1.alpha = 1
						elseif gameLives == 1 then
							animLife(life1)
							life8.alpha = 0
							life7.alpha = 0
							life6.alpha = 0
							life5.alpha = 0
							life4.alpha = 0.3
							life3.alpha = 0.3
							life2.alpha = 0.3
							life1.alpha = 1
						elseif gameLives <= 0 then
							life8.alpha = 0
							life7.alpha = 0
							life6.alpha = 0
							life5.alpha = 0
							life4.alpha = 0.3
							life3.alpha = 0.3
							life2.alpha = 0.3
							life1.alpha = 0.3
						end
					
						
												
						
						lifeAnimText1.x = event.other.x
						lifeAnimText1.y = event.other.y
						animScore(lifeAnimText1)
						
						
						

						event.other:removeSelf()
						audio.play( lifegemSound )

				end
				
				
				
				-- if event.other.myName == "portal" and portalOpen == true then
				-- 						characterObject.isExited = true
				-- 						audio.play( impactSound )
				-- 						print("isExited = true")	
				-- 				end
				
				
				if event.other.myName ~= "portal" and event.other.myName ~= "teleporter1" and event.other.myName ~= "teleporter2" and event.other.myName ~= "gem" and event.other.myName ~= "lifegem" then	
					
					if characterObject.isHit == false then
						
						
						if blastGlow.isVisible then
							blastGlow.isVisible = false
						end
					
						
						if dotTimer then timer.cancel( dotTimer ); end
						characterObject.isHit = true
						
					
						if event.other.myName == "wood" or event.other.myName == "stone" or event.other.myName == "metal" or event.other.myName == "switch" then
							
							if event.other.myName == "switch" and portalOpen ~= true then
									local newScore = gameScore + 500
									setScore( newScore )
									scoreAnimText500.x = self.x
									scoreAnimText500.y = self.y
									animScore(scoreAnimText500)

									portalOpen = true
									audio.play( switchSound )
									audio.play( portalOpen2Sound)
									event.other:removeSelf()

									-- PortalSound = audio.loadStream("soundfx/explosion_long.aac")
									-- PortalMusicChannel = audio.play( PortalSound, { channel = 6, loodps=-1 }  )
									-- audio.play( portalOpenSound )

									Particles.StartEmitter("PortalEmitter")
									-- callNewRound( true, "yes" )
									-- 						characterBoolean = characterBoolean + 1
									-- Particles.StopEmitter("PortalEmitter")
									-- Particles.DeleteEmitter("PortalEmitter")
									-- timer.performWithDelay(100,event.other:removeSelf(),1)
							end
							callNewRound( true, "yes" )
							characterBoolean = characterBoolean + 1
							-- if event.other.myName == "switch" then
							-- 								event.other:removeSelf()
							-- 							end
							-- scoreAnimText500.x = self.x
							-- scoreAnimText500.y = self.y
							-- animScore(scoreAnimText500)
						else
							callNewRound( true, "no" )
							characterBoolean = characterBoolean + 1
						end
					
						
				
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
		
		outArrow = display.newImageRect( "images/outArrow.png", 240, 240 )
		outArrow.x = 52; outArrow.y = 255
		outArrow.isVisible = false
		
		gameGroup:insert( outArrow )
		
		i = 1
		characterTable = {}
		for key,data in pairs(leveldata.characters) do 
			characterTable[ i ] = data
			-- print(characterTable[ i ].src1)
			i = i + 1
		end
	
		print(characterBoolean)
		if characterBoolean > 4 then
			characterBoolean = 4
		end
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
				if(math.abs(forcex) > 100 or math.abs(forcey) > 100) then
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
			
			if(event.phase == "began" and self.bombArmedQ == "yes" and gameIsActive and self.isBodyActive == true) then
				local newScore = gameScore + 100
				setScore( newScore )
				scoreAnimText100.x = self.x
				scoreAnimText100.y = self.y
				animScore(scoreAnimText100)
				print("bomb id " .. self.bombIndex)
				local circle = ""
				local explosion = ""
				local function blast( event )
					media.playEventSound( explosionSound )
				    circle = display.newCircle( self.x, self.y, 100 )
					bombstring2 = "BombEmitter" .. self.bombIndex
					Particles.StartEmitter(bombstring2)
					-- explosion = display.newImage( "images/explosion.png", self.x, self.y )
					self:removeSelf()
					circle:setFillColor(0,0,0, 0)
					physics.addBody( circle, "static", {isSensor = true} )
					circle.myName = "circle"
					circle.collision = BombBlastWave
					circle:addEventListener( "collision", circle )
				 end

				 local function removeStuff( event )
					circle:removeSelf()
					-- DeleteEmitter("BombEmitter")
				 end
				 timer.performWithDelay(10, blast )
				 timer.performWithDelay(110, removeStuff)
			end
		self.bombArmedQ = "no"
	end
	
	
	local onExitPortalTouch = function( self, event )
		if self.isHit == false and portalOpen == true and event.other.myName == "character" then
			audio.play( impactSound )
			charactertouchdie = false
			local newScore = gameScore + 1000
			setScore( newScore )
			scoreAnimText1000.x = self.x + 80
			scoreAnimText1000.y = self.y
			animScore(scoreAnimText1000)
			audio.play( portalExitSound )
			audio.play( portalExitSound2 )
			self.isHit = true
			Particles.StopEmitter("PortalEmitter")
			-- Particles.DeleteEmitter("PortalEmitter")
			print( "Exited Portal!! " )
			self.isVisible = false
						self.isBodyActive = false
						self.isBullet = false
						characterObject:setLinearVelocity( 0, 0 )
						characterObject.bodyType = "static"
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
			characterObject.isExited = true
			timer.performWithDelay( 5000, callNewRound( true, "yes" ), 1 )
			self.parent:remove( self )
						self = nil
		end
	end
	
	onTeleporter1Touch = function( self, event )
		print("teleporter 1 touch")
		if event.other.myName == "character" then
			local newScore = gameScore + 100
			setScore( newScore )
			scoreAnimText100.x = self.x
			scoreAnimText100.y = self.y
			animScore(scoreAnimText100)
			-- audio.play( telporterSound )

			Particles.StartEmitter("Teleporter1Emitter")
			Particles.StartEmitter("Teleporter2Emitter")
		
			needToTeleport1 = true
			needToTeleport2 = false
			teletouch = true
			c2x = self.xo
			c2y = self.yo
			rotateAngle1 = self.rotations 
			rotateAngle2 = self.rotationo
			print("rotations angles " .. self.rotations .. " " .. self.rotationo)
			scoreAnim2Text100.x = self.xo
			scoreAnim2Text100.y = self.yo
			animScore(scoreAnim2Text100)
			
		end
	end
	
	onTeleporter2Touch = function( self, event )
		if event.other.myName == "character" then
			local newScore = gameScore + 100
			setScore( newScore )
			scoreAnimText100.x = self.x
			scoreAnimText100.y = self.y
			animScore(scoreAnimText100)
			-- audio.play( telporterSound )

			Particles.StartEmitter("Teleporter1Emitter")
			Particles.StartEmitter("Teleporter2Emitter")
			
			needToTeleport1 = false
			needToTeleport2 = true
			teletouch = true
			c1x = self.xo
			c1y = self.yo
			rotateAngle2 = self.rotations 
			rotateAngle1 = self.rotationo 
			print("rotations angles " .. rotateAngle1 .. " " .. rotateAngle2)
			scoreAnim2Text100.x = self.xo
			scoreAnim2Text100.y = self.yo
			animScore(scoreAnim2Text100)
			
		end
	end
	
	
	local onScreenTouch = function( event )
		if charactertouchdie == false then
		if gameIsActive then
			if event.phase == "began" and characterObject.inAir == false and event.xStart > 0 and event.xStart < 200 and event.yStart > 200 and event.yStart < 350 and screenPosition == "left" then
	
				transition.cancel( characterTween )
				characterObject.y = 255
				characterObject.isReady = true
				shotOrb.isVisible = true
				shotOrb.alpha = 0.75
				shotOrb.x = characterObject.x; shotOrb.y = characterObject.y
				shotOrb.xScale = 0.1; shotOrb.yScale = 0.1
				
				-- introText1 = display.newText(levelGroup, "pull character to launch  ", 100, 100, "Danube", 14 )
				-- introText1:setTextColor(43, 43, 43)
				
				shotArrow.isVisible = true
			
			elseif event.phase == "began" and waitingForNewRound == false then
				
				if continueTimer then timer.cancel( continueTimer ); end
				-- continueText.isVisible = false
				if leveldata.restartLevel == "1-1" then
				trainingText.isVisible = true
				end
				
				-- if gameLives < 1 then
				-- 					-- GAME OVER
				-- 					if ThroughExitPortal == true then
				-- 						callGameOver( "yes" )
				-- 					else
				-- 						callGameOver( "no" )
				-- 					end
				-- 				elseif ThroughExitPortal == true and gameLives >= 1 then
				-- 					
				-- 					callGameOver( "yes" )
				-- 				end
				
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
					charactertouchdie = true
					
					
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
							if gameIsActive == true then
							if characterObject.trailNum == 0 then
								trailDot = display.newCircle( gameGroup, characterObject.x, characterObject.y, 2.5 )
							else
								trailDot = display.newCircle( gameGroup, characterObject.x, characterObject.y, 1.5 )
							end
							if leveldata.restartLevel == "1-1" then
								trailDot:setFillColor( 0, 0, 0, 0 )
							else
								trailDot:setFillColor( 255, 255, 255, 255 )
							end
							trailDot.alpha = .60
							
							trailGroup:insert( trailDot )
							--gameGroup:insert( trailGroup )
							
							
							if characterObject.trailNum == 0 then
								characterObject.trailNum = 1
							else
								characterObject.trailNum = 0
							end
							end
						end
						
						dotTimer = timer.performWithDelay( 10, createDot, 10000 )
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
		else
			if characterObject.isHit == false and characterObject.inAir == true and gameIsActive == true then
				characterObject.isHit = true
				if dotTimer then timer.cancel( dotTimer ); end
				callNewRound( true, "yes" )
				characterBoolean = characterBoolean + 1
			end
			charactertouchdie = false
		end
	end
	
	if leveldata.restartLevel == "1-1" then
		trainingText1 = display.newText(levelGroup, "drag the character in any direction to lauch him ", 20, 170, "Danube", 24 )
		trainingText1.xScale = 0.5; trainingText1.yScale = 0.5
		trainingText1.x = trainingText1.width/4 + 10; 
		trainingText1:setTextColor(0, 0, 0)
		
		trainingText1_1 = display.newText(levelGroup, "tap screen again to vaporize him ", 20, 198, "Danube", 24 )
		trainingText1_1.xScale = 0.5; trainingText1_1.yScale = 0.5
		trainingText1_1.x = trainingText1_1.width/4 + 10; 
		trainingText1_1:setTextColor(0, 0, 0)
		-- introText1.isVisible = false
		
		trainingText2 = display.newText(levelGroup, "send him through the purple transporter to continue", 20, 170, "Danube", 24 )
		trainingText2.xScale = 0.5; trainingText2.yScale = 0.5
		trainingText2.x = trainingText2.width/4 + 10;
		trainingText2:setTextColor(0, 0, 0)
		trainingText2.isVisible = false
		
		trainingText3 = display.newText(levelGroup, "transporters of the same color are linked... send through white transporter to continue", 20, 170, "Danube", 24 )
		trainingText3.xScale = 0.5; trainingText3.yScale = 0.5
		trainingText3.x = trainingText3.width/4 + 10;
		trainingText3:setTextColor(0, 0, 0)
		trainingText3.isVisible = false
		
		trainingText4 = display.newText(levelGroup, "black holes create relativistic gravitational attraction ", 20, 145, "Danube", 24 )
		trainingText4.xScale = 0.5; trainingText4.yScale = 0.5
		trainingText4.x = trainingText4.width/4 + 10;
		trainingText4:setTextColor(0, 0, 0)
		trainingText4.isVisible = false
		
		trainingText5 = display.newText(levelGroup, "white holes create magnetostatic repulsion ", 20, 145, "Danube", 24 )
		trainingText5.xScale = 0.5; trainingText5.yScale = 0.5
		trainingText5.x = trainingText5.width/4 + 10;
		trainingText5:setTextColor(0, 0, 0)
		trainingText5.isVisible = false
		
		trainingText6 = display.newText(levelGroup, "and dynamite... well... ", 20, 130, "Danube", 24 )
		trainingText6.xScale = 0.5; trainingText6.yScale = 0.5
		trainingText6.x = trainingText6.width/4 + 10;
		trainingText6:setTextColor(0, 0, 0)
		trainingText6.isVisible = false
		
		trainingText6_1 = display.newText(levelGroup, "blows things up ", 20, 142, "Danube", 24 )
		trainingText6_1.xScale = 0.5; trainingText6_1.yScale = 0.5
		trainingText6_1.x = trainingText6_1.width/4 + 10;
		trainingText6_1:setTextColor(0, 0, 0)
		trainingText6_1.isVisible = false
		
		trainingText7 = display.newText(levelGroup, "purple gems give you extra points ", 20, 130, "Danube", 24 )
		trainingText7.xScale = 0.5; trainingText7.yScale = 0.5
		trainingText7.x = trainingText7.width/4 + 10;
		trainingText7:setTextColor(0, 0, 0)
		trainingText7.isVisible = false
		
		trainingText8 = display.newText(levelGroup, "yellowish-orange gems give you extra lives ", 20, 130, "Danube", 24 )
		trainingText8.xScale = 0.5; trainingText8.yScale = 0.5
		trainingText8.x = trainingText8.width/4 + 10;
		trainingText8:setTextColor(0, 0, 0)
		trainingText8.isVisible = false
		
		trainingText9 = display.newText(levelGroup, "launch him towards the red button, inorder to activate the portal ", 20, 170, "Danube", 24 )
		trainingText9.xScale = 0.5; trainingText9.yScale = 0.5
		trainingText9.x = trainingText9.width/4 + 10; 
		trainingText9:setTextColor(0, 0, 0)
		trainingText9.isVisible = false
		
		trainingText10 = display.newText(levelGroup, "now send him through the portal and", 20, 140, "Danube", 24 )
		trainingText10.xScale = 0.5; trainingText10.yScale = 0.5
		trainingText10.x = trainingText10.width/4 + 10;
		trainingText10:setTextColor(0, 0, 0)
		trainingText10.isVisible = false
		
		trainingText10_1 = display.newText(levelGroup, "let the real adventures begin.... ", 20, 152, "Danube", 24 )
		trainingText10_1.xScale = 0.5; trainingText10_1.yScale = 0.5
		trainingText10_1.x = trainingText10_1.width/4 + 10;
		trainingText10_1:setTextColor(0, 0, 0)
		trainingText10_1.isVisible = false
		
		
	end

	
	
	local gameLoop = function()
		if gameIsActive then
			
			-- levelBackgroundMusic = audio.loadStream("soundfx/backgroundMusic/"..levelBackgroundMusicName)
			-- backgroundMusicChannel = audio.play(levelBackgroundMusic, { channel=2, loops=0, onComplete=BackgroundMusicMix }  )
			
			-------------------------------------------------------------------------------------------------------------------- 
			-- This is the code for the Text of the training level
			-------------------------------------------------------------------------------------------------------------------- 
			 
			if leveldata.restartLevel == "1-1" then
				
				
				
				-- if characterObject.isHit == false and characterObject.inAir and characterTrainingDeath == true then
				-- 					-- characterObject.isHit = true
				-- 					print("something is working!")
				-- 					if dotTimer then timer.cancel( dotTimer ); end
				-- 					timer.performWithDelay( 10000, callNewRound( true, "no" ), 0 )
				-- 					characterBoolean = characterBoolean + 1
				-- 				end
				
				
				
				if trainingStep == 1 then
					-- bomb.isVisible = false
					--bomb.isBodyActive = false		
					
					
					if characterObject.inAir == true then
						
						local training1 = function()
							trainingStep = 2
							trainingText1.isVisible = false
							trainingText1_1.isVisible = false
							trainingText2.isVisible = true
						end
						timer.performWithDelay( 3700, training1, 1 )
					end
					
					
				end
					
				
				
				
				
				if trainingStep == 2 then
					trainingtelepurple1.isBodyActive = true
					trainingtelepurple1.isVisible = true
					trainingtelepurple2.isBodyActive = true
					trainingtelepurple2.isVisible = true
						
					
					if teletouch == true then
					
										
						teletouch = false
					
					
						local training2 = function()
							trainingStep = 3
							trainingText2.isVisible = false
							trainingText3.isVisible = true
						end
						timer.performWithDelay( 3700, training2, 1 )
					
					end
					
				end
				
				if trainingStep == 3 then
					
					trainingtelepurple1.isBodyActive = false
					trainingtelepurple1.isVisible = false
					trainingtelepurple2.isBodyActive = false
					trainingtelepurple2.isVisible = false
					
					trainingtelewhite1.isBodyActive = true
					trainingtelewhite1.isVisible = true
					trainingtelewhite2.isBodyActive = true
					trainingtelewhite2.isVisible = true
					
					trainingteleyellow1.isBodyActive = true
					trainingteleyellow1.isVisible = true
					trainingteleyellow2.isBodyActive = true
					trainingteleyellow2.isVisible = true
					
					
					
					
					if teletouch == true then
					
					trainingText3.isVisible = false
					
					teletouch = false
					
					
					local training3 = function()
						trainingStep = 4
					end
					
					timer.performWithDelay( 3700, training3, 1 )
					
					end
				end
				
				if trainingStep == 4 then
				--introduce black holes, white holes, and bombs, after characters death	(timer...)
				--purple jewls give you extra points (timer...)
				--orangish yellow jewels give you extra lives (timer...)
				--show then hide ui elements
					
					trainingtelewhite1.isBodyActive = false
					trainingtelewhite1.isVisible = false
					trainingtelewhite2.isBodyActive = false
					trainingtelewhite2.isVisible = false
					
					trainingteleyellow1.isBodyActive = false
					trainingteleyellow1.isVisible = false
					trainingteleyellow2.isBodyActive = false
					trainingteleyellow2.isVisible = false
					
					trainingText4.isVisible = true
					-- blackhole_obj.isBodyActive = true
					blackhole_obj.isVisible = true
				
									
					trainingStep = 5
					
					
					 
				end
				
				if trainingStep == 5 then
					
					local training5 = function()
					trainingText4.isVisible = false
					trainingText5.isVisible = true
					-- blackhole_obj.isBodyActive = false
					blackhole_obj.isVisible = false
					-- whitehole_obj.isBodyActive = true
					whitehole_obj.isVisible = true
					trainingStep = 6
					end
					
					timer.performWithDelay( 2000, training5, 1 )
					
				end
				
				if trainingStep == 6 then
					
					local training6 = function()
					trainingText5.isVisible = false
					trainingText6.isVisible = true
					trainingText6_1.isVisible=true
					-- whitehole_obj.isBodyActive = false
					whitehole_obj.isVisible = false
					-- bomb.isBodyActive = true
					bomb.x = 113
					bomb.y = 260
					bomb.isVisible = true
					trainingStep = 7
					end
					
					timer.performWithDelay( 2000, training6, 1 )
					
				end
				
				if trainingStep == 7 then
					
					local training7 = function()
					trainingText6.isVisible = false
					trainingText6_1.isVisible = false
					trainingText7.isVisible = true
					-- bomb.isBodyActive = false
					bomb.isVisible = false
					-- gem_obj.isBodyActive = true
					gem_obj.isVisible = true
					trainingStep = 8
					end
					
					timer.performWithDelay( 2000, training7, 1 )
					
				end
				
				if trainingStep == 8 then
					
					local training8 = function()
					trainingText7.isVisible = false
					trainingText8.isVisible = true
					-- gem_obj.isBodyActive = false
					gem_obj.isVisible = false
					-- lifegem_obj.isBodyActive = true
					lifegem_obj.isVisible = true
					trainingStep = 9
					end
					
					timer.performWithDelay( 2000, training8, 1 )
				end
				
				if trainingStep == 9 then
					
					local training9 = function()
					trainingText8.isVisible = false
					trainingText9.isVisible = true
					switch_obj.isVisible = true
					switch_obj.isBodyActive = true
					blackhole_obj.isVisible = true
					blackhole_obj.isBodyActive = true
					whitehole_obj.isVisible = true
					whitehole_obj.isBodyActive = true
					bomb.isVisible = true
					gem_obj.isVisible = true
					gem_obj.isBodyActive = true
					lifegem_obj.isBodyActive = true
					wood_obj.isVisible = true
					wood_obj.isBodyActive = true
					stone_obj.isVisible = true
					stone_obj.isBodyActive = true
					metal_obj.isVisible = true
					metal_obj.isBodyActive = true
					trainingStep = 10
					end
					
					timer.performWithDelay( 2000, training9, 1 )
					
				end
			
				
							
								
				if trainingStep == 10 then
				--send character through portal to continue	
				--show all ui elements
				
					if portalOpen == true then
						trainingText9.isVisible = false
						trainingText10.isVisible = true
						trainingText10_1.isVisible = true
					end
															
				end
				
				
				
				
			
			end
			
			
		-------------------------------------------------------------------------------------------------------------------- 
		-- end code for Text of training level
		--------------------------------------------------------------------------------------------------------------------
			
			if waitingForNewRound then
				
				waitingForNewRound = false
				if continueTimer then timer.cancel( continueTimer ); end
				-- continueText.isVisible = false
				if leveldata.restartLevel == "1-1" then
				trainingText.isVisible = true
				end
				
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
			end
			
			Particles.Update()
			
			
			
			
			-- Create Interactions
			for key,data in pairs(leveldata.blackHoles) do 
				if(data.myName=="blackhole") then
					if leveldata.restartLevel == "1-1" then
						if trainingStep > 8 then
						dx = data.x - characterObject.x
						dy = data.y - characterObject.y
						r = math.sqrt(dx^2 + dy^2)
						forceFactor = data.forceFactor
						fx = forceFactor*dx/r; fy = forceFactor*dy/r
						characterObject:applyForce( fx, fy, characterObject.x, characterObject.y )
						end
					else
						dx = data.x - characterObject.x
						dy = data.y - characterObject.y
						r = math.sqrt(dx^2 + dy^2)
						forceFactor = data.forceFactor
						fx = forceFactor*dx/r; fy = forceFactor*dy/r
						characterObject:applyForce( fx, fy, characterObject.x, characterObject.y )
					end
				end
				
			end
			
			for key,data in pairs(leveldata.whiteHoles) do 
				if(data.myName=="whitehole") then
					if leveldata.restartLevel == "1-1" then
						if trainingStep > 8 then
							dx = data.x - characterObject.x
							dy = data.y - characterObject.y
							r = math.sqrt(dx^2 + dy^2)
							forceFactor = -data.forceFactor
							fx = forceFactor*dx/(r^2); fy = forceFactor*dy/(r^2)
							characterObject:applyForce( fx, fy, characterObject.x, characterObject.y )
						end
					else
						dx = data.x - characterObject.x
						dy = data.y - characterObject.y
						r = math.sqrt(dx^2 + dy^2)
						forceFactor = -data.forceFactor
						fx = forceFactor*dx/(r^2); fy = forceFactor*dy/(r^2)
						characterObject:applyForce( fx, fy, characterObject.x, characterObject.y )
					end
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
			
			if characterObject.isHit == false and characterObject.x > 2*display.viewableContentWidth and characterObject.inAir == true then
				if characterObject.y > display.viewableContentHeight then
				outArrow.isVisible = true
				outArrow.y = display.viewableContentHeight
				outArrow.x = 2*display.viewableContentWidth
				outArrow.yScale = .1 + math.sqrt( (characterObject.x - 2*display.viewableContentWidth)^2 + (characterObject.y - display.viewableContentHeight)^2) * .01
				outArrow.rotation = math.atan2(characterObject.y - display.viewableContentHeight,characterObject.x - 2*display.viewableContentWidth) * ( 180 / math.pi) - 90
						
				elseif characterObject.y < 0 then
				outArrow.isVisible = true	
				outArrow.y = 0
				outArrow.x = 2*display.viewableContentWidth
				outArrow.yScale = .1 + math.sqrt( (characterObject.x - 2*display.viewableContentWidth)^2 + (display.viewableContentWidth -characterObject.y)^2) * .01
				outArrow.rotation = math.atan2(characterObject.x - 2*display.viewableContentWidth, -characterObject.y) * ( 180 / math.pi) - 180 
				
				else
					outArrow.isVisible = true	
					outArrow.y = characterObject.y	
					outArrow.x = 2*display.viewableContentWidth
					outArrow.yScale = .1 + math.abs(2*display.viewableContentWidth - characterObject.x) * .01
					outArrow.rotation = -90	
				end
			end
			
			if characterObject.isHit == false and characterObject.x < 0 and characterObject.inAir == true then
				if characterObject.y > display.viewableContentHeight then
				outArrow.isVisible = true
					outArrow.y = display.viewableContentHeight
					outArrow.x = 0
					outArrow.yScale = .1 + math.sqrt( (-characterObject.x)^2 + (characterObject.y - display.viewableContentHeight)^2) * .01
					outArrow.rotation = math.atan2(-characterObject.x,characterObject.y - display.viewableContentHeight) * ( 180 / math.pi) - 0
						
				elseif characterObject.y < 0 then
					outArrow.isVisible = true	
					outArrow.y = 0
					outArrow.x = 0
					outArrow.yScale = .1 + math.sqrt( (-characterObject.y)^2 + (-characterObject.x)^2) * .01
					outArrow.rotation = math.atan2(-characterObject.y ,-characterObject.x) * ( 180 / math.pi) - 270
				
				else
					outArrow.isVisible = true	
					outArrow.y = characterObject.y	
					outArrow.x = 0
					outArrow.yScale = .1 + math.abs(-characterObject.x) * .01
					outArrow.rotation = 90	
				end
			end
			
			if characterObject.isHit == false and characterObject.y > display.viewableContentHeight and characterObject.x > 0 and characterObject.x < 2*display.viewableContentWidth and characterObject.inAir == true then
				outArrow.isVisible = true
				outArrow.y = display.viewableContentHeight
				outArrow.x = characterObject.x
				outArrow.yScale = .1 + math.abs(display.viewableContentHeight - characterObject.y) * .01
				outArrow.rotation = 0
			end
			
			if characterObject.isHit == false and characterObject.y < 0 and characterObject.x > 0 and characterObject.x < 2*display.viewableContentWidth and characterObject.inAir == true then
				outArrow.isVisible = true
				outArrow.y = 0
				outArrow.x = characterObject.x
				outArrow.yScale = .1 + math.abs(-characterObject.y) * .01
				outArrow.rotation = 180
			end
			
			if characterObject.inAir == true and characterObject.y > 0 and characterObject.x > 0 and characterObject.x < 2*display.viewableContentWidth and characterObject.y < display.viewableContentHeight then
				outArrow.isVisible = false
			end
			
			
			
			-- CHECK IF character GOES PAST SCREEN
			if characterObject.isHit == false and characterObject.x >= 1800 then
				characterObject.isHit = true
				if dotTimer then timer.cancel( dotTimer ); end
				callNewRound( false, "no" )
				characterBoolean = characterBoolean + 1
				if outArrow.isVisible == true then
					outArrow.isVisible = false
				end
			end
			
			if characterObject.isHit == false and characterObject.x < -800 then
				characterObject.isHit = true
				if dotTimer then timer.cancel( dotTimer ); end
				callNewRound( false, "no" )
				characterBoolean = characterBoolean + 1
				if outArrow.isVisible == true then
					outArrow.isVisible = false
				end
			end
			
			if characterObject.isHit == false and characterObject.y >= 1200 then
				characterObject.isHit = true
				if dotTimer then timer.cancel( dotTimer ); end
				callNewRound( false, "no" )
				characterBoolean = characterBoolean + 1
				if outArrow.isVisible == true then
					outArrow.isVisible = false
				end
			end
			
			if characterObject.isHit == false and characterObject.y < -800 then
				characterObject.isHit = true
				if dotTimer then timer.cancel( dotTimer ); end
				callNewRound( false, "no" )
				characterBoolean = characterBoolean + 1
				if outArrow.isVisible == true then
					outArrow.isVisible = false
				end
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
	
		-- introInstructions()
		

		
		restartLevel = leveldata.restartLevel
		nextLevel =  leveldata.nextLevel
		
		
		for key,data in pairs(leveldata.teleporters) do
			
			if leveldata.restartLevel == "1-1" then
				
				if data.id1 == "teleporterpurple-1" then
					trainingtelepurple1 = display.newImageRect(data.src, data.width, data.height)
					trainingtelepurple1.id = data.id1
					trainingtelepurple1.x = data.x1
					trainingtelepurple1.y = data.y1
					trainingtelepurple1.rotations = data.rotateAngle1
					trainingtelepurple1.xo = data.x2
					trainingtelepurple1.yo = data.y2
					trainingtelepurple1.rotationo = data.rotateAngle2
					trainingtelepurple1.myName = data.myName1
					trainingtelepurple1:rotate(-data.rotateAngle1)
					physics.addBody(trainingtelepurple1,"static",{isSensor = true})
					gameGroup:insert(trainingtelepurple1)
					teletouch = false
					trainingtelepurple1.collision = onTeleporter1Touch
					trainingtelepurple1:addEventListener("collision",trainingtelepurple1)	
					teleWidth = data.width
					teleHeight = data.height
					trainingtelepurple1.isBodyActive = false
					trainingtelepurple1.isVisible = false											
				
					trainingtelepurple2 = display.newImageRect(data.src, data.width, data.height)
					trainingtelepurple2.id = data.id2
					trainingtelepurple2.x = data.x2
					trainingtelepurple2.y = data.y2
					trainingtelepurple2.rotations = data.rotateAngle2
					trainingtelepurple2.xo = data.x1
					trainingtelepurple2.yo = data.y1
					trainingtelepurple2.rotationo = data.rotateAngle1
					trainingtelepurple2.myName = data.myName2
					trainingtelepurple2:rotate(-data.rotateAngle2)
					physics.addBody(trainingtelepurple2,"static",{isSensor = true})
					gameGroup:insert(trainingtelepurple2)
					trainingtelepurple2.collision = onTeleporter2Touch
					trainingtelepurple2:addEventListener("collision",trainingtelepurple2)
					teleWidth = data.width
					teleHeight = data.height
					trainingtelepurple2.isBodyActive = false
					trainingtelepurple2.isVisible = false							
				end
				
				if data.id1 == "teleporterwhite-1" then
					trainingtelewhite1 = display.newImageRect(data.src, data.width, data.height)
					trainingtelewhite1.id = data.id1
					trainingtelewhite1.x = data.x1
					trainingtelewhite1.y = data.y1
					trainingtelewhite1.rotations = data.rotateAngle1
					trainingtelewhite1.xo = data.x2
					trainingtelewhite1.yo = data.y2
					trainingtelewhite1.rotationo = data.rotateAngle2
					trainingtelewhite1.myName = data.myName1
					trainingtelewhite1:rotate(-data.rotateAngle1)
					physics.addBody(trainingtelewhite1,"static",{isSensor = true})
					gameGroup:insert(trainingtelewhite1)
					teletouch = false
					trainingtelewhite1.collision = onTeleporter1Touch
					trainingtelewhite1:addEventListener("collision",trainingtelewhite1)	
					teleWidth = data.width
					teleHeight = data.height
					trainingtelewhite1.isBodyActive = false
					trainingtelewhite1.isVisible = false											
				
					trainingtelewhite2 = display.newImageRect(data.src, data.width, data.height)
					trainingtelewhite2.id = data.id2
					trainingtelewhite2.x = data.x2
					trainingtelewhite2.y = data.y2
					trainingtelewhite2.rotations = data.rotateAngle2
					trainingtelewhite2.xo = data.x1
					trainingtelewhite2.yo = data.y1
					trainingtelewhite2.rotationo = data.rotateAngle1
					trainingtelewhite2.myName = data.myName2
					trainingtelewhite2:rotate(-data.rotateAngle2)
					physics.addBody(trainingtelewhite2,"static",{isSensor = true})
					gameGroup:insert(trainingtelewhite2)
					trainingtelewhite2.collision = onTeleporter2Touch
					trainingtelewhite2:addEventListener("collision",trainingtelewhite2)
					teleWidth = data.width
					teleHeight = data.height
					trainingtelewhite2.isBodyActive = false
					trainingtelewhite2.isVisible = false							
				end
				
				if data.id1 == "teleporteryellow-1" then
					trainingteleyellow1 = display.newImageRect(data.src, data.width, data.height)
					trainingteleyellow1.id = data.id1
					trainingteleyellow1.x = data.x1
					trainingteleyellow1.y = data.y1
					trainingteleyellow1.rotations = data.rotateAngle1
					trainingteleyellow1.xo = data.x2
					trainingteleyellow1.yo = data.y2
					trainingteleyellow1.rotationo = data.rotateAngle2
					trainingteleyellow1.myName = data.myName1
					trainingteleyellow1:rotate(-data.rotateAngle1)
					physics.addBody(trainingteleyellow1,"static",{isSensor = true})
					gameGroup:insert(trainingteleyellow1)
					teletouch = false
					trainingteleyellow1.collision = onTeleporter1Touch
					trainingteleyellow1:addEventListener("collision",trainingteleyellow1)	
					teleWidth = data.width
					teleHeight = data.height
					trainingteleyellow1.isBodyActive = false
					trainingteleyellow1.isVisible = false											
				
					trainingteleyellow2 = display.newImageRect(data.src, data.width, data.height)
					trainingteleyellow2.id = data.id2
					trainingteleyellow2.x = data.x2
					trainingteleyellow2.y = data.y2
					trainingteleyellow2.rotations = data.rotateAngle2
					trainingteleyellow2.xo = data.x1
					trainingteleyellow2.yo = data.y1
					trainingteleyellow2.rotationo = data.rotateAngle1
					trainingteleyellow2.myName = data.myName2
					trainingteleyellow2:rotate(-data.rotateAngle2)
					physics.addBody(trainingteleyellow2,"static",{isSensor = true})
					gameGroup:insert(trainingteleyellow2)
					trainingteleyellow2.collision = onTeleporter2Touch
					trainingteleyellow2:addEventListener("collision",trainingteleyellow2)
					teleWidth = data.width
					teleHeight = data.height
					trainingteleyellow2.isBodyActive = false
					trainingteleyellow2.isVisible = false							
				end
				
				
			else
				
				for key,data in pairs(leveldata.teleporters) do
					local tele1 = display.newImageRect(data.src, data.width, data.height)		
					tele1.id = data.id1
					tele1.x = data.x1
					tele1.y = data.y1
					tele1.rotations = data.rotateAngle1
					tele1.xo = data.x2
					tele1.yo = data.y2
					tele1.rotationo = data.rotateAngle2
					tele1.myName = data.myName1
					tele1:rotate(-data.rotateAngle1)
					tele1.isVisible = true
					physics.addBody(tele1,"static",{isSensor = true})
					gameGroup:insert(tele1)
					teletouch = false
					tele1.collision = onTeleporter1Touch
					tele1:addEventListener("collision",tele1)



					local tele2 = display.newImageRect(data.src, data.width, data.height)
					tele2.id = data.id2
					tele2.x = data.x2
					tele2.y = data.y2
					tele2.rotations = data.rotateAngle2
					tele2.xo = data.x1
					tele2.yo = data.y1
					tele2.rotationo = data.rotateAngle1
					tele2.myName = data.myName2
					tele2:rotate(-data.rotateAngle2)
					tele2.isVisible = true
					physics.addBody(tele2,"static",{isSensor = true})
					gameGroup:insert(tele2)
					tele2.collision = onTeleporter2Touch
					tele2:addEventListener("collision",tele2)


					teleWidth = data.width
					teleHeight = data.height


				end
				
				
					
			end
			
			
					
			
			
		end	
		

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
			
			if leveldata.restartLevel == "1-1" then
				bomb.isBodyActive = true
				bomb.isVisible = true
				
			end
		end
			
		--Create Stone
		for key,data in pairs(leveldata.stones) do 
			
			stone_obj = display.newImageRect(data.src, data.width, data.height)
			stone_obj.x = data.x
			stone_obj.y = data.y
			if data.rotate ~= nil then
			stone_obj:rotate(data.rotate)
			end
			stone_obj.myName = data.myName
			physics.addBody(stone_obj, data.bodyType, {density=properties[data.density], bounce=data.bounce, friction = data.friction, shape=properties[data.shape]})
			gameGroup:insert(stone_obj)
			
			if leveldata.restartLevel == "1-1" then
				stone_obj.isBodyActive = false
				stone_obj.isVisible = false
			end
			
		end
		
		--Create Metal
		for key,data in pairs(leveldata.metals) do 
			
			metal_obj = display.newImageRect(data.src, data.width, data.height)
			metal_obj.x = data.x
			metal_obj.y = data.y
			if data.rotate ~= nil then
			metal_obj:rotate(data.rotate)
			end
			metal_obj.myName = data.myName
			physics.addBody(metal_obj, data.bodyType, {density=properties[data.density], bounce=data.bounce, friction = data.friction, shape=properties[data.shape]})
			gameGroup:insert(metal_obj)
			
			if leveldata.restartLevel == "1-1" then
				metal_obj.isBodyActive = false
				metal_obj.isVisible = false
			end
			
		end
		
		--Create Gem
		for key,data in pairs(leveldata.gems) do 
			
				gem_obj = display.newImageRect(data.src, data.width, data.height)
				gem_obj.x = data.x
				gem_obj.y = data.y
				gem_obj:rotate(math.random(0, 360))
				gem_obj.alpha = .85
				
				gem_obj.myName = data.myName
				physics.addBody(gem_obj, data.bodyType)
				gem_obj.isSensor = true
				gameGroup:insert(gem_obj)
				
				if leveldata.restartLevel == "1-1" then
					gem_obj.isBodyActive = false
					gem_obj.isVisible = false
				end
		end
		
		for key,data in pairs(leveldata.lifegems) do 
			
				lifegem_obj = display.newImageRect(data.src, data.width, data.height)
				lifegem_obj.x = data.x
				lifegem_obj.y = data.y
				lifegem_obj:rotate(math.random(0, 360))
				lifegem_obj.alpha = .85
			
				lifegem_obj.myName = data.myName
				physics.addBody(lifegem_obj, data.bodyType)
				lifegem_obj.isSensor = true
				gameGroup:insert(lifegem_obj)
				
				if leveldata.restartLevel == "1-1" then
					lifegem_obj.isBodyActive = false
					lifegem_obj.isVisible = false
				end
		end
		
		--Create Wood
		for key,data in pairs(leveldata.woods) do 
			if data.myName == "switch" then
				switch_obj = display.newImageRect(data.src, data.width, data.height)
				switch_obj.x = data.x
				switch_obj.y = data.y
				if data.rotate ~= nil then
				switch_obj:rotate(data.rotate)
				end
			
				switch_obj.myName = data.myName
				physics.addBody(switch_obj, data.bodyType, {density=properties[data.density], bounce=data.bounce, friction = data.friction, shape=properties[data.shape]})
				gameGroup:insert(switch_obj)
				
				if leveldata.restartLevel == "1-1" then
					switch_obj.isBodyActive = false
					switch_obj.isVisible = false
				end
			else
				wood_obj = display.newImageRect(data.src, data.width, data.height)
				wood_obj.x = data.x
				wood_obj.y = data.y
				if data.rotate ~= nil then
				wood_obj:rotate(data.rotate)
				end
			
				wood_obj.myName = data.myName
				physics.addBody(wood_obj, data.bodyType, {density=properties[data.density], bounce=data.bounce, friction = data.friction, shape=properties[data.shape]})
				gameGroup:insert(wood_obj)
				
				if leveldata.restartLevel == "1-1" then
					wood_obj.isBodyActive = false
					wood_obj.isVisible = false
				end
			end
			
		end
		
		--Create Portal
		portal = display.newImageRect(leveldata.portal.src, leveldata.portal.width, leveldata.portal.height)
		portal.alpha = .01
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
		
		
		for key,data in pairs(leveldata.blackHoles) do 
		
			blackhole_obj = display.newImageRect(data.src, data.width, data.height)
			blackhole_obj.x = data.x
			blackhole_obj.y = data.y
			blackhole_obj.myName = data.myName
			levelGroup:insert(blackhole_obj)
			
			if leveldata.restartLevel == "1-1" then
				blackhole_obj.isBodyActive = false
				blackhole_obj.isVisible = false
			end
		
		end
		
		for key,data in pairs(leveldata.whiteHoles) do 
		
			whitehole_obj = display.newImageRect(data.src, data.width, data.height)
			whitehole_obj.x = data.x
			whitehole_obj.y = data.y
			whitehole_obj.myName = data.myName
			levelGroup:insert(whitehole_obj)
			
			if leveldata.restartLevel == "1-1" then
				whitehole_obj.isBodyActive = false
				whitehole_obj.isVisible = false
			end
		
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
				if audio.isChannelActive( 2 ) then
					audio.pause(2)
				end
				
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
			--Saves data
			local path = system.pathForFile( _G.filesavepathname, system.DocumentsDirectory )                
			local file = io.open( path, "w+b" )
			-- Creates the file where we save our data

			file:write( _G.highestLevel1..", ".._G.levelTracker1..", ".._G.highestWorld)          
			io.close( file )
			if system.getInfo( "environment" ) == "device" then
				-- prevents iOS 4+ multi-tasking crashes
				os.exit()
			end
		end
	end
	
	local gameInit = function()
	
		-- resumeStart() 
		if audio.isChannelActive( 2 ) then
			audio.resume(2)
		else
			
			levelBackgroundMusicTable = {"SnakesOnTheTake.mp3","ShesWarpedAgain.mp3","LightSpeed.mp3","HurryScurry.mp3"}
			indexOfLevelBackgroundMusicTable = math.random(#levelBackgroundMusicTable)
			levelBackgroundMusicName = levelBackgroundMusicTable[indexOfLevelBackgroundMusicTable]
			levelBackgroundMusic = audio.loadStream("soundfx/backgroundMusic/"..levelBackgroundMusicName)
			backgroundMusicChannel = audio.play(levelBackgroundMusic, { channel=2, loops=0, onComplete=BackgroundMusicMix }  )
			audio.setVolume( 0.327, { channel=2 } )
			
		end
			
		-- PHYSICS
		physics.start( true )
		physics.setDrawMode( "normal" )	-- set to "debug" or "hybrid" to see collision boundaries
		physics.setGravity( 0, 0 )	--> 0, 9.8 = Earth-like gravity

		-- Particles.StartAutoUpdate()

		
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
		
		-- FXLibrary.CleanUp()
		-- Particles.CleanUp()
	
		Particles.CreateEmitter("PortalEmitter", leveldata.portal.x, leveldata.portal.y, 0,false, false, false) 
		gameGroup:insert(Particles.GetEmitter("PortalEmitter"))
		FXLibrary.AttachExitExplosionEndless("PortalEmitter")
		
		
		for key,data in pairs(leveldata.bombs) do
			bombstring = "BombEmitter" .. data.bombIndex
			Particles.CreateEmitter(bombstring, data.x, data.y, 0,false, false, false) 
			gameGroup:insert(Particles.GetEmitter(bombstring))
			FXLibrary.AttachExplosionHighPerformance(bombstring)
		end
		
		for key,data in pairs(leveldata.teleporters) do
			Particles.CreateEmitter("Teleporter1Emitter", data.x1, data.y1, 0,false, false, false) 
			gameGroup:insert(Particles.GetEmitter("Teleporter1Emitter"))
			FXLibrary.AttachSparks("Teleporter1Emitter")
			Particles.CreateEmitter("Teleporter2Emitter", data.x2, data.y2, 0,false, false, false) 
			gameGroup:insert(Particles.GetEmitter("Teleporter2Emitter"))
			FXLibrary.AttachSparks("Teleporter2Emitter")
		end
		
		-- LOAD BEST SCORE FOR THIS LEVEL
		local bestScoreFilename = "level"..restartLevel .. ".data"
		local loadedBestScore = loadValue( bestScoreFilename )	--> restarLevel should be "1" or "2", etc.
		
		bestScore = tonumber(loadedBestScore)
		
		-- START EVENT LISTENERS
		Runtime:addEventListener( "touch", onScreenTouch )
		Runtime:addEventListener( "enterFrame", gameLoop )
		Runtime:addEventListener( "system", onSystem )
		
		local startTimer = timer.performWithDelay( 1, function() startNewRound(); end, 1 )
	end
	
	clean = function()
		-- STOP PHYSICS ENGINE
		physics.stop()
		if audio.isChannelActive( 2 ) then
			audio.pause(2)
		end
		



		-- BombEmitter = nil
		-- PortalEmitter = nil
		-- Teleporter1Emitter = nil
		-- Teleporter2Emitter = nil
		
		if portalOpen == true then
			Particles.StopEmitter("PortalEmitter")
			-- Particles.DeleteEmitter("PortalEmitter")
		end
		FXLibrary.CleanUp()
		Particles.CleanUp()
		
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
