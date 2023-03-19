
--FIltered callback for NPCUpdate
EntityType.ENTITY_THEPRIEST = Isaac.GetEntityTypeByName("The Priest")
EntityType.ENTITY_NUN = Isaac.GetEntityTypeByName("The Nun")

debugText = "They're turning the monsters gay!"


function moveLogic(npc)
    angle = math.random(1,360)
    direction = Vector.FromAngle(angle);

    --debugText = direction.x;
    if(npc.Velocity.X < 0.001 and npc.Velocity.Y < 0.001) then
        npc:AddVelocity(direction:__mul(10));
    end
end

function IsaacsEcstasy:update(Priest)
    player = Isaac.GetPlayer(0);
    local sprite = Priest:GetSprite()
    sprite:PlayOverlay("Head", false)
    Priest:AnimWalkFrame("WalkHori", "WalkVert", 0.1)

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

        if(Priest.StateFrame % 3 == 0) then
            angle = math.random(1,180);
            mag = math.random(1,10)

            Isaac.Spawn(EntityType.ENTITY_PROJECTILE, 0, 0, Priest.Position, Vector.FromAngle(angle):__mul(mag), nil);
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

        if(Priest.StateFrame % 3 == 0) then
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

IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_RENDER, IsaacsEcstasy.debug_text);
IsaacsEcstasy:AddCallback(ModCallbacks.MC_NPC_UPDATE, IsaacsEcstasy.update, Priest);