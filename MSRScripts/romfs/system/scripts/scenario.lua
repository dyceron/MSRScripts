Scenario = Scenario or {}
setmetatable(Scenario, {__index = _G})
Scenario.Cameras = _G.Cameras
setfenv(1, Scenario)
tCharacterScenarioLevels = {Samus = "c10_samus"}
function main()
  ResetCurrentScenarioInfo()
end
function ResetCurrentScenarioInfo()
  _UPVALUE0_.CurrentScenario = nil
  _UPVALUE0_.CurrentScenarioID = nil
  _UPVALUE0_.CurrentScenarioBlackboard = nil
end
function OnLoadGameFromSaveData()
end
function SetCurrentScenario(_ARG_0_)
  _UPVALUE0_.CurrentScenario = _UPVALUE0_[_ARG_0_]
  _UPVALUE0_.CurrentScenarioID = _ARG_0_
  _UPVALUE0_.CurrentScenarioBlackboard = Game.GetScenarioBlackboardSectionID(_ARG_0_)
end
function InitScenario(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  SetCurrentScenario(_ARG_1_)
  _UPVALUE0_.Character = Game.GetPlayer()
  bWaitingForScenarioChange = false
  if msemenu ~= nil and msemenu.items ~= nil and msemenu.items.CurrentScenario ~= nil then
    msemenu.items.CurrentScenario.Contextual = _UPVALUE0_.CurrentScenario.DebugMenuEntry ~= nil and _UPVALUE0_.CurrentScenario.DebugMenuEntry or {}
  end
  _UPVALUE0_.CurrentScenario.main()
  if _UPVALUE0_.CurrentScenario.InitFromBlackboard ~= nil then
    _UPVALUE0_.CurrentScenario.InitFromBlackboard()
  else
    utils.LOG_WARN(utils.LOGTYPE_LOGIC, "InitFromBlackboard method does not exist in Scenario " .. tostring(_ARG_1_))
  end
end
function HideLoadingScreen()
  Game.SetLoadingScreen(false)
  loadingscreen.HideLoadingScreen()
end
function ReadFromBlackboard(_ARG_0_, _ARG_1_)
  if _UPVALUE0_.CurrentScenarioBlackboard ~= nil then
  end
  return _ARG_1_
end
function WriteToBlackboard(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_.CurrentScenarioBlackboard ~= nil then
    Blackboard.SetProp(_UPVALUE0_.CurrentScenarioBlackboard, _ARG_0_, _ARG_1_, _ARG_2_)
  end
end
function WriteToSharedBlackboard(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_.CurrentScenarioBlackboard ~= nil then
    Blackboard.SetProp("ScenarioShared", _ARG_0_, _ARG_1_, _ARG_2_)
  end
end
function ReadFromSharedBlackboard(_ARG_0_, _ARG_1_)
  if _UPVALUE0_.CurrentScenarioBlackboard ~= nil then
  end
  return _ARG_1_
end
function GetBlackboardProp(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ ~= nil then
  end
  return _ARG_2_
end
function SetBlackboardProp(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_0_ ~= nil then
    Blackboard.SetProp(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  end
end
function RecoverPlayerMaxItemsAmounts()
  if Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_MAX_LIFE") ~= nil then
    Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_CURRENT_LIFE", "f", (Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_MAX_LIFE")))
  end
  if Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_MAX_SPECIAL_ENERGY") ~= nil then
    Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_CURRENT_SPECIAL_ENERGY", "f", (Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_MAX_SPECIAL_ENERGY")))
  end
  if Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_WEAPON_MISSILE_MAX") ~= nil then
    Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_WEAPON_MISSILE_CURRENT", "f", (Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_WEAPON_MISSILE_MAX")))
  end
  if Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_WEAPON_SUPER_MISSILE_MAX") ~= nil then
    Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_WEAPON_SUPER_MISSILE_CURRENT", "f", (Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_WEAPON_SUPER_MISSILE_MAX")))
  end
  if Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_WEAPON_POWER_BOMB_MAX") ~= nil then
    Blackboard.SetProp("PLAYER_INVENTORY", "ITEM_WEAPON_POWER_BOMB_CURRENT", "f", (Blackboard.GetProp("PLAYER_INVENTORY", "ITEM_WEAPON_POWER_BOMB_MAX")))
  end
  Game.ReinitPlayerFromBlackboard()
end
function ActivateDefaultCamera(_ARG_0_)
  if _ARG_0_ == nil then
    _ARG_0_ = true
  end
  _UPVALUE0_.InitialCamera = Game.GetEntity("MainCamera")
  if _UPVALUE0_.InitialCamera ~= nil then
    if not Game.ExistsLogicCamera("CAM_Default") then
      CreateDefaultLogicCamera("CAM_Default")
    end
    _UPVALUE0_.InitialCamera.CAMERA:SetLogicCameraParams("CAM_Default", _ARG_0_)
  end
  if _UPVALUE0_.InitialCamera ~= nil then
    if _UPVALUE0_.InitialCamera.CAMERA:GetLogicCameraController("CAM_Default") == nil then
      _UPVALUE0_.InitialCamera:ChangeCameraMode("METROID", _ARG_0_)
    end
    _UPVALUE0_.InitialCamera.IgnoreSlomo = false
  end
end
function CreateDefaultLogicCamera(_ARG_0_)
  Game.CreateLogicCamera(_ARG_0_, {
    Controller = "METROID",
    MinExtraZDist = "1665.807358",
    MaxExtraZDist = "1665.807358",
    DefaultInterp = "10.0",
    ParamsInterp = "1.5"
  })
end
function FadeOutAndLoadWithoutFadeIn(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not bWaitingForScenarioChange then
    bWaitingForScenarioChange = true
    if _ARG_3_ == nil then
      _ARG_3_ = 0.3
    end
    Game.FadeOut(_ARG_3_)
    Game.FadeOutStream(_ARG_3_ * 0.8)
    Game.AddPSF(_ARG_3_ + 0.1, "Game.LoadScenarioWithoutFadeIn", "ssssi", tCharacterScenarioLevels[_ARG_0_] ~= nil and tCharacterScenarioLevels[_ARG_0_] or _ARG_0_, _ARG_1_, _ARG_2_, "", 1)
  end
end
function ResetBlackboardAndReload()
  Init.InitGameBlackboard()
  Game.SaveGame("checkpoint", "", "", false)
  Game.LoadScenario(Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "LevelID"), Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "ScenarioID"), Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "StartPoint"), (Blackboard.GetProp("GAME", "Player")))
end
function FadeOutAndLoad(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not bWaitingForScenarioChange then
    bWaitingForScenarioChange = true
    if _ARG_3_ == nil then
      _ARG_3_ = 0.66
    end
    if _ARG_4_ then
      Game.TransitionFadeOut(_ARG_3_)
    else
      Game.FadeOut(_ARG_3_)
    end
    Game.FadeOutStream(_ARG_3_ * 0.8)
    Game.AddPSF(_ARG_3_ + 0.1, "Game.LoadScenario", "ssssi", tCharacterScenarioLevels[_ARG_0_] ~= nil and tCharacterScenarioLevels[_ARG_0_] or _ARG_0_, _ARG_1_, _ARG_2_, "", 1)
  end
end
function FadeOutBGAndLoad(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not bWaitingForScenarioChange then
    bWaitingForScenarioChange = true
    if _ARG_3_ == nil then
      _ARG_3_ = 0.66
    end
    Game.FadeOutBG(_ARG_3_)
    Game.FadeOutStream(_ARG_3_ * 0.8)
    Game.AddPSF(_ARG_3_ + 0.1, "Game.LoadScenario", "ssssi", tCharacterScenarioLevels[_ARG_0_] ~= nil and tCharacterScenarioLevels[_ARG_0_] or _ARG_0_, _ARG_1_, _ARG_2_, "", 2)
  end
end
function FadeOutAndReloadCurrentScenario(_ARG_0_)
  if not bWaitingForScenarioChange then
    bWaitingForScenarioChange = true
    if _ARG_0_ == nil then
      _ARG_0_ = 0.66
    end
    Game.FadeOut(_ARG_0_)
    Game.FadeOutStream(_ARG_0_ * 0.8)
    Game.AddPSF(_ARG_0_ + 0.1, "Game.ReloadCurrentScenario", "")
  end
end
function FadeOutAndLoadWithPlayer(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not bWaitingForScenarioChange then
    bWaitingForScenarioChange = true
    if _ARG_3_ == nil then
      _ARG_3_ = 0.66
    end
    Game.TransitionFadeOut(_ARG_3_)
    Game.FadeOutStream(_ARG_3_ * 0.8)
    Game.AddPSF(_ARG_3_ + 0.1, "Game.LoadScenario", "ssssi", tCharacterScenarioLevels[_ARG_0_] ~= nil and tCharacterScenarioLevels[_ARG_0_] or _ARG_0_, _ARG_1_, _ARG_2_, _ARG_4_, 1)
  end
end
function FadeOutAndCutscene(_ARG_0_, _ARG_1_)
  if _ARG_1_ == nil then
    _ARG_1_ = 0.3
  end
  Game.FadeOut(_ARG_1_)
  Game.AddPSF(_ARG_1_ + 0.1, "Game.LaunchCutscene", "s", _ARG_0_)
end
function FadeOutAndUnloadScenario(_ARG_0_, _ARG_1_)
  if _ARG_1_ == nil then
    _ARG_1_ = 0.3
  end
  Game.FadeOut(_ARG_1_)
  Game.AddPSF(_ARG_1_ + 0.1, "Game.UnloadScenario", "s", _ARG_0_)
end
function FadeOutAndSetCutsceneMode(_ARG_0_, _ARG_1_)
  if _ARG_1_ == nil then
    _ARG_1_ = 0.3
  end
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer().INPUT:IgnoreInputFor(_ARG_1_ + 0.1, true)
  end
  Game.FadeOut(_ARG_1_)
  Game.AddPSF(_ARG_1_ + 0.1, "Game.SetCutsceneMode", "s", _ARG_0_)
end
function FadeOutAndLoadWithCutscene(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  Cutscenes.NextLevelId = _ARG_0_
  Cutscenes.NextScenearioId = _ARG_1_
  Cutscenes.NextStartPoint = _ARG_2_
  if _ARG_4_ == nil then
    _ARG_4_ = 0.3
  end
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer().INPUT:IgnoreInputFor(_ARG_4_ + 0.1, true)
  end
  Game.FadeOut(_ARG_4_)
  Game.AddPSF(_ARG_4_ + 0.1, "Game.SetLoadingMode", "s", _ARG_3_)
end
function FadeOutAndGoToMainMenu(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == nil then
    _ARG_0_ = 0.3
  end
  if _ARG_1_ == nil then
    _ARG_1_ = false
  end
  if _ARG_2_ == nil then
    _ARG_2_ = false
  end
  Game.FadeOut(_ARG_0_)
  Game.AddPSF(_ARG_0_ + 0.1, "Scenario.GoToMainMenu", "bb", _ARG_1_, _ARG_2_)
end
function GoToMainMenu(_ARG_0_, _ARG_1_)
  if _ARG_0_ == true and loadingscreen then
    loadingscreen.SetMainMenuLoadingScreen()
  end
  if _ARG_1_ then
    GUI.ResetMainMenuDebugGUI("gui/scripts/msemenu_start.lua", "")
  end
  Game.GoToMainMenu()
end
function FadeOut(_ARG_0_)
  if _ARG_0_ == nil then
    _ARG_0_ = 0.3
  end
  Game.FadeOut(_ARG_0_)
end
function FadeIn(_ARG_0_)
  if _ARG_0_ == nil then
    _ARG_0_ = 0.3
  end
  Game.FadeIn(_ARG_0_)
end
function ForEachEntityIn(_ARG_0_, _ARG_1_, ...)
  for _FORV_6_, _FORV_7_ in ipairs(_ARG_0_) do
    if Game.GetEntity(_FORV_7_) ~= nil and Game.GetEntity(_FORV_7_)[_ARG_1_] ~= nil then
      Game.GetEntity(_FORV_7_)[_ARG_1_](Game.GetEntity(_FORV_7_), unpack(nil))
    end
  end
end
fSweetDeadStartDelay = 0.2
fSweetDeadFadeOutTime = 0.5
fSweetDeadBlackScreenTime = 0.5
fSweetDeadFadeInTime = 0.5
function CheckSweetDead(_ARG_0_)
  if Game.GetPlayer().CurrentLife > 0 then
    Scenario.DisableInput()
    Game.GetPlayer():IgnoreDamageFor(fSweetDeadStartDelay + fSweetDeadFadeOutTime + fSweetDeadBlackScreenTime + fSweetDeadFadeInTime)
    Game.GetPlayer().ATTACK.bEnabled = false
    Game.GetPlayer():IgnoreHangFor(fSweetDeadStartDelay + fSweetDeadFadeOutTime + fSweetDeadBlackScreenTime + fSweetDeadFadeInTime)
    Game.GetPlayer().Invulnerable = true
    if _ARG_0_ == nil then
      _ARG_0_ = Blackboard.GetProp(Game.GetPlayerBlackboardSectionName(), "StartPoint")
    end
    Game.AddSF(fSweetDeadStartDelay, "Scenario.OnSweetDeadFadeOut", "s", _ARG_0_)
  end
end
function OnSweetDeadFadeOut(_ARG_0_)
  Game.FadeOut(fSweetDeadFadeOutTime)
  Game.AddSF(fSweetDeadFadeOutTime + fSweetDeadBlackScreenTime, "Scenario.OnSweetDeadTeleport", "s", _ARG_0_)
end
function OnSweetDeadTeleport(_ARG_0_)
  Game.TeleportEntityToStartPoint(Game.GetPlayerName(), _ARG_0_, fSweetDeadFadeInTime, true)
  Game.FadeIn(fSweetDeadFadeInTime)
  Game.AddSF(0, "Scenario.OnSweetDeadFinished", "")
end
function OnSweetDeadFinished()
  Game.GetPlayer().ATTACK.bEnabled = true
  Game.GetPlayer().Invulnerable = false
  Scenario.EnableInput()
  if CurrentScenario ~= nil and CurrentScenario.OnSweetDeadFinished ~= nil then
    CurrentScenario.OnSweetDeadFinished()
  end
end
function ShowEntityCamera(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  InitialCamera.CAMERA:SetLogicCameraParams("CAM_Default", false)
  InitialCamera.EntityToFollow = _ARG_0_
  InitialCamera:SetInterpolationFor(_ARG_2_, _ARG_1_)
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer():SetDefaultLoopFor("relaxcombat", 0.2)
    Game.SetPlayerInputEnabled(false, true)
  end
  if _ARG_4_ == nil then
    _ARG_4_ = false
  end
  if _ARG_5_ == nil then
    _ARG_5_ = false
  end
  Game.AddSF(_ARG_1_, "Scenario.ShowEntityCameraEnd", "ssbb", _ARG_3_, InitialCamera.LastLogicCameraID, _ARG_4_, _ARG_5_)
end
function ShowEntityCameraEnd(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_2_ and _ARG_1_ ~= "" then
    InitialCamera.CAMERA:SetLogicCameraParams(_ARG_1_, _ARG_3_)
  else
    InitialCamera.EntityToFollow = Game.GetPlayerName()
  end
  Game.SetPlayerInputEnabled(true, false)
  assert(loadstring(_ARG_0_ .. "()"))()
end
function EnableInput()
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer().INPUT.bEnabled = true
    Game.DelSF("Scenario.OnEndDisableInputFor")
  end
end
function DisableInput()
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer().INPUT.bEnabled = false
    Game.DelSF("Scenario.OnEndDisableInputFor")
  end
end
function DisableInputFor(_ARG_0_)
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer().INPUT.bEnabled = false
    Game.AddSF(_ARG_0_, "Scenario.OnEndDisableInputFor", "")
  end
end
function OnEndDisableInputFor()
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer().INPUT.bEnabled = true
  end
end
function IsUserInteractionEnabled(_ARG_0_)
  if _ARG_0_ == nil then
    _ARG_0_ = false
  end
  if false and not Game.IsCutscenePlaying() and _ARG_0_ and Game.GetPlayer() ~= nil then
  end
  return Game.GetPlayer().INPUT.bEnabled
end
function PlayLogicCamera(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  Game.DelSF("Scenario.PlayLogicCameraEnd")
  Game.OverrideSoundListener("OnTarget")
  InitialCamera.CAMERA:SetLogicCameraParams(_ARG_0_, _ARG_1_)
  if _ARG_5_ or false then
    DisableInput()
  end
  Game.AddSF(_ARG_2_, "Scenario.PlayLogicCameraEnd", "sbb", _ARG_3_, _ARG_4_, _ARG_5_ or false)
end
function PlayLogicCameraEnd(_ARG_0_, _ARG_1_, _ARG_2_)
  utils.LOG(utils.LOGTYPE_LOGIC, "called PlayLogicCameraEnd " .. _ARG_0_)
  Game.ResetOverrideSoundListener()
  if _ARG_2_ then
    EnableInput()
  end
  InitialCamera.CAMERA:SetLogicCameraParams(_ARG_0_, _ARG_1_)
end
function GetPlayerCurrentScenario(_ARG_0_)
  return Blackboard.GetProp(string.upper(_ARG_0_), "ScenarioID")
end
function GetGameProgressPct()
  return math.min(0, 100)
end
function GetGameProgressPctInTable()
  return {
    GameProgressPct = string.format("%0.2f", GetGameProgressPct())
  }
end
function ForceModelLODFactor(_ARG_0_)
  Game.SetEntityModelLODFactor(_ARG_0_, 0.1)
end
function ResetModelLODFactor(_ARG_0_)
  Game.ResetEntityModelLODFactor(_ARG_0_)
end
function SetSmartObjectStateUse(_ARG_0_, _ARG_1_)
  if Game.GetEntity(_ARG_0_) ~= nil and Game.GetEntity(_ARG_0_).SMARTOBJECT ~= nil then
    Game.GetEntity(_ARG_0_).SMARTOBJECT:SetUseState(_ARG_1_)
  end
end
function SetItemAmount(_ARG_0_, _ARG_1_)
  Game.SetItemAmount(Game.GetPlayerName(), _ARG_0_, _ARG_1_)
  Game.ReinitPlayerFromBlackboard()
end
function SetPlayerPosition(_ARG_0_, _ARG_1_, _ARG_2_)
  utils.LOG(utils.LOGTYPE_LOGIC, "Scenario Setting player position to " .. _ARG_0_ .. "," .. _ARG_1_ .. "," .. _ARG_2_)
  Game.GetPlayer().vPos = V3D(_ARG_0_, _ARG_1_, _ARG_2_)
end
function CanaManageHazarousEntity(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  for _FORV_7_, _FORV_8_ in pairs(CurrentScenario.tHazarous) do
    if _FORV_7_ ~= _ARG_0_ and not _ARG_3_ and Game.IsPoolActivated(_FORV_7_) ~= _ARG_3_ then
      for _FORV_13_, _FORV_14_ in pairs(CurrentScenario.tHazarous[_FORV_7_][_ARG_1_]) do
        if _FORV_14_ == _ARG_2_ then
          return false
        end
      end
    end
  end
  return true
end
function EnableHazarous(_ARG_0_, _ARG_1_)
  if CurrentScenario.EnableHazarous ~= nil then
    CurrentScenario.EnableHazarous(_ARG_0_, _ARG_1_)
  end
  if CurrentScenario.tHazarous[_ARG_0_] ~= nil then
    for _FORV_6_, _FORV_7_ in pairs(CurrentScenario.tHazarous[_ARG_0_].Triggers) do
      if CanaManageHazarousEntity(_ARG_0_, "Triggers", _FORV_7_, _ARG_1_) and Game.GetEntity(_FORV_7_) ~= nil then
        if _ARG_1_ then
          Game.GetEntity(_FORV_7_):Disable()
        else
          Game.GetEntity(_FORV_7_):Enable()
        end
      end
    end
    for _FORV_6_, _FORV_7_ in pairs(CurrentScenario.tHazarous[_ARG_0_].SpawnGroups) do
      if CanaManageHazarousEntity(_ARG_0_, "SpawnGroups", _FORV_7_, _ARG_1_) and Game.GetEntity(_FORV_7_) ~= nil then
        if _ARG_1_ then
          Game.GetEntity(_FORV_7_).SPAWNGROUP:DisableSpawnGroup()
        else
          Game.GetEntity(_FORV_7_).SPAWNGROUP:EnableSpawnGroup()
        end
      end
    end
    for _FORV_6_, _FORV_7_ in pairs(CurrentScenario.tHazarous[_ARG_0_].Usables) do
      if CanaManageHazarousEntity(_ARG_0_, "Usables", _FORV_7_, _ARG_1_) and Game.GetEntity(_FORV_7_) ~= nil then
        Game.GetEntity(_FORV_7_).USABLE:Activate(not _ARG_1_)
      end
    end
  end
end
