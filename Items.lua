
--Viagra
local Viagra = Isaac.GetItemIdByName("Viagra")
local ViagraDamage = 20
local game = Game()

function IsaacsEcstasy:EvaluateViagraCache(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(Viagra)
        local damageToAdd = ViagraDamage * itemCount
        player.Damage = player.Damage + damageToAdd
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IsaacsEcstasy.EvaluateViagraCache)

--BodyPillow
local BodyPillow = Isaac.GetItemIdByName("BodyPillow")
local BodyPillowShotSpeed = 100
IsaacsEcstasy.COSTUME_COOMING = Isaac.GetCostumeIdByPath('gfx/characters/COOMING.anm2')
IsaacsEcstasy.COLLECTIBLE_BODYPILLOW = Isaac.GetItemIdByName("BodyPillow")

function IsaacsEcstasy:EvaluateBodyPillowCache(player, cacheFlags)

    if cacheFlags & CacheFlag.CACHE_FIREDELAY == CacheFlag.CACHE_FIREDELAY then
        local itemCount = player:GetCollectibleNum(BodyPillow)
        local ShotSpeedToAdd = BodyPillowShotSpeed * itemCount
        player.FireDelay = player.FireDelay + ShotSpeedToAdd
    end

end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IsaacsEcstasy.EvaluateBodyPillowCache,  ModCallbacks.MC_POST_PEFFECT_UPDATE)

-- Moms Cock Blocker
local MomsCockBlocker = Isaac.GetItemIdByName("MomsCockBlocker")
local MomsCockBlockerDamage = 20

function IsaacsEcstasy:EvaluateMomsCockBlocker(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(MomsCockBlocker)
        local damageToAdd = MomsCockBlockerDamage * itemCount
        player.Damage = player.Damage + damageToAdd
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IsaacsEcstasy.EvaluateMomsCockBlocker)