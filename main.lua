IsaacsEcstasy = RegisterMod("IsaacsEcstacyLua", 1)


--Our hot babes
local Jezebel = require("jezebel_scripts.jezebel")
--local Foster = require("jezebel_scripts.foster") Sorry guys, he's not ready yet

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
include("scripts.SaveManager")
include("scripts.TheStangerCustomRoleIE.IEroles")
--include("scripts.customhealthapi.core")


--if CustomHealthAPI and CustomHealthAPI.Library and CustomHealthAPI.Library.UnregisterCallbacks then
--	CustomHealthAPI.Library.UnregisterCallbacks("IsaacsEcstasy")
--end


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


