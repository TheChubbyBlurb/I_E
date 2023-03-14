local Viagra = Isaac.GetItemIdByName("Viagra")
local ViagraDamage = 20

function IsaacsEcstasy:EvaluateCache(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(Viagra)
        local damageToAdd = ViagraDamage * itemCount
        player.Damage = player.Damage + damageToAdd
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IsaacsEcstasy.EvaluateCache)
