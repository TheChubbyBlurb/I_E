
function IsaacsEcstasy:npc_update()
    if (sprite:GetAnimation() == "WalkVert" and ent.Velocity.Y<0) then
        sprite:SetAnimation("WalkUp")
    end
end