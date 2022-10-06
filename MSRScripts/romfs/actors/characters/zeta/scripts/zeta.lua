function Zeta.main()
end
function Zeta.OnDead(_ARG_0_, _ARG_1_)
  if _ARG_0_.GRAB ~= nil and _ARG_0_.GRAB.bIsInGrab then
    Game.PlayRelativeCameraAnimation(_ARG_0_.sName, {
      AnimationPath = "actors/characters/zeta/cameras/grabtodeath.bccam",
      Duration = "-1.0",
      EndCallback = "",
      ExitInterpStoringValues = false,
      ExitInterpTime = "1.0",
      ExitWantsToForceEntitiesInFOV = false,
      HideGUI = false,
      IniFrame = "0",
      InitInterpFactor = "5.0",
      InitInterpTime = "1.0",
      InvertAng = true,
      InvertSide = false,
      RawChange = false,
      ReplaceCurrentCameraAnimation = true,
      ResetInterpOnPossess = false,
      StartCallback = "",
      UpdateGoalParamsOnExitInterpolation = true
    })
  end
end
function Zeta.OnDeadFinalAnim(_ARG_0_, _ARG_1_)
end
function Zeta.GenerateADN(_ARG_0_)
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathStart(_ARG_0_)
end
function Zeta.OnDeathCameraFinished()
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathCameraFinished()
end
function Zeta.OnFireBallScenarioHitBounce(_ARG_0_, _ARG_1_, _ARG_2_)
  Game.PlayPosSound("actors/zeta/zeta_bounceballwall_0" .. math.random(2) .. ".wav", _ARG_0_, _ARG_1_, _ARG_2_, 1, 300, 1200, 0.5)
end
function Zeta.OnProjectileEntityCollision(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  Game.PlayPosSound("actors/zeta/zeta_fireball_hit_0" .. math.random(2) .. ".wav", _ARG_1_, _ARG_2_, _ARG_3_, 1.1, 500, 1500, 1)
end
function Zeta.OnProjectileScenarioCollision(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  Game.PlayPosSound("actors/zeta/zeta_fireball_hit_0" .. math.random(2) .. ".wav", _ARG_1_, _ARG_2_, _ARG_3_, 1, 500, 1750, 1)
end
