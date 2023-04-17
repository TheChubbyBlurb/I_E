
--Viagra
local game = Game()
local sound = SFXManager()

local Viagra = Isaac.GetItemIdByName("Viagra")
local ViagraDamage = 20

function IsaacsEcstasy:EvaluateViagraCache(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(Viagra)
        local damageToAdd = ViagraDamage * itemCount
        player.Damage = player.Damage + damageToAdd
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IsaacsEcstasy.EvaluateViagraCache)

local Condom = Isaac.GetItemIdByName("Condom")
local CondomLuck = 0.50

function IsaacsEcstasy:EvaluateCondomCache(player, cacheFlags)
    if EID then
        EID:addCollectible(Condom, "Adds 20 luck", "Condom")
    end
    if cacheFlags & CacheFlag.CACHE_LUCK == CacheFlag.CACHE_LUCK then
        local itemCount = player:GetCollectibleNum(Condom)
        local luckToAdd = CondomLuck * itemCount
        player.Luck = player.Luck + luckToAdd
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IsaacsEcstasy.EvaluateCondomCache)



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




















--Transformations!!!

--Inflatible

--IsaacsEcstasy.COSTUME_INFLATIBLE = Isaac.GetCostumeIdByPath("gfx/characters/Inflatible.anm2")

--function IsaacsEcstasy:InflatibleTransformation(player)
--    local hud = game:GetHUD()

--    if game:GetFrameCount() == 1 then
--        IsaacsEcstasy.isInflatible = false
--    end
--    if not IsaacsEcstasy.isInflatible and player:HasCollectible(669) and player:HasCollectible(618) and player:HasCollectible(716)then
--        player:AddNullCostume(IsaacsEcstasy.COSTUME_INFLATIBLE)
--        hud:ShowItemText("INFLATIBLE!", " ")
--        sound:Play(132, 1, 0, false, 1)
--        IsaacsEcstasy.isInflatible = true
--    end
--end
--
--IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, IsaacsEcstasy.InflatibleTransformation)