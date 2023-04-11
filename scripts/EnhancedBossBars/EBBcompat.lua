-- Hiya Mr. Peeper!

function IsaacsEcstasy:MonstroRender() 
	if HPBars then -- check if the mod is installed
		HPBars.BossDefinitions["20.0"] = { -- the table BossDefinitions is used to define boss specific content. Entries are defined with "Type.Variant" of the boss
			sprite = "gfx/ui/bosshp_icons/chapter1/IE/monstro.png", -- path to the .png file that will be used as the icon for this boss
			offset = Vector(-4, 0) -- number of pixels the icon should be moved from its center versus the left-side of the bar
		}
	end
end
IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_NPC_INIT, IsaacsEcstasy.MonstroRender, EntityType.ENTITY_MONSTRO)