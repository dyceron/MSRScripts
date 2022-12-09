FirstTimeDNAStatueHint = {}
function FirstTimeDNAStatueHint.main()
end
function FirstTimeDNAStatueHint.OnEnterWithoutDNA()
  Game.PlayRelativeCameraAnimation("LE_ChozoUnlockAreaDNA", {
    AnimationPath = "actors/characters/samus/cameras/firstchozoadn.bccam",
    Duration = "-1.0",
    EndCallback = "FirstTimeDNAStatueHint.OnCameraAnimationEnd",
    ExitInterpStoringValues = false,
    ExitInterpTime = "0.7",
    ExitWantsToForceEntitiesInFOV = false,
    HideGUI = false,
    IniFrame = "0",
    InitInterpFactor = "4.0",
    InitInterpTime = "1.4",
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
function FirstTimeDNAStatueHint.OnEnterWithDNA()
  Game.PlayRelativeCameraAnimation("LE_ChozoUnlockAreaDNA", {
    AnimationPath = "actors/characters/samus/cameras/firstchozowithadn.bccam",
    Duration = "-1.0",
    EndCallback = "",
    ExitInterpStoringValues = false,
    ExitInterpTime = "0.0",
    ExitWantsToForceEntitiesInFOV = false,
    HideGUI = "false",
    IniFrame = "0",
    InitInterpFactor = "0.0",
    InitInterpTime = "0.0",
    InvertAng = false,
    InvertSide = true,
    RawChange = true,
    ReplaceCurrentCameraAnimation = true,
    ResetInterpOnPossess = false,
    StartCallback = "",
    UpdateGoalParamsOnExitInterpolation = false
  })
end
function FirstTimeDNAStatueHint.SetHintUseDNAExecuted()
  oUsable = Game.GetEntity("LE_ChozoUnlockAreaDNA").USABLE
  oUsable:SetHintUseDNAExecuted()
end
function FirstTimeDNAStatueHint.OnCameraAnimationEnd()
  Game.SetPlayerInputEnabled(true, true)
end
