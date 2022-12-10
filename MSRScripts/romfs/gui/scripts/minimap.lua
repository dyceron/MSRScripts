Game.ImportLibrary("gui/scripts/mapcharactersdefs.lua", false)
Game.ImportLibrary("gui/scripts/minimapmark.lua", false)
Game.ImportLibrary("system/scripts/scenario.lua")
minimap = minimap ~= nil and minimap or {bEditMode = false, oRoot = nil}
minimap.MAX_CUSTOM_MARKS = 50
function minimap.Create(_ARG_0_)
  minimap.sCurrentScenarioID = nil
  minimap.sTargetScenarioID = nil
  minimap.bMinimapAvailable = false
  minimap.bLocked = false
  minimap.iNumCellsVisited = 0
  minimap.oRoot = GUI.CreateDisplayObjectEx("Minimap", "CMinimap", {
    StageID = "Down",
    FocusIdx = "-1",
    Focusable = false
  })
  minimap.UpdateCurrentMinimapState()
  return minimap.oRoot
end
function minimap.GetMinimapDO()
  return minimap.oRoot
end
function minimap.OnMinimapCellVisited(_ARG_0_, _ARG_1_, _ARG_2_)
  if minimap.sCurrentScenarioID == _ARG_0_ then
    minimap.iNumCellsVisited = minimap.iNumCellsVisited + 1
    if minimap.iNumCellsVisited == 1 then
      minimap.UpdateCurrentMinimapState()
    end
  end
end
function minimap.OverrideTransitionCost(_ARG_0_, _ARG_1_, _ARG_2_)
  minimap.GetMinimapDO():OverrideTransitionCost(_ARG_0_, _ARG_1_, _ARG_2_)
end
function minimap.OverrideTransitionPos(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  minimap.GetMinimapDO():OverrideTransitionPos(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
end
function minimap.OverrideTransitionExitDir(_ARG_0_, _ARG_1_, _ARG_2_)
  minimap.GetMinimapDO():OverrideTransitionExitDir(_ARG_0_, _ARG_1_, _ARG_2_)
end
function minimap.UpdateCurrentMinimapState()
  minimap.SetVisible(true)
  guicallbacks.OnCurrentMinimapStateUpdated()
end
function minimap.RefreshCurrentScenario()
  if minimap.sCurrentScenarioID ~= nil and mapcharactersdefs.tDefs[Game.GetDefaultPlayerName()].funcOnShowScenario then
    mapcharactersdefs.tDefs[Game.GetDefaultPlayerName()].funcOnShowScenario(minimap.sCurrentScenarioID)
  end
end
function minimap.SetScenarioSelected(_ARG_0_, _ARG_1_)
  if minimap.sCurrentScenarioID ~= _ARG_0_ then
    minimap.sCurrentScenarioID = _ARG_0_
    minimap.bMinimapAvailable = _ARG_1_
    minimap.iNumCellsVisited = minimap.GetMinimapDO():GetNumVisitedCells(_ARG_0_)
    if minimap.sCurrentScenarioID ~= nil and minimap.bMinimapAvailable then
      minimap.RefreshCurrentScenario()
    else
    end
    minimap.UpdateCurrentMinimapState()
    minimap.OnCurrentScenarioChanged(_ARG_0_)
    guicallbacks.OnCurrentScenarioChanged(_ARG_0_)
  end
end
function minimap.SetObjectiveLandmark(_ARG_0_, _ARG_1_, _ARG_2_)
  if minimap.GetMinimapDO() ~= nil then
    if _ARG_2_ == nil then
      _ARG_2_ = 0
    end
    minimap.GetMinimapDO():SetObjectiveLandmark(_ARG_0_, _ARG_1_, _ARG_2_)
  end
end
function minimap.HasUndisclosedConnectionTowards(_ARG_0_)
  return minimap.GetMinimapDO():HasUndisclosedConnectionTowards(_ARG_0_)
end
function minimap.GoToNextScenario(_ARG_0_)
  minimap.GetMinimapDO():SelectNextScenario(_ARG_0_)
end
function minimap.GetNumVisitedCells(_ARG_0_)
  return minimap.GetMinimapDO():GetNumVisitedCells(_ARG_0_)
end
function minimap.SetVisible(_ARG_0_)
  if minimap.oRoot ~= nil then
    GUI.SetProperties(minimap.oRoot, {Visible = _ARG_0_})
  end
end
function minimap.GetCurrentScenarioDef()
  if minimap.sCurrentScenarioID ~= nil and Game.GetDefaultPlayer() ~= nil then
  end
  return mapcharactersdefs.tDefs[Game.GetDefaultPlayer().sName].tScenarios[minimap.sCurrentScenarioID]
end
function minimap.SetMinimapLocked(_ARG_0_, _ARG_1_)
  if minimap.bLocked ~= _ARG_0_ then
    minimap.bLocked = _ARG_0_
    if _ARG_0_ then
    end
    minimap.UpdateCurrentMinimapState()
  end
end
function minimap.OnNewScenarioLoadStart(_ARG_0_, _ARG_1_, _ARG_2_)
  minimap.GetMinimapDO():SetGameScenarioMinimap(_ARG_0_, _ARG_1_)
  if Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "MinimapObjective") ~= nil then
    minimap.GetMinimapDO():SetObjectiveLandmark(Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "MinimapObjective"), false, 0)
  end
end
function minimap.OnLoadScenarioRequest(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  minimap.GetMinimapDO():DestroyCurrentScenario()
end
function minimap.OnCurrentScenarioChanged(_ARG_0_)
end
function minimap.SetProfileDataDirty()
  minimap.GetMinimapDO():SetProfileDataDirty()
end
function minimap.GetScenarios()
  return minimap.GetMinimapDO():GetScenarios()
end
function minimap.SetTargetScenarioID(_ARG_0_)
  minimap.sTargetScenarioID = _ARG_0_
end
