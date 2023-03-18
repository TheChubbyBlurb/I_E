EntityType.ENTITY_CONDOMGAPER = Isaac.GetEntityTypeByName("Condom Gaper")
CondomGaper = {
    SPEED = 0.9,
    RANGE = 200
}

function IsaacsEcstasy:onCondomGaper(entity)
    local sprite = entity:GetSprite()
    sprite:PlayOverlay("Head", false)
    entity:AnimWalkFrame("WalkHori", "WalkVert", 0.1)

    local target = entity:GetPlayerTarget()
    local data = entity:GetData()
    if data.GridCountdown == nil then data.GridCountdown = 0 end

    if entity.State == 0 then --Random
        if entity:IsFrame(math.ceil(CondomGaper.SPEED), 0) then
            entity.Pathfinder:MoveRandomly(false)
        end
        if (entity.Position - target.Position):Length() < CondomGaper.RANGE then
            entity.State = 2
        end
    elseif entity.State == 2 then --Get that mofo
        if entity:CollidesWithGrid() or data.GridCountdown > 0 then
            entity.Pathfinder:FindGridPath(target.Position, CondomGaper.SPEED, 1, false)
            if data.GridCountdown <= 0 then
                data.GridCountdown = 30
            else
                data.GridCountdown = data.GridCountdown - 1
            end
        else
            entity.Velocity = (target.Position - entity.Position):Normalized() * CondomGaper.SPEED * 6
        end
    end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_NPC_UPDATE, IsaacsEcstasy.onCondomGaper, EntityType.ENTITY_CONDOMGAPER)