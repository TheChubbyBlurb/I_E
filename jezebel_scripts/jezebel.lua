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
        --print("AddingNullCostume")
        print(enums.Costumes.JEZEBEL_HAIR)
        player:AddNullCostume(enums.Costumes.JEZEBEL_HAIR)
    end
  end

  IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, IsaacsEcstasy.onPlayerInit)

  local WhipCrack = Isaac.GetEntityVariantByName("Whip Strike")
  IsaacsEcstasy.COLLECTIBLE_WHIP = Isaac.GetItemIdByName("Whip")
  --EntityType.ENTITY_WHIP = Isaac.GetEntityTypeByName("Whip")
  
  function IsaacsEcstasy:OnWhip(tear, player, entity)
      local tearSpawner = tear.SpawnerEntity
      local playerType = tearSpawner:ToPlayer():GetPlayerType()
      if(playerType == character) then
        if(tearSpawner and tearSpawner:ToPlayer()) then
  
          local bone = Isaac.Spawn(1000, WhipCrack, 0, tear.Position, Vector.Zero, tear.SpawnerEntity)
          bone = bone:ToEffect()
          bone:GetSprite():Play("AttackDown", true)
          --bone.CollisionDamage = bone.CollisionDamage*2
          --bone.SpriteScale = Vector(0.5,2)
          bone.SpriteRotation = tear.Velocity:GetAngleDegrees()-90
          --bone:GetSprite().PlaybackSpeed = 2
          bone:FollowParent(tear.SpawnerEntity)

          end
      end
      local range = EntityPlayer.TearRange;
      local damage = EntityPlayer.Damage;
      local enemy_entities = Isaac.FindInRadius(entity.Position, range, EntityPartition.ENEMY)

      for i, entity in ipairs(enemy_entities) do
        entity:TakeDamage(damage, 0, EntityRef(EntityPlayer), 0)
      end
  end

      
  IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, IsaacsEcstasy.OnWhip)
  
  ---@param whip EntityEffect
  function IsaacsEcstasy:WhipUpdate(whip)
      if(whip.FrameCount == 10) then
          whip:Remove()
      end
  end
  
  IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, IsaacsEcstasy.WhipUpdate, WhipCrack)


  return jezebel

  
