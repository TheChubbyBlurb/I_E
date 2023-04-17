
--Slut role
function IsaacsEcstasy:OnGameStart(fromsave)
	if TheStrangerRole ~= nil then -- Test if "The Stranger" mod is active

		-- create a role card named "Slut"
		THSTR.AddCustomRole("Slut","30000",1.0,10,3.5,1.0,1,0)

        THSTR.AddCustomPickupItems(15,0,0,127,0,0) -- here

        print("Slut role work???")
	end
end

IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, IsaacsEcstasy.OnGameStart)