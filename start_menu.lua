module(..., package.seeall)

-- Main function - MUST return a display.newGroup()
function new()
	backgroundMusic = audio.loadStream("soundfx/Buildup.m4a")
	backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=0 }  )  -- play the background music on channel 1, loop infinitely, and fadein over 5 seconds 
	
	local ui = require("ui")
	-- AUDIO
	local tapSound = audio.loadSound( "soundfx/SpaceShipFlyBy.wav" )
	
	local localGroup = display.newGroup()
	local isLevelSelection = false
	
	-- Background
	local background = display.newImageRect("images/background.png",480,320)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	localGroup:insert(background)
	

  local startButton = nil
  local function onStart ( event )
    if event.phase == "release" and startButton.isActive then
	  audio.stop(backgroundMusicChannel)	
      director:changeScene("world_select", "fade", 0,0,0)
	
		audio.play( tapSound )
	
    end
  end	
  startButton = ui.newButton{
	defaultSrc = "images/start_button.png",
	defaultX =0.55*367,
	defaultY =0.55*188,
	overSrc = "images/start_button_over.png",
	onEvent = onStart,
	overX = 0.55*367,
	overY = 0.55*188,
	id = "start_button"
	}
	
	-- startButton:scale(.50,.50)
	startButton.x = display.contentWidth/2 
	startButton.y = display.contentHeight*0.8
	startButton.isActive = true
	localGroup:insert(startButton)
 
					
	unloadMe = function()
	end
						
	-- MUST return a display.newGroup()
	return localGroup
end
