local enums = {}

enums.Players = {
    FIEND = Isaac.GetPlayerTypeByName("Fiend", false),
    FIEND_B = Isaac.GetPlayerTypeByName("Fiend_B", true)
}

enums.Costumes = {
    FIEND_SKIN = Isaac.GetCostumeIdByPath("gfx/characters/ModdedCharSupport/player_fiend.anm2"),
    
}

return enums

