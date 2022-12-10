Game.ImportLibrary("gui/scripts/msemenu.lua")
Game.ImportLibrary("gui/scripts/scenariomenu_common.lua", false)
Game.ImportLibrary("gui/scripts/msemenu_scenarios.lua", false)
msemenu_presaved = {}
function msemenu_presaved.Create(_ARG_0_)
  return (msemenu.Create("Up", "items", true, false, true, 11, "CDebugMenuEntryItemRenderer"))
end
function msemenu_presaved.LoadPresavedGame(_ARG_0_)
  GUI.ResetMainMenuDebugGUI("gui/scripts/menu_root.lua", "gui/scripts/MainMenuStartScreen.lua")
  Game.LoadGameFromAssets(_ARG_0_)
  Blackboard.SetProp("GAME", "I_AM_A_CHEATER", "b", true)
  Game.SaveGame("savedata", "Cheater", "[MANTAIN]", true)
end
function msemenu_presaved.FinishAdventure()
  Game.LoadGameFromAssetsWithoutLoad("Finished")
  GUI.ResetMainMenuDebugGUI("gui/scripts/menu_root.lua", "gui/scripts/MainMenuStartScreen.lua")
  Blackboard.SetProp("GAME", "I_AM_A_CHEATER", "b", true)
  Game.SaveGame("savedata", "Cheater", "[MANTAIN]", true)
end
function msemenu_presaved.FreeCameraAllowed()
  Game.FreeCameraAllowed()
  GUI.ResetMainMenuDebugGUI("gui/scripts/menu_root.lua", "gui/scripts/MainMenuStartScreen.lua")
  Blackboard.SetProp("GAME", "I_AM_A_CHEATER", "b", true)
  Game.SaveGame("savedata", "Cheater", "[MANTAIN]", true)
end
if Game.IsInFINAL() then
  msemenu.items = {
    TeleportToScenario = msemenu.GenerateDefaultItems(ScenarioMenu.TeleportToScenario, tScenarioMenuDefs.aScenarios)
  }
else
  msemenu.items = {
    TeleportToScenario = msemenu.GenerateDefaultItems(ScenarioMenu.TeleportToScenario, tScenarioMenuDefs.aScenarios)
  }
end
