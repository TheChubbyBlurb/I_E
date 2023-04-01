EntityType.ENTITY_EROGELIC = Isaac.GetEntityTypeByName("Erogelic")
Erogelic = {
    SPEED = 0.9,
    RANGE = 200,
    POUND = 20
}

function IsaacsEcstasy:onErogelic(entity)
    local sprite = entity:GetSprite()
    sprite:PlayOverlay("Head", false)
    entity:AnimWalkFrame("WalkHori", "WalkVert", 0.1)

    local target = entity:GetPlayerTarget()
    local data = entity:GetData()
    entity.GridCollisionClass = EntityGridCollisionClass.GRIDCOLL_WALLS

    if data.GridCountdown == nil then data.GridCountdown = 0 end

    if entity.State == 0 then --Random
        if entity:IsFrame(math.ceil(Erogelic.SPEED), 0) then
            entity.Pathfinder:MoveRandomly(false)
        end
        if (entity.Position - target.Position):Length() < Erogelic.RANGE then
            entity.State = 2
        end
    elseif entity.State == 2 then --Get that mofo
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
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_NPC_UPDATE, IsaacsEcstasy.onErogelic, EntityType.ENTITY_EROGELIC)