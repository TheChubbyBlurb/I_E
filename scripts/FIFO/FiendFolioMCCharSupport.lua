--Set fiends skin
local FiendChar = Isaac.GetPlayerTypeByName("Fiend")

function IsaacsEcstasy:SetFiendSkin(player)
  if FiendFolio then
    if player:GetPlayerType() == FiendChar then
      local FiendSprite = player:GetSprite()
          for i=1,14 do if i~=13 then FiendSprite:ReplaceSpritesheet(i,"gfx/characters/ModdedCharSupport/playername_fiend.png") end end
          FiendSprite:LoadGraphics()
          print("Mr Fiend folio, we have coded")
    end
  end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, IsaacsEcstasy.SetFiendSkin)

-- BTW this shit does nothing -SlugBug