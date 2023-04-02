EntityType.ENTITY_EROGELIC = Isaac.GetEntityTypeByName("Erogelic")
Erogelic = {
    SPEED = 0.9,
    RANGE = 200,
    POUNDRANGE = 80
}

function IsaacsEcstasy:onErogelic(entity)
    local sprite = entity:GetSprite()

    local target = entity:GetPlayerTarget()
    local data = entity:GetData()
    entity.GridCollisionClass = EntityGridCollisionClass.GRIDCOLL_WALLS


    --Grants the enemy to fly over shit
    if data.GridCountdown == nil then data.GridCountdown = 0 end

    if(entity.State == NpcState.STATE_INIT) then
        sprite:Play("Appear")
        entity.State = NpcState.STATE_MOVE
    end

    if(entity.State == NpcState.STATE_MOVE) then
        debugText = "State Move"

        if(entity.StateFrame == 0) then
            sprite:Play("Fly")
        end

        if entity:CollidesWithGrid() or data.GridCountdown > 0 then
            entity.Pathfinder:FindGridPath(target.Position, Erogelic.SPEED, 1, false)
            if data.GridCountdown <= 0 then
                data.GridCountdown = 30
            else
                data.GridCountdown = data.GridCountdown - 1
            end
        else
            entity.Velocity = (target.Position - entity.Position):Normalized() * Erogelic.SPEED * 6
        end
        if (entity.Position - target.Position):Length() < Erogelic.POUNDRANGE then
            entity.State = NpcState.STATE_ATTACK;
            entity.StateFrame = 0;
        end
    end

    if(entity.State == NpcState.STATE_ATTACK) then
        debugText = "Splurge"
        if(entity.StateFrame == 0) then
            sprite:Play("Splat")
        end

        if entity:GetSprite():IsEventTriggered("Splurt") then
            local angle = math.random(1,180);
            local mag = math.random(1,10)
            local spawningVel = Vector.FromAngle(angle) * mag

            Isaac.Spawn(EntityType.ENTITY_PROJECTILE, 0, 0, entity.Position, spawningVel, nil)
        end

        if (sprite:IsFinished("Splat")) then
            entity.State = NpcState.STATE_MOVE;
            entity.StateFrame = 0;
        end
        --entity.StateFrame = entity.StateFrame + 1;
    end
end

IsaacsEcstasy:AddCallback(ModCallbacks.MC_NPC_UPDATE, IsaacsEcstasy.onErogelic, EntityType.ENTITY_EROGELIC)