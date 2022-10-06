Game.ImportLibraryWithName("actors/props/usable/scripts/usable.lua", "Usable")
Elevator = {}
setmetatable(Elevator, {__index = Usable})
Elevator_Music = {
  {
    "s000_surface",
    "s010_area1",
    "ele"
  },
  {
    "s010_area1",
    "s028_area2c",
    "ele"
  },
  {
    "s028_area2c",
    "s020_area2",
    "ele"
  },
  {
    "s028_area2c",
    "s025_area2b",
    "ele"
  }
}
function Elevator.Use(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if string.sub(_UPVALUE0_.CurrentScenarioID, 1, 3) == string.sub(_ARG_1_, 1, 3) then
    if string.find(_ARG_3_.sName, "_up") ~= nil then
      Game.SetLoadScreenType(1)
    else
      Game.SetLoadScreenType(2)
    end
  elseif string.find(_ARG_3_.sName, "_up") ~= nil then
    Game.SetLoadScreenType(3)
  else
    Game.SetLoadScreenType(4)
  end
  Scenario.FadeOutAndLoad(_ARG_0_, _ARG_1_, _ARG_2_, 1.1)
  utils.LOG(utils.LOGTYPE_SOUND, "Elevator playing music from " .. _UPVALUE0_.CurrentScenarioID .. " to " .. _ARG_1_)
  Game.PlayLoadingStream("streams/maps/elevator_ambience.wav", 1, 1)
  Game.PlayLoadingMusic("ele")
end
function Elevator.OnStartFromInterArea(_ARG_0_, _ARG_1_)
  if Game.GetEntity("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4)) ~= nil then
    if Game.GetEntity("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT ~= nil then
      Game.GetEntity("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT:OnStartUse()
    end
    Game.MinimapOnLevelStartUsingElevator("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4))
    CurrentScenario.ElevatorSetTarget(_ARG_0_.sName)
    Game.AddGUISF(0, GUI.ElevatorEndUseActionInterArea, "")
    Game.AddGUISF(4.6, GUI.HideElevatorStateShowHUDState, "")
  end
end
function Elevator.OnStartFromInnerArea(_ARG_0_, _ARG_1_)
  if Game.GetEntity("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4)) ~= nil then
    if Game.GetEntity("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT ~= nil then
      Game.GetEntity("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT:OnStartUse()
    end
    Game.MinimapOnLevelStartUsingElevator("LE_Platform_Elevator_" .. string.sub(_ARG_0_.sName, 4))
    Game.AddGUISF(0, GUI.ElevatorEndUseActionInnerArea, "")
  end
end
