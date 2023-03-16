local jezebel = {}
local enums = require("jezebel_scripts.enums")
--local savedata = require("jezebel_scripts.savedata")
local character = Isaac.GetPlayerTypeByName("Jezebel")

local stats = {
    DMG_MULTI = 0.50
}

function jezebel:onCache(player, cacheFlags)
    if player:GetPlayerType() == character then       
     if cacheFlags & CacheFlag.CACHE_LUCK == CacheFlag.CACHE_LUCK then
      player.Luck = player.Luck + 1
      end
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
      player.Damage = player.Damage + 1
      end
    end


  end
  IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, jezebel.onCache)

  function IsaacsEcstasy:onPlayerInit(player)
    --Her costume(Hair)
    if player:GetPlayerType() == character then
        print("AddingNullCostume")
        print(enums.Costumes.JEZEBEL_HAIR)
        player:AddNullCostume(enums.Costumes.JEZEBEL_HAIR)
    end
  end

  IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, IsaacsEcstasy.onPlayerInit)

  return jezebel
