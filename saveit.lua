module(..., package.seeall)

function save( event )           
                local path = system.pathForFile( "ourdata.txt", system.DocumentsDirectory )                
                local file = io.open( path, "w+b" )
				-- Creates the file where we save our data if needed
                
				file:write( _G.onelock ..", ".. _G.twolock)          
                io.close( file )
				-- Saves our data

        end
        
-- Make sure the above matches what you have in MENU.LUA