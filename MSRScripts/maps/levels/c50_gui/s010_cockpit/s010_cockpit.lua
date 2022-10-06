function s010_cockpit.main()
  Game.SetCurrentEnvironmentPreset("default")
end
function s010_cockpit.InitFromBlackboard()
  Game.PlayCameraAnimation({
    AnimationPath = "actors/props/menu_samus/cameras/exterior.bccam",
    AnimID = "CameraINTRO",
    Duration = "-1.0",
    EndCallback = "",
    ExitInterpStoringValues = false,
    ExitInterpTime = "0.0",
    ExitWantsToForceEntitiesInFOV = false,
    HideGUI = false,
    IniFrame = "0",
    InitInterpFactor = "4.0",
    InitInterpTime = "0.0",
    InvertAng = false,
    InvertSide = true,
    LoopAnim = true,
    RawChange = true,
    ReplaceCurrentCameraAnimation = true,
    ResetInterpOnPossess = false,
    StartCallback = "",
    UpdateGoalParamsOnExitInterpolation = false
  })
  Game.SetEntityAction("LE_Samus", "relax", 0)
  Game.SetEntityAction("LE_Baby", "relax", 0)
  Game.SetEntityAction("LE_Ship", "relax", 0)
  Game.SetEntityAction("LE_Planet", "relax", 0)
  Game.DisableEntity("LE_Baby")
end
function s010_cockpit.PlayInteriorCameraAnimation()
  Game.PlayCameraAnimation({
    AnimationPath = "actors/props/menu_samus/cameras/interior.bccam",
    AnimID = "CameraINTRO",
    Duration = "-1.0",
    EndCallback = "",
    ExitInterpStoringValues = false,
    ExitInterpTime = "0.0",
    ExitWantsToForceEntitiesInFOV = false,
    HideGUI = false,
    IniFrame = "0",
    InitInterpFactor = "4.0",
    InitInterpTime = "0.0",
    InvertAng = false,
    InvertSide = true,
    LoopAnim = true,
    RawChange = false,
    ReplaceCurrentCameraAnimation = true,
    ResetInterpOnPossess = false,
    StartCallback = "",
    UpdateGoalParamsOnExitInterpolation = false
  })
end
function s010_cockpit.PlayEnterCameraAnimation()
  Game.PlayCameraAnimation({
    AnimationPath = "actors/props/menu_samus/cameras/enter.bccam",
    AnimID = "CameraINTRO",
    Duration = "-1.0",
    EndCallback = "s010_cockpit.PlayInteriorCameraAnimation",
    ExitInterpStoringValues = false,
    ExitInterpTime = "0.0",
    ExitWantsToForceEntitiesInFOV = false,
    HideGUI = false,
    IniFrame = "0",
    InitInterpFactor = "4.0",
    InitInterpTime = "0.0",
    InvertAng = false,
    InvertSide = true,
    LoopAnim = false,
    RawChange = false,
    ReplaceCurrentCameraAnimation = true,
    ResetInterpOnPossess = false,
    StartCallback = "",
    UpdateGoalParamsOnExitInterpolation = false
  })
end
function s010_cockpit.PlayZoomCameraAnimation()
  Game.PlayCameraAnimation({
    AnimationPath = "actors/props/menu_samus/cameras/zoom.bccam",
    AnimID = "CameraINTRO",
    Duration = "-1.0",
    EndCallback = "s010_cockpit.PlayInteriorCameraAnimation",
    ExitInterpStoringValues = false,
    ExitInterpTime = "0.0",
    ExitWantsToForceEntitiesInFOV = false,
    HideGUI = false,
    IniFrame = "0",
    InitInterpFactor = "4.0",
    InitInterpTime = "0.0",
    InvertAng = false,
    InvertSide = true,
    LoopAnim = false,
    RawChange = false,
    ReplaceCurrentCameraAnimation = true,
    ResetInterpOnPossess = false,
    StartCallback = "",
    UpdateGoalParamsOnExitInterpolation = false
  })
end
