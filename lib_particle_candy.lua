module (..., package.seeall)

--[[
----------------------------------------------------------------
PARTICLE CANDY FOR CORONA SDK
----------------------------------------------------------------
PRODUCT  :		PARTICLE CANDY EFFECTS ENGINE
VERSION  :		1.0.07
AUTHOR   :		MIKE DOGAN / X-PRESSIVE.COM
WEB SITE :		http:www.x-pressive.com
SUPPORT  :		info@x-pressive.com
PUBLISHER:		X-PRESSIVE.COM
COPYRIGHT:		(C)2010 MIKE DOGAN GAMES & ENTERTAINMENT

----------------------------------------------------------------

PLEASE NOTE:
A LOT OF HARD AND HONEST WORK HAS BEEN SPENT
INTO THIS PROJECT AND WE'RE STILL WORKING HARD
TO IMPROVE IT FURTHER.
IF YOU DID NOT PURCHASE THIS SOURCE LEGALLY,
PLEASE ASK YOURSELF IF YOU DID THE RIGHT AND
GET A LEGAL COPY (YOU'LL BE ABLE TO RECEIVE
ALL FUTURE UPDATES FOR FREE THEN) TO HELP
US CONTINUING OUR WORK. THE PRICE IS REALLY
FAIR. THANKS FOR YOUR SUPPORT AND APPRECIATION.

FOR FEEDBACK & SUPPORT, PLEASE CONTACT:
INFO@X-PRESSIVE.COM

]]--



----------------------------------------------------------------
-- CHANGE THIS TO YOUR NEEDS:
----------------------------------------------------------------
local debug				= true
local gGravity			= 0.98
local gEmitterColorR	= 255
local gEmitterColorG	= 255
local gEmitterColorB	= 255
local gFXFieldColorR	= 0
local gFXFieldColorG	= 255
local gFXFieldColorB	= 255


----------------------------------------------------------------
-- DO NOT CHANGE ANYTHING BELOW THIS LINE 
-- UNLESS YOU KNOW WHAT YOU ARE DOING !
----------------------------------------------------------------
local PI 				= 4*math.atan(1)
local gLastTime			= system.getTimer()
local gSuspTime			= 0	-- THE MOMENT WHEN PARTICLE SYSTEM HAS BEEN FROZEN
local gLostTime			= 0 -- TIME PASSED IN ALL FROZEN PHASES TOGETHER
local gAdvance			= 0
local gSystemFrozen		= false
local gParticlesRendered= 0
local Emitters 			= {}
local EmitterIndex		= {}
local FXFields			= {}
local FXFieldIndex		= {}
local ParticleTypes		= {}
local ParticleTypeIndex	= {}
local Particles			= {}
local gMaxParticles		= 0
local gSpriteAPI		= nil

local Abs  				= math.abs
local Cos  				= math.cos
local Sin  				= math.sin
local Rnd  				= math.random
local Ceil 				= math.ceil
local Atan2 			= math.atan2

local gScrW 			= display.contentWidth
local gScrH 			= display.contentHeight

if debug then print(); print(); print("--> PARTICLE SYSTEM READY. LET'S ROCK."); end


----------------------------------------------------------------
-- SET DEBUG MODE
----------------------------------------------------------------
function EnableDebug(state)
	debug = state == true and true or false
end

----------------------------------------------------------------
-- CREATE A NEW FX FIELD
-- MODE 0: ATTRACT PARTICLES
-- MODE 1: REJECT  PARTICLES
-- MODE 2: KILL    PARTICLES
----------------------------------------------------------------
function CreateFXField(name, mode, x, y, strength, radius, visible, fxID)

	-- NAME ALREADY EXISTS?
	if FXFields[name] ~= nil then
		print ("!!! Particles.CreateFXField(): FX FIELD '"..name.."' NOT CREATED - (ALREADY EXISTS)! NAME MUST BE UNIQUE.") 
		return
	end
	
	-- ADD NAME TO LIST OF EMITTERS
	table.insert(FXFieldIndex, name)

	fxID	= fxID		~= nil and fxID or 0
	visible	= visible  	== true and true or false
	mode	= mode 		~= nil and mode or 0
	strength= strength 	~= nil and strength or 1.0
	radius	= radius   	~= nil and radius or 1.0
	
	-- NEW EMITTER
	--if mode < 3 then 
		FXFields[name] = display.newCircle(x,y, radius)
	--else
	--	FXFields[name] = display.newRect  (x,y, strength, radius)
	--end
	FXFields[name]:setFillColor(0,0,0,0)
	FXFields[name].name			= name
	FXFields[name].strokeWidth	= 1
	FXFields[name]:setStrokeColor (gFXFieldColorR,gFXFieldColorG,gFXFieldColorB)
	FXFields[name].x	  		= x
	FXFields[name].y	 		= y
	FXFields[name].isVisible 	= visible
	FXFields[name].mode	  		= mode
	FXFields[name].strength  	= strength
	FXFields[name].radius	 	= radius
	FXFields[name].fxID			= fxID
	if debug then print ("--> Particles.CreateFxField(): ADDED FX FIELD '"..name.."'") end
end

----------------------------------------------------------------
-- RETURN FX FIELD OBJECT (OR NIL, IF IT DOESN'T EXIST)
----------------------------------------------------------------
function GetFXField(name)
	return FXFields[name]
end

----------------------------------------------------------------
-- DELETE FX FIELD
----------------------------------------------------------------
function DeleteFXField(name)

	if FXFields[name] ~= nil then
		-- REMOVE NAME FROM FX FIELDS LIST
		local i,v = 0
		for i,v in ipairs(FXFieldIndex) do
			if v == name then table.remove(FXFieldIndex, i); break end
		end

		-- REMOVE FX FIELD
		FXFields[name]:removeSelf()
		FXFields[name] = nil
		if debug then print ("--> Particles.DeleteFXField(): DELETED FX FIELD '"..name.."'") end
		return
	end

	print ("!!! Particles.DeleteFXField(): COULD NOT DELETE FX FIELD '"..name.."' (NOT FOUND)") 
end

----------------------------------------------------------------
-- CREATE A NEW EMITTER
----------------------------------------------------------------
function CreateEmitter(name, x, y, rotation, visible, loop, autoDestroy)

	-- NAME ALREADY EXISTS?
	if Emitters[name] ~= nil then
		print ("!!! Particles.CreateEmitter(): EMITTER '"..name.."' NOT CREATED - (ALREADY EXISTS)! NAME MUST BE UNIQUE.") 
		return
	end
	
	-- ADD NAME TO LIST OF EMITTERS
	table.insert(EmitterIndex, name)
	
	-- NEW EMITTER
	Emitters[name] = display.newLine(0,0, 16,0)
	Emitters[name]:setColor (gEmitterColorR,gEmitterColorG,gEmitterColorB)
	Emitters[name]:append   (8,-24, 0,0)
	Emitters[name].name				= name	-- EMITTER NAME
	Emitters[name].PTypes			= {}	-- REFERENCE TO A PARTICLE TYPE (ParticleTypes{})
	Emitters[name].PTypeIndex   	= {}	-- STRING ARRAY CONTAINING THE NAMES OF ATTACHED PARTICLE TYPES
	Emitters[name].PTypeSettings	= {}	-- OBJECT ARRAY CONTAINING EMISSION SETTINGS FOR EACH ATTACHED PARTICLE TYPE
	Emitters[name].active			= false -- TRUE WHEN STARTED, FALSE WHEN FINISHED COMPLETELY
	Emitters[name].startTime		= 0		-- TIME THE EMITTER HAS BEEN STARTED
	Emitters[name].scale			= 1.0
	Emitters[name].Listener			= nil 	-- LISTENER FUNCTION CALLED WHEN AN EMITTED PARTICLE DIES
	Emitters[name].x	  			= x
	Emitters[name].y	 			= y
	Emitters[name].xOrigin			= x-8
	Emitters[name].xReference		= 8
	Emitters[name].width 			= 1
	Emitters[name].isVisible 		= visible  		== true and true or false
	Emitters[name].loop		 		= loop	   		== true and true or false
	Emitters[name].autoDestroy 		= autoDestroy 	== true and true or false
	Emitters[name].rotation  		= rotation ~= nil and rotation or 0
	Emitters[name].oneShot			= false

	Emitters[name].Sound 			= nil
	Emitters[name].SoundProperties  = nil
	Emitters[name].soundAutoStop	= false
	Emitters[name].soundDelay		= 0
	Emitters[name].soundChannel		= 0
	
	if debug then print ("--> Particles.CreateEmitter(): ADDED EMITTER '"..name.."'") end
end

----------------------------------------------------------------
-- DELETE EMITTER
----------------------------------------------------------------
function DeleteEmitter(name)

	--print ("INDEX: "..table.concat(EmitterIndex, ", "))

	if Emitters[name] ~= nil then
		-- REMOVE NAME FROM EMITTER LIST
		local i,v = 0
		for i,v in ipairs(EmitterIndex) do
			if v == name then table.remove(EmitterIndex, i); break end
		end

		-- REMOVE EVENT LISTENER?	
		if Emitters[name].Listener ~= nil then 
			Runtime:removeEventListener( "particleKilled", Emitters[name].Listener )
			Emitters[name].Listener = nil
		end
		
		-- REMOVE EMITTER SOUND
		Emitters[name].Sound 			= nil
		Emitters[name].SoundProperties  = nil

		-- REMOVE EMITTER
		Emitters[name].PTypes   	= nil
		Emitters[name].PTypeIndex	= nil
		Emitters[name].PTypeSettings= nil
		Emitters[name]:removeSelf()
		Emitters[name] 				= nil
		if debug then print ("--> Particles.DeleteEmitter(): DELETED EMITTER '"..name.."'") end
		return
	end

	print ("!!! Particles.DeleteEmitter(): COULD NOT DELETE EMITTER '"..name.."' (NOT FOUND)") 
end

----------------------------------------------------------------
-- LIST EMITTERS
----------------------------------------------------------------
function ListEmitters()

	local i, pName, pValue, eName, eValue
	
	print ()
	print ("---------------------------")
	print (#ParticleTypeIndex.." PARTICLE TYPES:")

	for pName,pValue in pairs(ParticleTypes) do 
		print("- '"..pName.."'")
	end

	print ()
	print (#EmitterIndex.." EMITTERS:")
	for eName,eValue in pairs(Emitters) do 
		print ()
		print ("EMITTER: '"..Emitters[eName].name.."'")
		
		for i,pValue in ipairs(Emitters[eName].PTypeIndex) do
			print ("|-"..pValue.."'")
		end
	end
	print ("---------------------------")
	print ()
end

----------------------------------------------------------------
-- START EMITTER
----------------------------------------------------------------
function StartEmitter(name, oneShotMode)

	if gSystemFrozen then
		print ("!!! Particles.StartEmitter(): CANNOT START EMITTER WHILE SYSTEM IS FROZEN. RESUME FIRST!")
		return
	end

	if Emitters[name] == nil then 
		print ("!!! Particles.StartEmitter(): EMITTER '"..name.."' NOT FOUND!")
		return
	end
	
	local now = system.getTimer() - gLostTime
	local PSettings, j, pName
	
	Emitters[name].active		= true
	Emitters[name].startTime	= now
	Emitters[name].oneShot		= oneShotMode == true and true or false
	Emitters[name].soundChannel = 0
	
	-- PRE-CALCULATE START AND END TIME FOR ATTACHED PARTICLE TYPES
	for j,pName in ipairs(Emitters[name].PTypeIndex) do
		PSettings 					= Emitters[name].PTypeSettings[pName]
		PSettings.startTime 		= now + PSettings.delay
		PSettings.endTime   		= now + PSettings.delay + PSettings.duration
		PSettings.particlesToEmit	= 0
		PSettings.active 			= true
	end
	
	if debug then print ("--> Particles.StartEmitter(): EMITTER '"..name.."' STARTED.") end
end

----------------------------------------------------------------
-- STOP EMITTER
----------------------------------------------------------------
function StopEmitter(name)

	if Emitters[name] == nil then 
		print ("!!! Particles.StopEmitter(): EMITTER '"..name.."' NOT FOUND!")
		return
	end
	
	-- STOP SOUND?
	if Emitters[name].soundAutoStop == true and Emitters[name].soundChannel > 0 then
		audio.stop(Emitters[name].soundChannel)
		Emitters[name].soundChannel = 0
	end
	
	local j, pName
	for j,pName in ipairs(Emitters[name].PTypeIndex) do
		Emitters[name].PTypeSettings[pName].active = false
	end
	
	Emitters[name].active 		= false

	if debug then print ("--> Particles.StopEmitter(): EMITTER '"..name.."' STOPPED.") end
end

----------------------------------------------------------------
-- RETURN EMITTER OBJECT (OR NIL, IF IT DOESN'T EXIST)
----------------------------------------------------------------
function GetEmitter(name)
	return Emitters[name]
end

----------------------------------------------------------------
-- CHECK IF AN EMITTER IS ACTIVE
----------------------------------------------------------------
function EmitterIsActive(name)

	if Emitters[name] ~= nil then return Emitters[name].active end

	print ("!!! Particles.EmitterIsActive(): COULD NOT FIND EMITTER '"..name.."'") 
end

----------------------------------------------------------------
-- SET EMITTER SCALE
----------------------------------------------------------------
function SetEmitterScale(name, scale)

	if Emitters[name] ~= nil then 
		Emitters[name].scale  = scale
		Emitters[name].xScale = scale
		Emitters[name].yScale = scale
		return 
	end

	print ("!!! Particles.SetEmitterScale(): COULD NOT FIND EMITTER '"..name.."'") 
end

----------------------------------------------------------------
-- GET EMITTER SCALE
----------------------------------------------------------------
function GetEmitterScale(name, scale)

	if Emitters[name] ~= nil then return Emitters[name].scale end

	print ("!!! Particles.GetEmitterScale(): COULD NOT FIND EMITTER '"..name.."'") 
end

----------------------------------------------------------------
-- ADD EMITTER LISTENER
----------------------------------------------------------------
function SetEmitterListener(name, Listener)

	if Emitters[name] ~= nil then 

		-- UNREGISTER PREVIOUS LISTENER?
		if Emitters[name].Listener ~= nil then
			Runtime:removeEventListener( "particleKilled", Emitters[name].Listener ) 
			Emitters[name].Listener = nil
		end

		-- REGISTER NEW LISTENER?
		if Listener ~= nil then
			Emitters[name].Listener = Listener
			Runtime:addEventListener( "particleKilled", Emitters[name].Listener ) 
		end
		return
	end

	print ("!!! Particles.SetEmitterListener(): COULD NOT FIND EMITTER '"..name.."'") 
end

----------------------------------------------------------------
-- ADD EMITTER SOUND EFFECT
----------------------------------------------------------------
function SetEmitterSound(name, SoundID, delay, autoStop, SoundProperties)

	if Emitters[name] ~= nil then 
	
		-- DETACH A SOUND?
		if soundID == nil and autoStop == nil and SoundProperties == nil then
			Emitters[name].Sound 			= nil
			Emitters[name].SoundProperties	= nil
			Emitters[name].soundAutoStop	= false
			Emitters[name].soundDelay		= 0
			if debug then print ("--> Particles.SetEmitterSound(): REMOVED SOUND FROM EMITTER '"..name.."'.") end
			return
		end

		-- ATTACH NEW SOUND
		if SoundID ~= nil then
			if SoundProperties == nil then SoundProperties = { channel = 1, loops = 1, fadeIn = 1000 } end
			Emitters[name].Sound 			= nil
			Emitters[name].SoundProperties	= nil
			Emitters[name].Sound 			= SoundID
			Emitters[name].SoundProperties  = SoundProperties
			Emitters[name].soundDelay  		= delay ~= nil and delay or 0
			Emitters[name].soundAutoStop	= autoStop 	== true and true or false
			if debug then print ("--> Particles.SetEmitterSound(): ATTACHED SOUND TO EMITTER '"..name.."'.") end
			return
		end

	end

	print ("!!! Particles.SetEmitterSound(): COULD NOT FIND EMITTER '"..name.."' OR MISSING SOUND ID.") 
end

----------------------------------------------------------------
-- PRIVATE: CONVERT TIME-RELEVANT PROPERTIES OF 
-- A PARTICLE TYPE TO CHANGES PER MILLISECS
----------------------------------------------------------------
local function PrepareParticleSettings(name)

	if ParticleTypes[name] == nil then
		print ("!!! Particles.PrepareParticleSettings(): PARTICLE TYPE '"..name.."' NOT FOUND!")
		return
	end
	
	-- AVOID ANNOYING WARNINGS
	if ParticleTypes[name].scaleStart <= 0.0 then ParticleTypes[name].scaleStart = 0.0001 end

	-- TIME-RELEVANT PROPERTIES, CONVERTED TO CHANGE PER MILLISECS
	ParticleTypes[name].vs = ParticleTypes[name].velocityStart  	/ 1000
	ParticleTypes[name].vc = ParticleTypes[name].velocityChange 	/ 1000
	ParticleTypes[name].vv = ParticleTypes[name].velocityVariation 	/ 1000
	ParticleTypes[name].rc = ParticleTypes[name].rotationChange	 	/ 1000
	ParticleTypes[name].fi = ParticleTypes[name].fadeInSpeed	 	/ 1000
	ParticleTypes[name].fo = ParticleTypes[name].fadeOutSpeed	 	/ 1000
	ParticleTypes[name].si = ParticleTypes[name].scaleInSpeed	 	/ 1000
	ParticleTypes[name].so = ParticleTypes[name].scaleOutSpeed	 	/ 1000
	ParticleTypes[name].we = ParticleTypes[name].weight			 	/ 1000
end

----------------------------------------------------------------
-- CREATE A PARTICLE TYPE
----------------------------------------------------------------
function CreateParticleType(name, Properties)

	-- NAME ALREADY EXISTS?
	if ParticleTypes[name] ~= nil then
		print ("!!! Particles.CreateParticleType(): PARTICLE TYPE '"..name.."' NOT CREATED - (ALREADY EXISTS)! NAME MUST BE UNIQUE.")
		return
	elseif Properties == nil or type(Properties) ~= "table" then
		print ("!!! Particles.CreateParticleType(): '"..name.."' NOT CREATED - PLEASE SPECIFY A PROPERTIES TABLE AS PARAMETER!")
		return
	end

	-- ADD NAME TO LIST OF PARTICLE TYPES
	table.insert(ParticleTypeIndex, name)
	
	ParticleTypes[name]			= {}
	ParticleTypes[name].name	= name
	
	-- DEFAULT PROPERTIES
	ParticleTypes[name].imagePath 			= ""
	ParticleTypes[name].imageWidth 			= 16
	ParticleTypes[name].imageHeight			= 16
	ParticleTypes[name].xReference 			= 0
	ParticleTypes[name].yReference 			= 0
	ParticleTypes[name].SpriteSet 			= nil
	ParticleTypes[name].animSequence		= ""
	ParticleTypes[name].weight				= 0.0
	ParticleTypes[name].velocityStart		= 0.0
	ParticleTypes[name].velocityChange		= 0.0
	ParticleTypes[name].velocityVariation	= 0.0
	ParticleTypes[name].directionVariation	= 0.0
	ParticleTypes[name].rotationStart 		= 0
	ParticleTypes[name].rotationVariation	= 0
	ParticleTypes[name].rotationChange		= 0
	ParticleTypes[name].autoOrientation		= false
	ParticleTypes[name].useEmitterRotation	= true
	ParticleTypes[name].alphaStart			= 1.0
	ParticleTypes[name].alphaVariation		= 0.0
	ParticleTypes[name].fadeInSpeed			= 0.0
	ParticleTypes[name].fadeOutSpeed		= 0.0
	ParticleTypes[name].fadeOutDelay		= 0
	ParticleTypes[name].scaleStart			= 1.0
	ParticleTypes[name].scaleVariation		= 0.0
	ParticleTypes[name].scaleInSpeed		= 0.0
	ParticleTypes[name].scaleOutSpeed		= 0.0
	ParticleTypes[name].scaleOutDelay		= 0
	ParticleTypes[name].bounceX				= false
	ParticleTypes[name].bounceY				= false
	ParticleTypes[name].bounciness			= 1.0
	ParticleTypes[name].emissionShape		= 0
	ParticleTypes[name].emissionRadius		= 0
	ParticleTypes[name].killOutsideScreen 	= true 
	ParticleTypes[name].lifeTime			= 1000
	ParticleTypes[name].fxID				= 0
	
	-- SET USER PROPERTIES
	local n,v
	for n,v in pairs(Properties) do ParticleTypes[name][n] = v end

	PrepareParticleSettings (name)
	
	-- PRELOAD IMAGE TO AVOID HICKUPS
	-- ParticleTypes[name].Image = display.newImageRect(imagePath, imageWidth, imageHeight) 
	-- ParticleTypes[name].Image.isVisible = false

	if debug then print ("--> Particles.CreateParticleType(): CREATED PARTICLE TYPE '"..name.."'.") end
end

----------------------------------------------------------------
-- PRIVATE: DELETE A PARTICLE TYPE
-- CAUTION: PARTICLE TYPES MUST NOT BE DELETED IF ANY PARTICLES
--          STILL EXIST. DELETE P.TYPES ONLY USING CLEANUP()!
----------------------------------------------------------------
local function DeleteParticleType(name)

	if ParticleTypes[name] ~= nil then
	
		local i, v, j, w

		-- DETACH FROM EMITTERS
		for i,v in pairs(EmitterIndex) do
			if Emitters[v].PTypes[name] ~= nil then
				-- REMOVE REFERENCES TO PARTCLE TYPE
				Emitters[v].PTypes       [name] = nil
				Emitters[v].PTypeSettings[name] = nil

				-- REMOVE NAME FROM EMITTER'S PARTICLE TYPES INDEX
				for j,w in ipairs(Emitters[v].PTypeIndex) do
					if w == name then table.remove(Emitters[v].PTypeIndex, j); break end
				end
				
				if debug then print ("--> Particles.DeleteParticleType(): REMOVING '"..name.."' FROM EMITTER '"..Emitters[v].name.."'") end
				break
			end
		end
	
		-- REMOVE NAME FROM PARTICLE TYPES LIST
		for i,v in ipairs(ParticleTypeIndex) do
			if v == name then table.remove(ParticleTypeIndex, i); break end
		end

		-- REMOVE PRELOADED IMAGE
		-- ParticleTypes[name].Image:removeSelf()
		-- ParticleTypes[name].Image = nil

		-- REMOVE PARTICLE TYPE
		ParticleTypes[name].SpriteSet 	 = nil
		ParticleTypes[name].TapListener	 = nil
		ParticleTypes[name] 		  	 = nil
		if debug then print ("--> Particles.DeleteParticleType(): DELETED PARTICLE TYPE '"..name.."'") end
		return
	end

	print ("!!! Particles.DeleteEmitter(): COULD NOT DELETE PARTICLE TYPE '"..name.."' (NOT FOUND)") 
end

----------------------------------------------------------------
-- SET A SINGLE PARTICLE TYPE PROPERTY
----------------------------------------------------------------
function SetParticleProperty(name, property, value)

	local PType = ParticleTypes[name]

	if PType ~= nil then
		PType[property] = value
		PrepareParticleSettings (name)
		if debug then print ("--> Particles.SetParticleProperty(): SET "..name.."."..property.." ("..type(value)..").") end
		return
	end
	print ("!!! Particles.SetParticleProperty(): COULD NOT FIND PARTICLE TYPE '"..name.."'") 
end

----------------------------------------------------------------
-- ADD PARTICLE TYPE TO EMITTER
----------------------------------------------------------------
function AttachParticleType(emitterName, particleName, emissionRate, duration, startDelay)

	local Emitter = Emitters      [emitterName ]
	local PType   = ParticleTypes [particleName]

	-- EMITTER EXISTS?
	if Emitter == nil then
		print ("!!! Particles.AddParticleType(): EMITTER '"..emitterName.."' NOT FOUND.") 
		return 
	end

	-- PARTICLE TYPE EXISTS?
	if PType == nil then
		print ("!!! Particles.AddParticleType(): PARTICLE TYPE '"..particleName.."' NOT FOUND.") 
		return 
	end
	
	local i, v
	
	-- CHECK IF ALREADY ATTACHED
	for i,v in ipairs(Emitter.PTypeIndex) do
		if v == particleName then 
			print ("!!! Particles.AddParticleType(): PARTICLE TYPE '"..particleName.."' ALREADY ATTACHED TO EMITTER '"..emitterName.."'.")
			return
		end
	end

	-- ADD NAME TO LIST OF ATTACHED PARTICLE TYPES
	table.insert(Emitter.PTypeIndex, particleName)

	-- ATTACH PARTICLE TYPE
	Emitter.PTypes[particleName]   		= PType
	Emitter.PTypeSettings[particleName] = {}
	Emitter.PTypeSettings[particleName].name 			= particleName
	Emitter.PTypeSettings[particleName].emissionRate 	= emissionRate / 1000.0
	Emitter.PTypeSettings[particleName].delay 	 	 	= startDelay
	Emitter.PTypeSettings[particleName].duration 	 	= duration
	Emitter.PTypeSettings[particleName].startTime 	 	= 0
	Emitter.PTypeSettings[particleName].endTime 	 	= 0
	Emitter.PTypeSettings[particleName].particlesToEmit	= 0
	Emitter.PTypeSettings[particleName].active			= false
	if debug then print ("--> Particles.AddParticleType(): ADDED PARTICLE TYPE '"..particleName.."' TO EMITTER '"..emitterName.."'.") end
end


----------------------------------------------------------------
-- DETACH PARTICLE TYPE(S) FROM EMITTER
----------------------------------------------------------------
function DetachParticleTypes(emitterName, particleName, keepSound)

	local Emitter = Emitters [emitterName]
	local num	  = 0
	local i, v

	-- EMITTER EXISTS?
	if Emitter == nil then
		print ("!!! Particles.RemoveParticleType(): EMITTER '"..emitterName.."' NOT FOUND.") 
		return 
	end
	
	-- STOP EMITTER (AND SOUND)
	StopEmitter(emitterName)
	
	-- DELETE ATTACHED SOUND?
	if keepSound ~= true then SetEmitterSound(emitterName) end
	
	-- REMOVE ALL PARTICLE TYPES?
	if particleName == nil or particleName == "" then
		for i,v in ipairs(Emitter.PTypeIndex) do
			Emitter.PTypes       [v] = nil
			Emitter.PTypeSettings[v] = nil
			num = num + 1
		end
		while (#Emitter.PTypeIndex) > 0 do table.remove(Emitter.PTypeIndex, 1) end

	-- REMOVE A CERTAIN PARTICLE TYPE
	else
		-- DETACH FROM EMITTERS
		if Emitter.PTypes[particleName] ~= nil then
			-- REMOVE REFERENCES TO PARTCLE TYPE
			Emitter.PTypes       [particleName] = nil
			Emitter.PTypeSettings[particleName] = nil
			-- REMOVE NAME FROM EMITTER'S PARTICLE TYPES INDEX
			for i,v in ipairs(Emitter.PTypeIndex) do
				if v == particleName then table.remove(Emitter.PTypeIndex, i); break end
			end
			num = 1
		end
	end

	if debug then print ("--> Particles.RemoveParticleType(): REMOVED "..num.." PARTICLE TYPE(S) FROM EMITTER '"..emitterName.."'.") end
end


----------------------------------------------------------------
-- PRIVATE: REMOVE A PARTICLE FROM SCREEN AND MEMORY
----------------------------------------------------------------
local function DeleteParticle(index)

	if Particles[index] ~= nil then
		if Particles[index].PType.TapListener ~= nil then
			Particles[index]:removeEventListener("tap", Particles[index].PType.TapListener)
		end

		Particles[index].Emitter	= nil
		Particles[index].PType		= nil
		Particles[index]:removeSelf()
		Particles[index]			= nil
	end
end

----------------------------------------------------------------
-- REMOVE ALL OR CERTAIN PARTICLES FROM SCREEN AND MEMORY
----------------------------------------------------------------
function ClearParticles()
	
	local i
	
	if emitterName == nil then
		for i = 1, gMaxParticles do DeleteParticle(i)end
	else
		for i=1, gMaxParticles do 
			if Particles[i] ~= nil then
				if Particles[i].emitterName == emitterName then DeleteParticle(i) end
			end
		end
	end

	-- REDUCE MAXPARTICLES
	gMaxParticles = 0

	collectgarbage("collect")

	if debug then print ("--> Particles.ClearParticles()") end
end

----------------------------------------------------------------
-- CLEAN UP
----------------------------------------------------------------
function CleanUp()

	StopAutoUpdate()

	-- DELETE PARTICLES
	ClearParticles()

	-- DELETE FX FIELDS
	while (#FXFieldIndex) > 0 do DeleteFXField(FXFieldIndex[1]) end

	-- DELETE PARTICLE TYPES
	while (#ParticleTypeIndex) > 0 do DeleteParticleType(ParticleTypeIndex[1]) end

	-- DELETE EMITTERS
	while (#EmitterIndex) > 0 do DeleteEmitter(EmitterIndex[1]) end
	
	-- RESET ACCUMULATED FREEZE-TIME
	gLostTime 	  		= 0
	gSystemFrozen 		= false
	gParticlesRendered 	= 0
	gLastTime			= 0
	
	collectgarbage("collect")

	if debug then print ("--> Particles.CleanUp(): FINISHED.") end
end

----------------------------------------------------------------
-- UPDATE
----------------------------------------------------------------
function Update()

	if gSystemFrozen then return end

	local Emitter
	local now 		= system.getTimer() - gLostTime
	local diffTime  = now - gLastTime; gLastTime = now
	local i, j, eName, pName

	-- LOOP EMITTERS
	for i,eName in ipairs(EmitterIndex) do
		Emitter = Emitters[eName]

		if Emitter.active then
		
			-- SOUND ATTACHED?
			if Emitter.Sound ~= nil then
				-- NOT STARTED YET?
				if Emitter.soundChannel == 0 then
					-- START NOW?
					if now-Emitter.startTime > Emitter.soundDelay then
						-- STOP THIS CHANNEL?
						if Emitter.SoundProperties.channel > 0 then audio.stop(Emitter.SoundProperties.channel) end
						-- PLAY SOUND
						Emitter.soundChannel = audio.play(Emitter.Sound, Emitter.SoundProperties)
					end
				end
			end

			-- LOOP EMITTER'S PARTICLE TYPES
			for j,pName in ipairs(Emitter.PTypeIndex) do
				local PType 	= ParticleTypes        [pName]
				local PSettings = Emitter.PTypeSettings[pName]
				
				-- PARTICLE TYPE'S EMISSION STARTED?
				if PSettings.active == true and now > PSettings.startTime then

					-- EMIT PARTICLES OF THIS TYPE?
					if Emitter.oneShot == true then
						PSettings.particlesToEmit = PSettings.emissionRate * 1000.0
					else
						PSettings.particlesToEmit = PSettings.particlesToEmit + diffTime * PSettings.emissionRate
					end

                    while PSettings.particlesToEmit >= 1.0 do
						-- GET NEXT FREE SLOT
						local slot = 1; while Particles[slot] ~= nil do slot = slot + 1 end

						if slot > gMaxParticles then gMaxParticles = slot end

						----------------------------------------
						-- NEW PARTICLE
						----------------------------------------
						if PType.SpriteSet == nil then
							Particles[slot] = display.newImageRect(PType.imagePath,PType.imageWidth,PType.imageHeight)
							Particles[slot].xReference = PType.xReference
							Particles[slot].yReference = PType.yReference
						else
							if gSpriteAPI ~= nil then 
								Particles[slot] = gSpriteAPI.newSprite(PType.SpriteSet)
								Particles[slot]:prepare(PType.animSequence)
								Particles[slot]:play()
							else
								print ("--------------------------------------------------------") 
								print ("!!! Particles.Update(): SPRITE API NOT SET! USE UseSpriteAPI() TO SET A REFERENCE!") 
								print ("--------------------------------------------------------") 
							end
						end

						local ra = PType.emissionRadius * Emitter.scale
						local Particle = Particles[slot]

						-- ADD TAP LISTENER?
						if PType.TapListener ~= nil then
							Particle:addEventListener("tap", PType.TapListener)
						end
						
						if PType.emissionShape == 0 then
							Particle.x 		= Emitter.x
							Particle.y 		= Emitter.y
						elseif PType.emissionShape == 1 then
							local lineAngleL= PI-(Emitter.rotation-90)/360*2*PI
							local lineStep	= Rnd() * ra*2
							Particle.x 		= Emitter.x + (Sin(lineAngleL) * ra) - Sin(lineAngleL) * lineStep
							Particle.y 		= Emitter.y + (Cos(lineAngleL) * ra) - Cos(lineAngleL) * lineStep
						elseif PType.emissionShape == 2 then
							local ringAngle = PI-(Rnd()*360)/360*2*PI
							Particle.x 		= Emitter.x + (Sin(ringAngle) * ra)
							Particle.y 		= Emitter.y + (Cos(ringAngle) * ra)
						elseif PType.emissionShape == 3 then
							local discAngle  = PI-(Rnd()*360)/360*2*PI
							local discRadius = Rnd() * ra
							Particle.x 		 = Emitter.x + (Sin(discAngle) * discRadius)
							Particle.y 		 = Emitter.y + (Cos(discAngle) * discRadius)
						end
						
						Particle.alfa	 	 = PType.alphaStart + Rnd()*PType.alphaVariation
						Particle.scale 		 = PType.scaleStart + Rnd()*PType.scaleVariation
						Particle.emitterAlpha= Emitter.alpha
						Particle.emitterScale= Emitter.scale

						Particle.rotation 	= PType.rotationStart + Ceil(Rnd()*PType.rotationVariation)
						if PType.useEmitterRotation then Particle.rotation = Particle.rotation + Emitter.rotation end
						
						local dirAngle 		= Emitter.rotation - PType.directionVariation*0.5 + Rnd()*PType.directionVariation
						dirAngle			= PI-dirAngle/360*2*PI
						Particle.xSpeed	 	= Sin(dirAngle) * (PType.vs + Rnd()*PType.vv )
						Particle.ySpeed	 	= Cos(dirAngle) * (PType.vs + Rnd()*PType.vv )
						Particle.weight		= PType.we * gGravity
						
						Particle.startTime 	= now
						Particle.killTime 	= now + PType.lifeTime
						Particle.fadeOutTime= now + PType.fadeOutDelay
						Particle.scaleOutTime= now + PType.scaleOutDelay
						Particle.PType		= PType
						Particle.lastX		= Particle.x
						Particle.lastY		= Particle.y
						Particle.emitterName= Emitter.name
						Particle.Listener	= Emitter.Listener
						
						-- ADD TO SAME GROUP AS EMITTER
						Emitter.parent:insert(Particle)

                        PSettings.particlesToEmit = PSettings.particlesToEmit - 1.0
                    end -- /END EMIT PARTICLES
                    
					-- PARTICLE TYPE'S EMISSION FINISHED?
					if now > PSettings.endTime or Emitter.oneShot == true then
                    	PSettings.active = false
                    end
                    
				end -- /END EMISSION STARTED

			end -- /END LOOP ATTACHED PARTICLE TYPES

			-- COUNT ACTIVE PARTICLE TYPES
			local numActive = 0
			for j,pName in ipairs(Emitter.PTypeIndex) do
				if Emitter.PTypeSettings[pName].active == true then numActive = numActive + 1 end
			end
		
			-- EMITTER FINISHED?
			if numActive == 0 then
				if Emitter.loop then 
					StartEmitter(Emitter.name, Emitter.oneShot) 
				else
					StopEmitter (Emitter.name)
					-- AUTODESTROY EMITTER?
					if Emitter.autoDestroy then DeleteEmitter(Emitter.name) end
				end
			end
			
		end -- /END IF EMITTER ACTIVE
		
	end -- /END LOOP EMITTERS
	
	-- ---------------------------------------------------------
	
	gParticlesRendered = 0
	
	-- LOOP PARTICLES
	local maxParticles = gMaxParticles
	for i = 1, maxParticles do

		if Particles[i] ~= nil then
			local PType = Particles[i].PType
			local P		= Particles[i]
			
			gParticlesRendered = gParticlesRendered + 1

			-- MOVEMENT ----------------------------------------
			P.lastX = P.x
			P.lastY = P.y
			P.x 	= P.x + diffTime * (P.xSpeed * P.emitterScale)
			P.y 	= P.y + diffTime * (P.ySpeed * P.emitterScale)
			
			-- VELOCITY CHANGE ---------------------------------
			if PType.vc ~= 0 then
				P.xSpeed = P.xSpeed + (diffTime * (P.xSpeed * PType.vc))
				P.ySpeed = P.ySpeed + (diffTime * (P.ySpeed * PType.vc))
			end

			-- GRAVITY -----------------------------------------
			P.ySpeed = P.ySpeed + diffTime*P.weight

			-- ALPHA CHANGE ------------------------------------
			if now < P.fadeOutTime or PType.fo == 0 then	
				P.alfa = P.alfa + diffTime*(PType.fi) -- FADE IN
			else
				P.alfa = P.alfa + diffTime*(PType.fo) -- FADE OUT
				if P.alfa < 0.0 then P.alfa = 0; P.killTime = now end -- REMOVE WHEN INVISIBLE
			end
			if P.alfa > 1.0 then P.alfa = 1.0 end
			P.alpha = P.emitterAlpha * P.alfa
			
			-- SCALE CHANGE ------------------------------------
			if now < P.scaleOutTime or PType.so == 0 then	
				P.scale = P.scale + diffTime*PType.si -- SCALE IN
			else
				P.scale = P.scale + diffTime*PType.so -- SCALE OUT
				if P.scale < 0.001 then P.scale = 0.001; P.killTime = now end -- REMOVE WHEN INVISIBLE
			end
			P.xScale = P.emitterScale * P.scale
			P.yScale = P.xScale
			
			-- ROTATION ----------------------------------------
			if PType.autoOrientation == false then
				P.rotation = P.rotation + diffTime*(PType.rc)
			else	
				P.rotation = ( Atan2( (P.lastY-P.y), (P.lastX-P.x) ) * (180 / PI) ) - 90 -- ORIENTATE TO MOVEMENT
			end			

			-- LOOP FX FIELDS
			for j,eName in ipairs(FXFieldIndex) do
				Field = FXFields[eName]
				if PType.fxID == Field.fxID then
					local dx = Abs( Field.x - P.x )
					local dy = Abs( Field.y - P.y )
					local dst= (dx*dx + dy*dy)^0.5
					if dst < Field.radius then
						-- ATTRACTOR
						if Field.mode == 0 and dst > 16 then
							local theta = Atan2(Field.y-P.y, Field.x-P.x);
							P.xSpeed = P.xSpeed + (Field.strength / dst) * Cos(theta);
							P.ySpeed = P.ySpeed + (Field.strength / dst) * Sin(theta);
						-- REJECTOR
						elseif Field.mode == 1 then
							local ang= ( Atan2( (Field.y-P.y), (Field.x-P.x) ) * (180 / PI) ) - 90 
							local dir= PI-ang/360*2*PI
							P.xSpeed = Sin(dir) * (Abs(P.xSpeed) * PType.bounciness )
							P.ySpeed = Cos(dir) * (Abs(P.ySpeed) * PType.bounciness )
						-- PARTICLE KILLER
						elseif Field.mode == 2 then
							P.killTime = now
						end

						P.x = P.lastX + P.xSpeed*diffTime
						P.y = P.lastY + P.ySpeed*diffTime
					end
				end
			end -- /END LOOP FX FIELDS

			-- SCREEN BORDER CHECK (BOUNCE OR DIE) ------------
			if PType.killOutsideScreen == true or PType.bounceX == true or PType.bounceY == true then
				local x, y = P:localToContent(0, 0)

				if x < 0 or x > gScrW then
					if PType.bounceX == true then P.xSpeed = (PType.bounciness * P.xSpeed) * -1; P.x = P.lastX elseif PType.killOutsideScreen == true then P.killTime = now end
				elseif y < 0 or y > gScrH then
					if PType.bounceY == true then P.ySpeed = (PType.bounciness * P.ySpeed) * -1; P.y = P.lastY elseif PType.killOutsideScreen == true then P.killTime = now end
				end
			end
			
			-- REMOVE PARTICLE?
			if P.killTime <= now then
				-- SEND EVENT?
				if P.Listener ~= nil then
					local event = 
						{ 
						name 		= "particleKilled", 
						x			= P.x,
						y			= P.y,
						rotation	= P.rotation,
						alpha   	= P.alpha,
						scale	  	= P.xScale,
						xSpeed		= P.xSpeed,
						ySpeed		= P.ySpeed,
						typeName	= PType.name,
						emitterName = P.emitterName
						}
					Runtime:dispatchEvent( event )
				end

				-- DELETE PARTICLE
				DeleteParticle(i); 

			end
		
		end -- /END IF PARTICLE EXISTS

	end -- /END LOOP PARTICLES

	-- ---------------------------------------------------------
	
	-- REDUCE MAXPARTICLES, IF POSSIBLE
	local n = gMaxParticles
	for i = n,1, -1 do
		gMaxParticles = i
		if Particles[i] ~= nil then break end
	end

	--collectgarbage("collect")
end

----------------------------------------------------------------
-- GET NUMBER OF CURRENTLY ACTIVE PARTICLES
----------------------------------------------------------------
function CountParticles()
	return gParticlesRendered
end

----------------------------------------------------------------
-- GET MAXIMUM AMOUNT OF PARTICLES (ALSO THE ONES NOT BEING RENDERED)
----------------------------------------------------------------
function GetMaxParticles(index)
	return gMaxParticles
end

----------------------------------------------------------------
-- RETRIEVE HANDLE OF A SINGLE PARTICLE
----------------------------------------------------------------
function GetParticle(index)
	return Particles[index]
end

----------------------------------------------------------------
-- FREEZE PARTICLE SYSTEM (PAUSE)
----------------------------------------------------------------
function Freeze()

	if gSystemFrozen then return end
	gSystemFrozen 	= true
	gSuspTime 		= system.getTimer()
	if debug then print "--> Particles.Freeze() - PARTICLE SYSTEM FROZEN." end
end

----------------------------------------------------------------
-- UNFREEZE PARTICLE SYSTEM (RESUME)
----------------------------------------------------------------
function WakeUp()

	if gSystemFrozen == false then return end
	gSystemFrozen 	= false
	gLostTime 		= gLostTime + system.getTimer() - gSuspTime
	if debug then print ("--> Particles.WakeUp() - PARTICLE SYSTEM RESUMED.") end
end

----------------------------------------------------------------
-- SET EMITTER COLOR
----------------------------------------------------------------
function SetEmitterColor(r,g,b)

	local i, eName

	gEmitterColorR	= r
	gEmitterColorG	= g
	gEmitterColorB	= b

	for i,eName in ipairs(EmitterIndex) do
		Emitters[eName]:setColor (gEmitterColorR,gEmitterColorG,gEmitterColorB)
	end
end

----------------------------------------------------------------
-- SET REFERENCE TO SPRITE API LOADED BY USER
----------------------------------------------------------------
function UseSpriteAPI(SpriteAPI)

	if SpriteAPI == nil then print("--> Particles.UseSpriteAPI() - SPRITE API NOT FOUND!"); return end

	gSpriteAPI = SpriteAPI

	if debug then print ("--> Particles.UseSpriteAPI() - SPRITE API SET.") end
end

----------------------------------------------------------------
-- START STOP AUTO-UPDATING
----------------------------------------------------------------
function StartAutoUpdate() 
	Runtime:addEventListener( "enterFrame", Update )
end

----------------------------------------------------------------
-- STOP AUTO-UPDATING
----------------------------------------------------------------
function StopAutoUpdate()
	Runtime:removeEventListener( "enterFrame", Update )
end

----------------------------------------------------------------
-- PRIVATE: APPLICATION PAUSED EVENT
----------------------------------------------------------------
local function onSuspend( event )

	if event.type == "applicationSuspend" then
		Freeze()
	elseif event.type == "applicationResume" then
		WakeUp()
	end
end

----------------------------------------------------------------
-- PRIVATE: APPLICATION ROTATE EVENT
----------------------------------------------------------------
local function onRotate( event )

end

Runtime:addEventListener( "system"		, onSuspend )
Runtime:addEventListener( "orientation"	, onRotate )
