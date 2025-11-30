-- Adding the Kalimba instrument.

-- Kalimba
	if Musician.INSTRUMENTS["kalimba"] == nil then
        Musician.INSTRUMENTS["kalimba"] = {
	            path = "Interface\\AddOns\\MusicianK\\instruments\\kalimba",      			-- Path to your instrument folder
	            decay = 750,                                                        		-- Decay duration in milliseconds
	            isPercussion = false,                                               		-- Act as a percussion instrument using the single sample file (without extension) from path or picked from pathList using keyMod or roundRobin methods
	            isPlucked = true,                                                  			-- Set to true for plucked instruments such as guitar, harp etc.
	            midi = 108,  --Kalimba                                               		-- General MIDI instrument ID (0-127). For percussions, midi is its MIDI ID + 128
	            color = { 0.78 / 1.25, 0.61 / 1.25, 0.43 / 1.25 },                          -- r, g, b
	            source = "FreePats Kalimba Soundfont"                                    	-- Credits to author, software, library etc used to create the instrument. Displayed in the "About" window.
        }

        -- Insert the kalimba before tubular bells
        local i = 1
       while Musician.INSTRUMENTS_AVAILABLE[i] ~= "tubular_bells" and i <= #Musician.INSTRUMENTS_AVAILABLE do i = i + 1 end
        table.insert(Musician.INSTRUMENTS_AVAILABLE, i, "kalimba")
    end
