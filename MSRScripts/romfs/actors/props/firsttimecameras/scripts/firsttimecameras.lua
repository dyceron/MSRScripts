FirstTimeCameras = {}
function FirstTimeCameras.main()
end
function FirstTimeCameras.OnChozoStatueRoomEnter()
  if Game.GetFromGameBlackboard("LE_PowerUP_Morphball_firsttime") == false then
    Game.WriteToGameBlackboard("LE_PowerUP_Morphball_firsttime", true)
    Game.PlayRelativeCameraAnimation("LE_PowerUP_Morphball", {
      AnimationPath = "actors/characters/samus/cameras/chozomorphball.bccam",
      Duration = "-1.0",
      EndCallback = "FirstTimeCameras.OnCameraAnimationEnd",
      ExitInterpStoringValues = false,
      ExitInterpTime = "1.0",
      ExitWantsToForceEntitiesInFOV = false,
      HideGUI = false,
      IniFrame = "0",
      InitInterpFactor = "5.0",
      InitInterpTime = "2.0",
      InvertAng = false,
      InvertSide = true,
      RawChange = false,
      ReplaceCurrentCameraAnimation = true,
      ResetInterpOnPossess = false,
      StartCallback = "",
      UpdateGoalParamsOnExitInterpolation = true
    })
    Game.SetPlayerInputEnabled(false, true)
  end
end
function FirstTimeCameras.OnChozoSpecialEnergyStatueSee()
  if Game.GetFromGameBlackboard("LE_SpecialEnergy_Statue") == false then
    Game.WriteToGameBlackboard("LE_SpecialEnergy_Statue", true)
    Game.PlayRelativeCameraAnimation("LE_SpecialEnergy_Statue", {
      AnimationPath = "actors/characters/samus/cameras/firstbestowalstatue.bccam",
      Duration = "-1.0",
      EndCallback = "FirstTimeCameras.OnCameraAnimationEnd",
      ExitInterpStoringValues = true,
      ExitInterpTime = "2.0",
      ExitWantsToForceEntitiesInFOV = false,
      HideGUI = false,
      IniFrame = "0",
      InitInterpFactor = "2.0",
      InitInterpTime = "2.0",
      InvertAng = false,
      InvertSide = true,
      RawChange = false,
      ReplaceCurrentCameraAnimation = true,
      ResetInterpOnPossess = false,
      StartCallback = "",
      UpdateGoalParamsOnExitInterpolation = true
    })
    Game.SetPlayerInputEnabled(false, true)
  end
end
function FirstTimeCameras.OnTeleporterSee()
  Game.ForceConvertToSamus()
  s000_surface.LaunchIntroTeleporterCutscene()
end
function FirstTimeCameras.OnLaunchFirstDialogueEvent()
end
function FirstTimeCameras.OnLaunchSecondDialogueEvent()
end
function FirstTimeCameras.OnCameraAnimationEnd()
  Game.SetPlayerInputEnabled(true, true)
end
