local jezebel = {}
local enums = require("ModdedCharSupport.modded_char_enums")
--local savedata = require("jezebel_scripts.savedata")
local Fiend = Isaac.GetPlayerTypeByName("Fiend")
local game = Game()


  function IsaacsEcstasy:onModCharInit(player)
    --Her costume(Hair)
    if game:GetFrameCount() == 1 then
        IsaacsEcstasy.isFiend = false
    end
    if not IsaacsEcstasy.isFiend and player:GetPlayerType() == Fiend then  
        print(enums.Costumes.FIEND_SKIN)
        player:AddNullCostume(enums.Costumes.FIEND_SKIN)
        IsaacsEcstasy.isFiend = true
    end
  end

  IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, IsaacsEcstasy.onModCharInit)

  return jezebel
