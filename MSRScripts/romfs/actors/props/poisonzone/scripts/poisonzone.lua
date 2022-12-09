Game.ImportLibrary("system/scripts/fxcallbacks.lua", false)
PoisonZone = {sFxPoisonZone = "inhazard"}
function PoisonZone.main()
end
function PoisonZone.Reset()
  Game.GetPlayerInfo():ResetHazardousCount()
  fxcallbacks.SetFxEnabledOnPlayer(PoisonZone.sFxPoisonZone, false, false)
  Game.GetPlayer():StopEntityLoopWithFade("actors/samus/damage_alarm.wav", 0.6)
end
function PoisonZone.OnPlayerDead()
  PoisonZone.Reset()
  utils.LOG(utils.LOGTYPE_LOGIC, "poisonzonedead")
end
function PoisonZone.OnEnter(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_2_ == true then
    PoisonZone.OnEnter()
  end
end
function PoisonZone.OnEnter()
  utils.LOG(utils.LOGTYPE_LOGIC, "poisonzoneenter inside count" .. Game.GetPlayerInfo().iHazardousCount)
  if Game.GetPlayerInfo().iHazardousCount == 0 then
    Game.GetPlayer():PlayEntityLoop("actors/samus/damage_alarm.wav", 0.4, 100000, 110000, 1, false)
    Game.PlayEntitySound("levels/hazarous_pain_0" .. math.random(2) .. ".wav", Game.GetPlayer().sName, 0.45, 500, 5000, 1)
    guicallbacks.OnPlayerContinuousDamageStart()
    fxcallbacks.SetFxEnabledOnPlayer(PoisonZone.sFxPoisonZone, true, true)
    utils.LOG(utils.LOGTYPE_LOGIC, "poisonzoneenter")
  end
  Game.GetPlayerInfo():IncrementHazardousCount()
end
function PoisonZone.OnExit(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_2_ == true then
    PoisonZone.OnExit()
  end
end
function PoisonZone.OnExit()
  Game.GetPlayerInfo():DecrementHazardousCount()
  utils.LOG(utils.LOGTYPE_LOGIC, "poisonzoneexit inside count" .. Game.GetPlayerInfo().iHazardousCount)
  if Game.GetPlayerInfo().iHazardousCount == 0 then
    Game.GetPlayer():StopEntityLoopWithFade("actors/samus/damage_alarm.wav", 0.6)
    guicallbacks.OnPlayerContinuousDamageEnd()
    fxcallbacks.SetFxEnabledOnPlayer(PoisonZone.sFxPoisonZone, false, false)
    utils.LOG(utils.LOGTYPE_LOGIC, "poisonzoneexit")
  elseif Game.GetPlayerInfo().iHazardousCount < 0 then
    Game.GetPlayerInfo():ResetHazardousCount()
  end
end
function PoisonZone.OnDisable()
  PoisonZone.Reset()
end
