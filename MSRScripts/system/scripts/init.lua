Init = Init ~= nil and Init or {}
Init.EnableDebugger = false
Init.DEBUG = Game.IsDebug()
Game.ImportLibrary("system/scripts/class.lua")
Game.ImportLibrary("gui/scripts/scenariomenu_game.lua", false)
Game.ImportLibrary("system/scripts/logiccallbacks.lua", false)
Init.aBlkCharacterPackages = {
  Samus = {
    aScenarioSections = tScenarioMenuDefs.aScenarios,
    aSections = {"SAMUS"}
  }
}
Init.tNewGameInventory = {
  ITEM_MAX_LIFE = 99,
  ITEM_MAX_SPECIAL_ENERGY = 1000,
  ITEM_WEAPON_ICE_BEAM = 0,
  ITEM_WEAPON_MISSILE_MAX = 24,
  ITEM_WEAPON_SUPER_MISSILE_MAX = 0,
  ITEM_WEAPON_POWER_BOMB_MAX = 0,
  ITEM_METROID_COUNT = 0,
  ITEM_METROID_TOTAL_COUNT = 40
}
Init.tMaxGameProgressStats = {
  NumLifeTanksPickedUp = 10,
  NumSpecialEnergyTanksPickedUp = 15,
  NumMissileTanksPickedUp = 80,
  NumSuperMissileTanksPickedUp = 30,
  NumPowerBombTanksPickedUp = 15
}
Init.tReserveTanksInitialConfiguration = {
  ITEM_RESERVE_TANK_LIFE_SIZE = 99,
  ITEM_RESERVE_TANK_SPECIAL_ENERGY_SIZE = 500,
  ITEM_RESERVE_TANK_MISSILE_SIZE = 30,
  ITEM_RESERVE_TANK_SUPER_MISSILE_SIZE = 10
}
function Init.GetNewGameInventory()
  return Init.tNewGameInventory
end
function Init.GetMaxGameProgressStats()
  return Init.tMaxGameProgressStats
end
function Init.InitScenariosBlackboardsSections()
  Game.SetScenarioBlackboardSectionID("s110_surfaceb", "s000_surface")
end

function Init.InitGameBlackboardTOC()
  Blackboard.SetDefaultPackage("Common")
  
  for L3_2, L4_2 in pairs(Init.aBlkCharacterPackages) do
    local L5_2 = {}
  
    if L4_2.aScenarioSections then
      for L9_2, L10_2 in ipairs(L4_2.aScenarioSections) do
        table.insert(L5_2, L10_2)
      end
    end
    
    for L9_2, L10_2 in ipairs(L4_2.aSections) do
      table.insert(L5_2, L10_2)
    end
    
    Blackboard.AddPackage(L3_2, L5_2)
  end
end

function Init.SetupNewGameProfileBlackboard(_ARG_0_)
  ProfileBlackboard.ResetWithExceptionList({
    "GAME",
    "SETTINGS",
    "MINIMAP",
    "CINEMATICS",
    "SKILLS",
    "BESTIARY"
  })
  ProfileBlackboard.SetProp("SETTINGS", "Difficulty", "i", _ARG_0_)
end
function Init.InitGameBlackboard()
  Blackboard.ResetWithExceptionList({
    "GAME_PROGRESS"
  })
  for _FORV_3_, _FORV_4_ in pairs(Init.tNewGameInventory) do
    Blackboard.SetProp("PLAYER_INVENTORY", _FORV_3_, "f", _FORV_4_)
  end
  Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_METROID_COUNT", "f", 0)
  Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_CURRENT_LIFE", "f", Init.tNewGameInventory.ITEM_MAX_LIFE)
  Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_WEAPON_MISSILE_CURRENT", "f", Init.tNewGameInventory.ITEM_WEAPON_MISSILE_MAX)
  Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_WEAPON_SUPER_MISSILE_CURRENT", "f", Init.tNewGameInventory.ITEM_WEAPON_SUPER_MISSILE_MAX)
  Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_WEAPON_POWER_BOMB_CURRENT", "f", Init.tNewGameInventory.ITEM_WEAPON_POWER_BOMB_MAX)
  Blackboard.SetProp("GAME", "ITEM_RESERVE_TANK_LIFE_SIZE", "f", Init.tReserveTanksInitialConfiguration.ITEM_RESERVE_TANK_LIFE_SIZE)
  Blackboard.SetProp("GAME", "ITEM_RESERVE_TANK_SPECIAL_ENERGY_SIZE", "f", Init.tReserveTanksInitialConfiguration.ITEM_RESERVE_TANK_SPECIAL_ENERGY_SIZE)
  Blackboard.SetProp("GAME", "ITEM_RESERVE_TANK_MISSILE_SIZE", "f", Init.tReserveTanksInitialConfiguration.ITEM_RESERVE_TANK_MISSILE_SIZE)
  Blackboard.SetProp("GAME", "ITEM_RESERVE_TANK_SUPER_MISSILE_SIZE", "f", Init.tReserveTanksInitialConfiguration.ITEM_RESERVE_TANK_SUPER_MISSILE_SIZE)
  if ProfileBlackboard.GetProp("SETTINGS", "AMIIBO_MENU_UNLOCKED") ~= nil then
    Blackboard.SetProp("GAME", "AMIIBO_MENU_UNLOCKED", "b", (ProfileBlackboard.GetProp("SETTINGS", "AMIIBO_MENU_UNLOCKED")))
  end
  Blackboard.SetProp("GAME", "Version", "i", SaveGame.Version)
  Blackboard.SetProp("GAME", "HUD", "b", true)
  Blackboard.SetProp("GAME", "Player", "s", "samus")
  Blackboard.SetProp(Game.GetPlayerBlackboardSectionName(), "LevelID", "s", "c10_samus")
  Blackboard.SetProp(Game.GetPlayerBlackboardSectionName(), "ScenarioID", "s", "s000_surface")
  Blackboard.SetProp(Game.GetPlayerBlackboardSectionName(), "StartPoint", "s", "StartPoint0")
end
function Init.InitDefaultSettings()
  if Game.GetCurrentLanguage() == "ENGLISH" then
  else
  end
  ProfileBlackboard.SetProp("SETTINGS", "Subtitles", "i", 2)
  ProfileBlackboard.SetProp("SETTINGS", "Brightness", "i", 5)
end
function Init.CreateNewGameData(_ARG_0_)
  Init.InitGameBlackboard()
  Init.SetupNewGameProfileBlackboard(_ARG_0_)
  Game.ResetCheatBlackBoard()
  Game.ResetTotalPlayTime()
  Game.SaveNewGame()
end
function Init.CreateAndInitNewGame(_ARG_0_)
  Init.CreateNewGameData(_ARG_0_)
  Init.InitNewGame()
end
function Init.ResetGameBlackboardAndReloadGame()
  Blackboard.Reset()
  Init.InitGameBlackboard()
  Game.ReloadCurrentScenario()
end
function Init.InitNewGame()
  Game.LoadScenario("c10_samus", "s000_surface", "StartPoint0", "samus", 1)
end
function Init.CreateDebuggerConnection()
  package.path = package.path .. ";system/scripts/?.lc;system/scripts/LuaSockets/?.lc"
  loadfile("system/scripts/LuaSockets/mime.lc")()
  loadfile("system/scripts/LuaSockets/socket.lc")()
  require("debugger")(nil, nil, nil)
end
function Init.main()
  Game.SetDefaultPath("")
  if Init.EnableDebugger and not pcall(Init.CreateDebuggerConnection) then
    utils.LOG(utils.LOGTYPE_LUA, "ERROR creating debugger connection. Skipping...")
  end
  Init.InitScenariosBlackboardsSections()
  Init.InitGameBlackboardTOC()
  Game.ImportLibrary("system/scripts/savegame.lua", false)
  Game.ImportLibrary("system/scripts/difficulty.lua", false)
  Game.ImportLibrary("system/scripts/slots.lua", false)
end
function Init.StartGameAttractMode()
  Game.CreateProfile("profile0")
  Game.ApplySettingsFromProfileBlackboard()
  Init.InitGameBlackboard()
  Init.SetupNewGameProfileBlackboard()
  Game.FadeOut(0.5)
  Game.AddGUISF(1, "Init.CreateNewGameData", "")
  Game.AddGUISF(1.1, "Init.InitNewGame", "")
end
