
--Viagra
local Viagra = Isaac.GetItemIdByName("Viagra")
local ViagraDamage = 20
local game = Game()
local sound = SFXManager()

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


IsaacsEcstasy:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IsaacsEcstasy.EvaluateBodyPillowCache,  ModCallbacks.MC_POST_PEFFECT_UPDATE)



IsaacsEcstasy.COLLECTIBLE_WHIP = Isaac.GetItemIdByName("Whip")
EntityType.ENTITY_WHIP = Isaac.GetEntityTypeByName("Whip")

function IsaacsEcstasy:OnWhip(player)
    
    local WhipSprite = player:GetSprite()

    if player:HasCollectible(IsaacsEcstasy.COLLECTIBLE_WHIP) then

        if player:GetAimDirection():Length() > 0.001 then
            print("Shot??")
        end
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, IsaacsEcstasy.OnWhip)















--Transformations!!!

--Inflatible

IsaacsEcstasy.COSTUME_INFLATIBLE = Isaac.GetCostumeIdByPath("gfx/characters/Inflatible.anm2")

function IsaacsEcstasy:InflatibleTransformation(player)
    local hud = game:GetHUD()

    if game:GetFrameCount() == 1 then
        IsaacsEcstasy.isInflatible = false
    end
    if not IsaacsEcstasy.isInflatible and player:HasCollectible(669) and player:HasCollectible(618) and player:HasCollectible(716)then
        player:AddNullCostume(IsaacsEcstasy.COSTUME_INFLATIBLE)
        hud:ShowItemText("INFLATIBLE!", " ")
        sound:Play(132, 1, 0, false, 1)
        IsaacsEcstasy.isInflatible = true
    end
end

IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, IsaacsEcstasy.InflatibleTransformation)