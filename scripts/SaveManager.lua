-- MAKE SURE TO REPLACE ALL INSTANCES OF "IsaacsEcstasy" WITH YOUR ACTUAL MOD REFERENCE
-- Made by Slugcat. Report any issues to her.

local json = require("json")
local dataCache = {}
local dataCacheBackup = {}
local shouldRestoreOnUse = false
local loadedData = false
local inRunButNotLoaded = true

local skipNextRoomClear = false
local skipNextLevelClear = false

---@class SaveData
---@field run RunSave @Data that is reset when the run ends. Using glowing hourglass restores data to the last backup.
---@field hourglassBackup table @The data that is restored when using glowing hourglass. Don't touch this.
---@field file FileSave @Data that is persistent between runs.

---@class RunSave
---@field persistent table @Things in this table will not be reset until the run ends.
---@field level table @Things in this table will not be reset until the level is changed.
---@field room table @Things in this table will not be reset until the room is changed.

---@class FileSave
---@field achievements table @Achievement related data.
---@field dss table @Dead Sea Scrolls related data.
---@field settings table @Setting related data.
---@field misc table @Miscellaneous stuff, you likely won't need to use this.

-- If you want to store default data, you must put it in this table.
---@return SaveData
function IsaacsEcstasy.DefaultSave()
    return {
        ---@type RunSave
        run = {
            persistent = {},
            level = {},
            room = {},
        },
        ---@type RunSave
        hourglassBackup = {
            persistent = {},
            level = {},
            room = {},
        },
        ---@type FileSave
        file = {
            achievements = {},
            dss = {}, -- Dead Sea Scrolls supremacy
            settings = {},
            misc = {},
        },
    }
end

---@return RunSave
function IsaacsEcstasy.DefaultRunSave()
    return {
        persistent = {},
        level = {},
        room = {},
    }
end

function IsaacsEcstasy.DeepCopy(tab)
    local copy = {}
    for k, v in pairs(tab) do
        if type(v) == 'table' then
            copy[k] = IsaacsEcstasy.DeepCopy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

---@return boolean
function IsaacsEcstasy.IsDataLoaded()
    return loadedData
end

function IsaacsEcstasy.PatchSaveTable(deposit, source)
    source = source or IsaacsEcstasy.DefaultSave()

    for i, v in pairs(source) do
        if deposit[i] ~= nil then
            if type(v) == "table" then
                if type(deposit[i]) ~= "table" then
                    deposit[i] = {}
                end

                deposit[i] = IsaacsEcstasy.PatchSaveTable(deposit[i], v)
            else
                deposit[i] = v
            end
        else
            if type(v) == "table" then
                if type(deposit[i]) ~= "table" then
                    deposit[i] = {}
                end

                deposit[i] = IsaacsEcstasy.PatchSaveTable({}, v)
            else
                deposit[i] = v
            end
        end
    end

    return deposit
end

function IsaacsEcstasy.SaveModData()
    if not loadedData then
        return
    end

    -- Save backup
    local backupData = IsaacsEcstasy.DeepCopy(dataCacheBackup)
    dataCache.hourglassBackup = IsaacsEcstasy.PatchSaveTable(backupData, IsaacsEcstasy.DefaultRunSave())

    local finalData = IsaacsEcstasy.DeepCopy(dataCache)
    finalData = IsaacsEcstasy.PatchSaveTable(finalData, IsaacsEcstasy.DefaultSave())

    IsaacsEcstasy:SaveData(json.encode(finalData))
end

function IsaacsEcstasy.RestoreModData()
    if shouldRestoreOnUse then
        skipNextRoomClear = true
        local newData = IsaacsEcstasy.DeepCopy(dataCacheBackup)
        dataCache.run = IsaacsEcstasy.PatchSaveTable(newData, IsaacsEcstasy.DefaultRunSave())
        dataCache.hourglassBackup = IsaacsEcstasy.PatchSaveTable(newData, IsaacsEcstasy.DefaultRunSave())
    end
end

function IsaacsEcstasy.LoadModData()
    if loadedData then
        return
    end

    local saveData = IsaacsEcstasy.DefaultSave()

    if IsaacsEcstasy:HasData() then
        local data = json.decode(IsaacsEcstasy:LoadData())
        saveData = IsaacsEcstasy.PatchSaveTable(data, IsaacsEcstasy.DefaultSave())
    end

    dataCache = saveData
    dataCacheBackup = dataCache.hourglassBackup
    loadedData = true
    inRunButNotLoaded = false
end

---@return table?
function IsaacsEcstasy.GetRunPersistentSave()
    if not loadedData then
        return
    end

    return dataCache.run.persistent
end

---@return table?
function IsaacsEcstasy.GetLevelSave()
    if not loadedData then
        return
    end

    return dataCache.run.level
end

---@return table?
function IsaacsEcstasy.GetRoomSave()
    if not loadedData then
        return
    end

    return dataCache.run.room
end

---@return table?
function IsaacsEcstasy.GetFileSave()
    if not loadedData then
        return
    end

    return dataCache.file
end

local function ResetRunSave()
    dataCache.run = IsaacsEcstasy.DefaultRunSave()
    dataCache.hourglassBackup = IsaacsEcstasy.DefaultRunSave()
    dataCacheBackup = IsaacsEcstasy.DefaultRunSave()

    IsaacsEcstasy.SaveModData()
end

IsaacsEcstasy:AddCallback(ModCallbacks.MC_USE_ITEM, IsaacsEcstasy.RestoreModData, CollectibleType.COLLECTIBLE_GLOWING_HOUR_GLASS)

IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, function()
    local newGame = Game():GetFrameCount() == 0

    skipNextLevelClear = true
    skipNextRoomClear = true

    IsaacsEcstasy.LoadModData()

    if newGame then
        ResetRunSave()
        shouldRestoreOnUse = false
    end
end)

IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_UPDATE, function ()
    local game = Game()
    if game:GetFrameCount() > 0 then
        if not loadedData and inRunButNotLoaded then
            IsaacsEcstasy.LoadModData()
            inRunButNotLoaded = false
            shouldRestoreOnUse = true
        end
    end
end)

--- Replace YOUR_MOD_NAME with the name of your mod, as defined in RegisterMod!
--- This handles the "luamod" command!
IsaacsEcstasy:AddCallback(ModCallbacks.MC_PRE_MOD_UNLOAD, function(_, mod)
    if mod.Name == "YOUR_MOD_NAME" and Isaac.GetPlayer() ~= nil then
        if loadedData then
            IsaacsEcstasy.SaveModData()
        end
    end
end)

IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
    if not skipNextRoomClear then
        dataCacheBackup.persistent = IsaacsEcstasy.DeepCopy(dataCache.run.persistent)
        dataCacheBackup.room = IsaacsEcstasy.DeepCopy(dataCache.run.room)
        dataCache.run.room = IsaacsEcstasy.DeepCopy(IsaacsEcstasy.DefaultRunSave().room)
        IsaacsEcstasy.SaveModData()
        shouldRestoreOnUse = true
    end

    skipNextRoomClear = false
end)

IsaacsEcstasy:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, function()
    if not skipNextLevelClear then
        dataCacheBackup.persistent = IsaacsEcstasy.DeepCopy(dataCache.run.persistent)
        dataCacheBackup.level = IsaacsEcstasy.DeepCopy(dataCache.run.level)
        dataCache.run.level = IsaacsEcstasy.DeepCopy(IsaacsEcstasy.DefaultRunSave().level)
        IsaacsEcstasy.SaveModData()
        shouldRestoreOnUse = true
    end

    skipNextLevelClear = false
end)

IsaacsEcstasy:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, function(_, shouldSave)
    IsaacsEcstasy.SaveModData()
    loadedData = false
    inRunButNotLoaded = false
    shouldRestoreOnUse = false
end)