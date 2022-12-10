Game.ImportLibrary("gui/scripts/msemenu_inventory.lua", false)
Game.ImportLibrary("gui/scripts/scenariomenu_game.lua", false)
ScenarioMenu = {}
function ScenarioMenu.InitScenarioMenuGameBlackboard(_ARG_0_)
  Blackboard.SetProp("GAME", "Version", "i", SaveGame.Version)
  Blackboard.SetProp("GAME", "HUD", "b", true)
  if Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_MAX_LIFE") == nil then
    Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_MAX_LIFE", "f", 99)
  end
  for _FORV_5_, _FORV_6_ in pairs(debuginventory) do
    Blackboard.SetProp("PLAYER_INVENTORY", _FORV_5_, "f", _FORV_6_.Default)
  end
  Game.ImportLibrary("maps/levels/" .. tScenarioMenuDefs.aScenarioDefs[_ARG_0_] .. "/" .. _ARG_0_ .. "/" .. _ARG_0_ .. ".lua")
  if _G[_ARG_0_] and _G[_ARG_0_].SetupDebugGameBlackboard then
    _G[_ARG_0_].SetupDebugGameBlackboard()
  end
end
function ScenarioMenu.AddScenario(_ARG_0_, _ARG_1_)
  for _FORV_6_, _FORV_7_ in ipairs(tScenarioMenuDefs.aScenarioDefs) do
    if _FORV_7_ == _ARG_1_ then
      break
    end
  end
  if not true then
    tScenarioMenuDefs.aScenarioDefs[_ARG_1_] = _ARG_0_
    table.insert(tScenarioMenuDefs.aScenarioDefs, _ARG_1_)
  end
end
function ScenarioMenu.LoadScenario(_ARG_0_, _ARG_1_)
  if _ARG_1_ == nil or not _ARG_1_ then
    _ARG_1_ = true
  end
  if _ARG_1_ or Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "ScenarioID") == nil or Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "ScenarioID") ~= _ARG_0_ then
    Game.SetRecoveryModeTemporarilyDisabled(true)
    Blackboard.Reset()
    if tScenarioMenuDefs.aScenarioPlayers[_ARG_0_] == nil then
      Game.DebugLoadScenario(tScenarioMenuDefs.aScenarioDefs[_ARG_0_], _ARG_0_, "StartPoint0", string.gmatch(tScenarioMenuDefs.aScenarioDefs[_ARG_0_], "%_(.+)$")(), 1)
    else
      Game.DebugLoadScenario(tScenarioMenuDefs.aScenarioDefs[_ARG_0_], _ARG_0_, "StartPoint0", tScenarioMenuDefs.aScenarioPlayers[_ARG_0_], 1)
    end
  end
  return true
end
function ScenarioMenu.TeleportToScenario(_ARG_0_, _ARG_1_)
  if _ARG_1_ == nil or not _ARG_1_ then
    _ARG_1_ = true
  end
  if _ARG_1_ or Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "ScenarioID") == nil or Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "ScenarioID") ~= _ARG_0_ then
    Game.LoadScenario(tScenarioMenuDefs.aScenarioDefs[_ARG_0_], _ARG_0_, "StartPoint0", string.gmatch(tScenarioMenuDefs.aScenarioDefs[_ARG_0_], "%_(.+)$")(), 1)
  end
  return true
end
