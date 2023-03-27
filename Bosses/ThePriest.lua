
--FIltered callback for NPCUpdate
EntityType.ENTITY_THEPRIEST = Isaac.GetEntityTypeByName("The Priest")

debugText = "They're turning the monsters gay!"


function moveLogic(npc)
    local angle = math.random(1,360)
    local direction = Vector.FromAngle(angle);
    local spawningVel = direction * 10
    --debugText = direction.x;
    if(npc.Velocity.X < 0.001 and npc.Velocity.Y < 0.001) then
        
        npc:AddVelocity(spawningVel);
    end
end

function IsaacsEcstasy:update(Priest)
    local target = Priest:GetPlayerTarget()
    local sprite = Priest:GetSprite()

    if(Priest.State == NpcState.STATE_INIT) then
        sprite:Play("Appear")
        Priest.State = NpcState.STATE_MOVE
    end

    if(Priest.State == NpcState.STATE_MOVE) then
        debugText = "State Move"

        randomAttack = math.random(1,60);

        if(randomAttack < 2) then
            Priest.State = NpcState.STATE_ATTACK;
            Priest.StateFrame = 0;
        end

        if(randomAttack > 2 and randomAttack < 5) then
            Priest.State = NpcState.STATE_ATTACK2;
            Priest.StateFrame = 0;
        end
    end

    if(Priest.State == NpcState.STATE_ATTACK) then
        debugText = "State Attack 1"
        if(Priest.StateFrame == 0) then
            sprite:Play("Shoot")
        end

        if Priest:GetSprite():IsEventTriggered("Shoot") then
            local angle = math.random(1,180);
            local mag = math.random(1,10)
            local spawningVel = Vector.FromAngle(angle) * mag

            Isaac.Spawn(EntityType.ENTITY_PROJECTILE, 0, 0, Priest.Position, spawningVel, nil)
        end

        if (sprite:IsFinished("Shoot")) then
            Priest.State = NpcState.STATE_MOVE;
            Priest.StateFrame = 0;
        end
        Priest.StateFrame = Priest.StateFrame + 1;
    end

    if(Priest.State == NpcState.STATE_ATTACK2) then
        debugText = "State Attack 2"
        if(Priest.StateFrame == 0) then
            sprite:Play("Spawn")
        end

        if Priest:GetSprite():IsEventTriggered("Spawn") then
            Isaac.Spawn(EntityType.ENTITY_NUN, 0, 0, Priest.Position, Vector(0,0), Priest)
        end

        if(sprite:IsFinished("Spawn")) then
            Priest.State = NpcState.STATE_MOVE;
            Priest.StateFrame = 0;
        end
        Priest.StateFrame = Priest.StateFrame + 1;
    end
    moveLogic(Priest);
end

function IsaacsEcstasy:debug_text()
    Isaac.RenderText(debugText, 100, 100, 255, 0, 0, 255)
end

print("THE HOLY ONE")

--IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_RENDER, IsaacsEcstasy.debug_text);
IsaacsEcstasy:AddCallback(ModCallbacks.MC_NPC_UPDATE, IsaacsEcstasy.update, EntityType.ENTITY_THEPRIEST);