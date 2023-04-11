IsaacsEcstasy = RegisterMod("Isaacs-Ecstacy-Lua", 1)


--Our hot babes
local Jezebel = require("jezebel_scripts.jezebel")
--local Foster = require("jezebel_scripts.foster") Sorry guys, he's not ready yet

--Modded Characters
local Fiend = require("ModdedCharSupport.modded_char_support")

--Adds The items
include("items")
--Adds in the sex
include("sex.sex")
--Enemies
include("Enemies.CondomGaper")
include("Enemies.Nun")
include("Enemies.Erogelic")

--Bosses B)
include("Bosses.ThePriest")


--Custom Healht Api!?!? (Scripts Section)
include("scripts.EnhancedBossBars.EBBcompat")
--include("scripts.customhealthapi.core")



--CustomHealthAPI.Library.AddCallback("IsaacsEcstasy", CustomHealthAPI.Enums.Callbacks.ON_SAVE, 0, function(savedata, isPreGameExit)
--	IsaacsEcstasy.savedata.CustomHealthAPISave = savedata
--	IsaacsEcstasy.SaveSaveData()
--	
--	if isPreGameExit then
--		IsaacsEcstasy.LOADED_SAVEDATA = true
--		IsaacsEcstasy.SaveSaveData()
--		IsaacsEcstasy.LOADED_SAVEDATA = false
--	else
--		IsaacsEcstasy.SaveSaveData()
--	end
--end)

--CustomHealthAPI.Library.AddCallback("IsaacsEcstasy", CustomHealthAPI.Enums.Callbacks.ON_LOAD, 0, function()
--	return IsaacsEcstasy.savedata.CustomHealthAPISave
--end)



--Custom Stages UNFINISHED!!!!
--include("GardenOfEden.GardenOfEden")
