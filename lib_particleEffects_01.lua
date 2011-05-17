-- 
-- Abstract: Portal- Physics Game 
-- Designed and created by Brad G Cordova 
-- http://bcordova.com

-- (This is easiest to play on iPad or other large devices, but should work on all iOS and Android devices)
-- 
-- Version: 1.0
--

--particle definitions

module (..., package.seeall)



-- ADJUST THIS TO YOUR NEEDS:
local particleImagesPath = "Particle_Images/"


----------------------------------------------------------------
-- CALL INITIALIZE() ONCE AFTER YOUR LEVEL HAS BEEN LOADED AND BEFORE
-- USING THIS EFFECT LIBRARY. BEFORE UNLOADING YOUR LEVEL, CALL
-- CLEANUP(). INITIALIZE() WILL PRELOAD THE PARTICLE IMAGES USED
-- TO AVOID HICK-UPS DURING YOUR GAME. IT ALSO CREATES ALL PARTICLE
-- TYPES USED.
-- CLEANUP() WILL REMOVE THE PRELOADED IMAGES AGAIN.
----------------------------------------------------------------
local Images = {}
local Sounds = {}

function Initialize()

	-- PRELOAD USED IMAGES TO AVOID SLOW DOWNS  IMAGES WILL STAY 
	-- INVISIBLE ON STAGE AND WILL BE REMOVED WHEN YOU CALL THE 
	-- EFFECT LIBRARIES CLEANUP FUNCTION.
	Images[1]  = display.newImageRect(particleImagesPath.."smoke1_light_dark.png",64,64)
	Images[2]  = display.newImageRect(particleImagesPath.."fireball_medium.png",64,64)
	Images[3]  = display.newImageRect(particleImagesPath.."fireball_bright.png",64,64)
	Images[4]  = display.newImageRect(particleImagesPath.."spark_with_trail.png",32,32)
	Images[5]  = display.newImageRect(particleImagesPath.."flare.png",32,32)
	Images[6]  = display.newImageRect(particleImagesPath.."electric_spark.png",8,32)
	Images[7]  = display.newImageRect(particleImagesPath.."red_spark.png",8,32)
	Images[8]  = display.newImageRect(particleImagesPath.."smoke_whispery_bright.png",64,64)
	Images[9]  = display.newImageRect(particleImagesPath.."fire.png",64,64)
	Images[10] = display.newImageRect(particleImagesPath.."smoke_heavy_bright.png",64,64)
	Images[11] = display.newImageRect(particleImagesPath.."smoke_heavy_dark.png",64,64)
	Images[12] = display.newImageRect(particleImagesPath.."water_spray.png",64,64)
	Images[13] = display.newImageRect(particleImagesPath.."water_fountain.png",64,64)
	Images[14]  = display.newImageRect(particleImagesPath.."exit_fireball_medium.png",64,64)
	Images[15]  = display.newImageRect(particleImagesPath.."exit_fireball_bright.png",64,64)
	Images[16]  = display.newImageRect(particleImagesPath.."exit_spark_with_trail.png",32,32)

	-- PRELOAD USED SOUNDS TO AVOID SLOW DOWNS  SOUNDS WILL STAY 
	-- IN MEMORY UNTIL EFFECT LIBRARIES CLEANUP FUNCTION IS CALLED.
	Sounds[1] = audio.loadSound("Sounds/explosion1.aac")
	Sounds[2] = audio.loadSound("Sounds/sparks.aac")
	Sounds[3] = audio.loadSound("Sounds/explosion_long.aac")
	Sounds[4] = audio.loadSound("Sounds/fire.aac")
	Sounds[5] = audio.loadSound("Sounds/waterfall.aac")
	Sounds[6] = audio.loadSound("Sounds/rain.aac")
	Sounds[7] = audio.loadSound("Sounds/wind.aac")


	-- HIDE THE IMAGES ON STAGE
	local i = 1
	while Images[i] ~= nil do Images[i].isVisible = false; i = i + 1 end

	-- CREATE THE PARTICLE TYPES USED
	Particles.CreateParticleType ("ExplosionSmoke",
		{
		imagePath			= particleImagesPath.."smoke1_light_dark.png",
		imageWidth			= 64,	
		imageHeight			= 64,	
		directionVariation	= 360,	
		velocityVariation	= 50,
		rotationVariation	= 360,
		rotationChange		= 30,
		useEmitterRotation	= false,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= 0.01,
		scaleOutDelay		= 500,
		emissionShape		= 2,
		emissionRadius		= 30,
		killOutsideScreen	= false	,
		lifeTime			= 3000  
		} )


	Particles.CreateParticleType ("FireballSlow", 
		{
		imagePath			= particleImagesPath.."fireball_medium.png",
		imageWidth			= 64,
		imageHeight			= 64,
		directionVariation	= 360,
		velocityStart		= 50,
		velocityVariation	= 25,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		rotationChange		= 20,
		useEmitterRotation	= false,
		alphaStart			= 0.0,
		alphaVariation		= 0.25,
		fadeInSpeed			= 2.0,
		fadeOutSpeed		= -0.75,
		fadeOutDelay		= 500,
		scaleStart			= 0.1,
		scaleVariation		= 0.20,
		scaleInSpeed		= 2.0,
		scaleOutSpeed		= -0.01,
		scaleOutDelay		= 1000,
		emissionShape		= 2,
		emissionRadius		= 5,
		killOutsideScreen	= false,
		lifeTime			= 2000
		} )

	Particles.CreateParticleType ("ExitFireballSlow", 
		{
		imagePath			= particleImagesPath.."exit_fireball_medium.png",
		imageWidth			= 64,
		imageHeight			= 64,
		directionVariation	= 360,
		velocityStart		= 50,
		velocityVariation	= 25,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		rotationChange		= 20,
		useEmitterRotation	= false,
		alphaStart			= 0.0,
		alphaVariation		= 0.25,
		fadeInSpeed			= 2.0,
		fadeOutSpeed		= -0.75,
		fadeOutDelay		= 500,
		scaleStart			= 0.1,
		scaleVariation		= 0.20,
		scaleInSpeed		= 2.0,
		scaleOutSpeed		= -0.01,
		scaleOutDelay		= 1000,
		emissionShape		= 2,
		emissionRadius		= 5,
		killOutsideScreen	= false,
		lifeTime			= 2000
		} )		


	Particles.CreateParticleType ("FireballBright", 
		{
		imagePath			= particleImagesPath.."fireball_bright.png",
		imageWidth			= 64,
		imageHeight			= 64,
		directionVariation	= 360,
		velocityStart		= 75,
		velocityVariation	= 15,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		rotationChange		= -20,
		useEmitterRotation	= false,
		alphaStart			= 1.0,
		alphaVariation		= 0.25,
		fadeInSpeed			= 2.0,
		fadeOutSpeed		= -3.0,
		fadeOutDelay		= 300,
		scaleStart			= 0.1,
		scaleVariation		= 0.20,
		scaleInSpeed		= 3.0,
		scaleOutSpeed		= -0.01,
		scaleOutDelay		= 500,
		emissionShape		= 2,
		emissionRadius		= 30,
		killOutsideScreen	= false	,
		lifeTime			= 2000
		} )
		
	Particles.CreateParticleType ("ExitFireballBright", 
		{
		imagePath			= particleImagesPath.."exit_fireball_bright.png",
		imageWidth			= 64,
		imageHeight			= 64,
		directionVariation	= 360,
		velocityStart		= 75,
		velocityVariation	= 15,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		rotationChange		= -20,
		useEmitterRotation	= false,
		alphaStart			= 1.0,
		alphaVariation		= 0.25,
		fadeInSpeed			= 2.0,
		fadeOutSpeed		= -3.0,
		fadeOutDelay		= 300,
		scaleStart			= 0.1,
		scaleVariation		= 0.20,
		scaleInSpeed		= 3.0,
		scaleOutSpeed		= -0.01,
		scaleOutDelay		= 500,
		emissionShape		= 2,
		emissionRadius		= 30,
		killOutsideScreen	= false	,
		lifeTime			= 2000
		} )	


	Particles.CreateParticleType ("ExplosionSparks", 
		{
		imagePath			= particleImagesPath.."spark_with_trail.png",
		imageWidth			= 8,
		imageHeight			= 32,
		directionVariation	= 360,
		velocityStart		= 200,
		velocityVariation	= 150,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		autoOrientation		= true,
		useEmitterRotation	= false,
		alphaStart			= 0.5,
		alphaVariation		= 0.5,
		fadeInSpeed			= 0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart			= 1.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -0.5,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		lifeTime			= 2000,
		} )
		
	Particles.CreateParticleType ("ExitExplosionSparks", 
		{
		imagePath			= particleImagesPath.."exit_spark_with_trail.png",
		imageWidth			= 8,
		imageHeight			= 32,
		directionVariation	= 360,
		velocityStart		= 200,
		velocityVariation	= 150,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		autoOrientation		= true,
		useEmitterRotation	= false,
		alphaStart			= 0.5,
		alphaVariation		= 0.5,
		fadeInSpeed			= 0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart			= 1.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -0.5,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		lifeTime			= 2000,
		} )	


	Particles.CreateParticleType ("ExplosionFlash", 
		{
		imagePath			= particleImagesPath.."flare.png",
		imageWidth			= 128,
		imageHeight			= 128,
		directionVariation	= 360,
		rotationVariation	= 360,
		rotationChange		= 0,
		useEmitterRotation	= false,
		alphaStart			= 1.0,
		fadeInSpeed			= 1.0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart			= 2.0,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -1.0,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		lifeTime			= 1000
		} )
		
	Particles.CreateParticleType ("ExitExplosionFlash", 
		{
		imagePath			= particleImagesPath.."flare.png",
		imageWidth			= 128,
		imageHeight			= 128,
		directionVariation	= 360,
		rotationVariation	= 360,
		rotationChange		= 0,
		useEmitterRotation	= false,
		alphaStart			= 1.0,
		fadeInSpeed			= 1.0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart			= 2.0,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -1.0,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		lifeTime			= 1000
		} )	


	Particles.CreateParticleType ("ElectricSparks", 
		{
		imagePath				= particleImagesPath.."electric_spark.png",
		imageWidth				= 8,
		imageHeight				= 32,
		weight					= 0.8,
		xReference				= 4,
		yReference				= 32,
		velocityStart			= 150,
		velocityVariation		= 100,
		directionVariation		= 360,
		autoOrientation			= true,
		useEmitterRotation		= false,
		alphaStart				= 1.0,
		fadeOutSpeed			= -1.0,
		fadeOutDelay			= 250,
		scaleStart				= 0.2,
		scaleVariation			= 0.3,
		scaleChange				= -1.0,
		emissionShape			= 0,
		killOutsideScreen		= true,
		lifeTime				= 1500
		} )


	Particles.CreateParticleType ("LightSmoke",
		{
		imagePath			= particleImagesPath.."smoke_whispery_bright.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		weight				= -0.2,
		directionVariation	= 360,	
		velocityVariation	= 50,
		rotationVariation	= 360,
		rotationChange		= 30,
		useEmitterRotation	= false,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= 0.01,
		scaleOutDelay		= 500,
		emissionShape		= 2,
		emissionRadius		= 30,
		killOutsideScreen	= true	,
		lifeTime			= 3000  
		} )


	Particles.CreateParticleType ("Fire",
		{
		imagePath			= particleImagesPath.."fire.png",
		imageWidth			= 64,
		imageHeight			= 64,
		weight				= -0.1,
		velocityStart		= 0,
		velocityVariation	= 25,
		velocityChange		= 1.0,
		alphaStart			= 0,
		fadeInSpeed			= 1.0,
		fadeOutSpeed		= -0.75,
		fadeOutDelay		= 500,
		scaleStart			= 1.0,
		scaleVariation		= 0.5,
		scaleInSpeed		= 0,
		scaleOutSpeed		= -0.4,
		scaleOutDelay		= 0,
		rotationVariation	= 360,
		rotationChange		= 0,
		rotationVariation	= 45,
		useEmitterRotation	= false,
		emissionShape		= 0,
		emissionRadius		= 10,
		killOutsideScreen	= true,
		lifeTime			= 2000
		} )

	Particles.CreateParticleType ("FireSparks", 
		{
		imagePath				= particleImagesPath.."red_spark.png",
		imageWidth				= 8,
		imageHeight				= 32,
		weight					= 0.8,
		xReference				= 4,
		yReference				= 32,
		velocityStart			= 150,
		velocityVariation		= 100,
		directionVariation		= 360,
		autoOrientation			= true,
		useEmitterRotation		= false,
		alphaStart				= 1.0,
		fadeOutSpeed			= -1.0,
		fadeOutDelay			= 250,
		scaleStart				= 0.2,
		scaleVariation			= 0.3,
		scaleChange				= -1.0,
		emissionShape			= 0,
		killOutsideScreen		= true,
		lifeTime				= 1500
		} )

	Particles.CreateParticleType ("HeavySmokeBright",
		{
		imagePath			= particleImagesPath.."smoke_heavy_bright.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		weight				= -0.075,
		directionVariation	= 45,	
		velocityVariation	= 25,
		rotationVariation	= 360,
		rotationChange		= 30,
		useEmitterRotation	= false,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.25,
		scaleVariation		= 0.5,
		scaleInSpeed		= 0.5,
		emissionShape		= 2,
		emissionRadius		= 10,
		killOutsideScreen	= true	,
		lifeTime			= 3000  
		} )

	Particles.CreateParticleType ("HeavySmokeDark",
		{
		imagePath			= particleImagesPath.."smoke_heavy_dark.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		weight				= -0.075,
		directionVariation	= 45,	
		velocityVariation	= 25,
		rotationVariation	= 360,
		rotationChange		= 30,
		useEmitterRotation	= false,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.25,
		scaleVariation		= 0.5,
		scaleInSpeed		= 0.5,
		emissionShape		= 2,
		emissionRadius		= 10,
		killOutsideScreen	= true	,
		lifeTime			= 3000  
		} )

	Particles.CreateParticleType ("WaterFountain",
		{
		imagePath			= particleImagesPath.."water_fountain.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		weight				= 0.4,
		velocityStart		= 150,
		velocityVariation	= 25,
		autoOrientation		= true,
		useEmitterRotation	= true,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.1,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		emissionShape		= 2,
		emissionRadius		= 10,
		killOutsideScreen	= true	,
		lifeTime			= 3000  
		} )

	Particles.CreateParticleType ("WaterSpray",
		{
		imagePath			= particleImagesPath.."water_spray.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		weight				= 0.4,
		velocityStart		= 125,
		velocityVariation	= 25,
		autoOrientation		= true,
		useEmitterRotation	= true,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.1,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		emissionShape		= 2,
		emissionRadius		= 10,
		killOutsideScreen	= true	,
		lifeTime			= 3000  
		} )

	Particles.CreateParticleType ("WaterfallFountain",
		{
		imagePath			= particleImagesPath.."water_fountain.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		weight				= 0.4,
		velocityStart		= 0,
		velocityVariation	= 25,
		autoOrientation		= false,
		useEmitterRotation	= false,
		rotationStart		= 90,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.1,
		scaleVariation		= 1.0,
		scaleInSpeed		= 1.0,
		emissionShape		= 1,
		emissionRadius		= 25,
		killOutsideScreen	= true	,
		lifeTime			= 3000  
		} )

	Particles.CreateParticleType ("WaterfallSpray",
		{
		imagePath			= particleImagesPath.."water_spray.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		weight				= 0.4,
		velocityStart		= 0,
		velocityVariation	= 25,
		autoOrientation		= false,
		useEmitterRotation	= false,
		rotationStart		= 90,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.1,
		scaleVariation		= 1.0,
		scaleInSpeed		= 1.5,
		emissionShape		= 1,
		emissionRadius		= 50,
		killOutsideScreen	= true	,
		lifeTime			= 3000  
		} )

	Particles.CreateParticleType ("Rain", 
		{
		imagePath				= particleImagesPath.."electric_spark.png",
		imageWidth				= 8,
		imageHeight				= 32,
		weight					= 0.8,
		xReference				= 4,
		yReference				= 32,
		velocityStart			= 0,
		velocityVariation		= 100,
		directionVariation		= 80,
		autoOrientation			= true,
		useEmitterRotation		= true,
		alphaStart				= 0.0,
		fadeInSpeed				= 3.0,
		fadeOutSpeed			= -0.75,
		fadeOutDelay			= 500,
		scaleStart				= 0.3,
		scaleVariation			= 0.3,
		emissionShape			= 1,
		emissionRadius			= 400,
		killOutsideScreen		= true,
		lifeTime				= 1500
		} )

	Particles.CreateParticleType ("Fog",
		{
		imagePath			= particleImagesPath.."smoke_whispery_bright.png",
		imageWidth			= 64,	
		imageHeight			= 64,
		directionVariation	= 15,
		velocityStart		= 50,
		velocityVariation	= 50,
		rotationVariation	= 360,
		rotationChange		= 30,
		useEmitterRotation	= true,
		alphaStart			= 0.0,
		fadeInSpeed			= 0.5,
		fadeOutSpeed		= -0.2,
		fadeOutDelay		= 2000,
		scaleStart			= 0.75,
		scaleVariation		= 0.75,
		emissionShape		= 1,
		emissionRadius		= 30,
		killOutsideScreen	= false	,
		lifeTime			= 7000  
		} )

end


----------------------------------------------------------------
-- FUNCTION: CLEAN UP (UNLOAD THE PRELOADED PARTICLE IMAGES)
----------------------------------------------------------------
function CleanUp()
	local i = 1
	while Images[i] ~= nil do 
		Images[i]:removeSelf()
		Images[i] = nil
		i = i + 1 
	end

	i = 1
	while Sounds[i] ~= nil do 
		audio.dispose(Sounds[i])
		Sounds[i] = nil
		i = i + 1 
	end

end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachExplosionHighPerformance(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "ExplosionSmoke"		, 20, 500,750) 
	Particles.AttachParticleType (emitterName, "FireballSlow"		, 30, 400,0) 
	Particles.AttachParticleType (emitterName, "FireballBright"		, 30, 400,0) 
	Particles.AttachParticleType (emitterName, "ExplosionSparks"	, 100, 100,100) 
	Particles.AttachParticleType (emitterName, "ExplosionFlash"		, 50, 100,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[1], 0, false, { channel = 0, loops = 0, fadeIn = 0 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachExplosionLowPerformance(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "ExplosionSmoke"		, 15, 500,750) 
	Particles.AttachParticleType (emitterName, "FireballSlow"		, 20, 400,0) 
	Particles.AttachParticleType (emitterName, "FireballBright"		, 20, 400,0) 
	Particles.AttachParticleType (emitterName, "ExplosionFlash"		, 50, 100,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[1], 0, false, { channel = 0, loops = 0, fadeIn = 0 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachExplosionEndless(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "FireballSlow"		, 7, 999999,0) 
	Particles.AttachParticleType (emitterName, "FireballBright"		, 7, 999999,0) 
	Particles.AttachParticleType (emitterName, "ExplosionFlash"		, 5, 999999,2000) 
	Particles.AttachParticleType (emitterName, "ExplosionSparks"	, 1, 999999,100) 

	-- NEW: ATTACH SOUND EFFECT
	-- Particles.SetEmitterSound(emitterName, Sounds[3], 0, true, { channel = 1, loops = -1, fadeIn = 1000 } )
end

----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachExitExplosionEndless(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "ExitFireballSlow"		, 7, 999999,0) 
	Particles.AttachParticleType (emitterName, "ExitFireballBright"		, 7, 999999,0) 
	Particles.AttachParticleType (emitterName, "ExitExplosionFlash"		, 5, 999999,2000) 
	Particles.AttachParticleType (emitterName, "ExitExplosionSparks"	, 1, 999999,100) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[3], 0, true, { channel = 1, loops = -1, fadeIn = 1000 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachSparks(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "LightSmoke"		, 10, 500,0) 
	Particles.AttachParticleType (emitterName, "ElectricSparks"	, 40, 500,0) 
	Particles.AttachParticleType (emitterName, "ExplosionFlash"	,  5, 500,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[2], 0, false, { channel = 0, loops = 0, fadeIn = 0 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachFire(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "Fire"			, 10, 99999,0) 
	Particles.AttachParticleType (emitterName, "LightSmoke"		, 10, 99999,0) 
	Particles.AttachParticleType (emitterName, "FireSparks"		,  7, 99999,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[4], 0, true, { channel = 1, loops = -1, fadeIn = 1000 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachHeavySmokeBright(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "HeavySmokeBright", 5, 99999,0) 
	Particles.AttachParticleType (emitterName, "HeavySmokeDark"  , 5, 99999,0) 
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachWaterFountain(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "WaterFountain"	, 10, 99999,0) 
	Particles.AttachParticleType (emitterName, "WaterSpray"		, 10, 99999,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[5], 0, true, { channel = 1, loops = -1, fadeIn = 2000 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachWaterfall(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "WaterfallFountain"	, 15, 99999,0) 
	Particles.AttachParticleType (emitterName, "WaterfallSpray"		, 10, 99999,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[5], 0, true, { channel = 1, loops = -1, fadeIn = 2000 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachRain(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "Rain"	,50, 99999,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[6], 0, true, { channel = 1, loops = -1, fadeIn = 2000 } )
end


----------------------------------------------------------------
-- FUNCTION: ATTACHES AN EFFECT TO YOUR EMITTER
----------------------------------------------------------------
function AttachFog(emitterName)
	Particles.DetachParticleTypes(emitterName)
	Particles.AttachParticleType (emitterName, "Fog"	,5, 99999,0) 

	-- NEW: ATTACH SOUND EFFECT
	Particles.SetEmitterSound(emitterName, Sounds[7], 0, true, { channel = 1, loops = -1, fadeIn = 2000 } )
end
