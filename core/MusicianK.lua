--- Extended module: Adds Kalimba to Musician.
-- @module MusicianK

MusicianK = LibStub("AceAddon-3.0"):NewAddon("MusicianK")

-- We are going to call our module K (Kalimba), and register it with Musician.
local MODULE_NAME = "K"
Musician.AddModule(MODULE_NAME)

local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata

--- OnInitialize
--
function MusicianK:OnInitialize()
		-- Fix audio settings
		Musician.Utils.AdjustAudioSettings()
end

-- Append MusicianK version in the global version string
--
local hookedMusicianRegistryGetVersionString = Musician.Registry.GetVersionString
function Musician.Registry.GetVersionString()
    return hookedMusicianRegistryGetVersionString() .. " " ..
        "MusicianK=" .. GetAddOnMetadata("MusicianK", "Version")
end

-- Enlarge required cache size
--
if Musician.Utils.GetSoundCacheSize then
	local hookedMusicianUtilsGetSoundCacheSize = Musician.Utils.GetSoundCacheSize
	function Musician.Utils.GetSoundCacheSize()
		return hookedMusicianUtilsGetSoundCacheSize() + MusicianK.SOUND_CACHE_SIZE
	end
end