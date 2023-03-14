local BeezHorf = Isaac.GetEntityTypeByName("BeezHorf")

function IsaacsEcstasy:NPCUpdate(BeezHorf)
    --mmmmm bee booty
    local player = Isaac.GetPlayer(0)
    local entities = Isac.GetRoomEntities()
    for i = 1, #entities do
        if entities[i]:IsEnemy() then
            if entities[i]:IsVulnerableEnemy() then
                if entities[i] == BeezHorf then
                    --lol
                end
            end
        end
    end
end