local enums = {}

enums.Players = {
    JEZEBEL = Isaac.GetPlayerTypeByName("Jezebel", false),
    JEZEBEL_B = Isaac.GetPlayerTypeByName("Jezebel_B", true),

    FOSTER = Isaac.GetPlayerTypeByName("Foster", false),
    FOSTER_B = Isaac.GetPlayerTypeByName("Foster", true)
}

enums.Costumes = {
    JEZEBEL_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/jezebel_hair.anm2"),
    JEZEBELB_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/jezebel_hair.anm2"),

    FOSTER_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/foster_head.anm2"),
    FOSTERB_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/foster_head.anm2")
}

return enums

