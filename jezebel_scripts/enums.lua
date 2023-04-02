local enums = {}

enums.Players = {
    JEZEBEL = Isaac.GetPlayerTypeByName("Jezebel", false),
    JEZEBEL_B = Isaac.GetPlayerTypeByName("Jezebel_B", true)
}

enums.Costumes = {
    JEZEBEL_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/jezebel_hair.anm2"),
    JEZEBELB_HAIR = Isaac.GetCostumeIdByPath("gfx/characters/jezebel_hair.anm2")
}

return enums

