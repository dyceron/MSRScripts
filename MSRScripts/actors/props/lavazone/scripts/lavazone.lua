Game.ImportLibrary("system/scripts/fxcallbacks.lua", false)
Game.ImportLibrary("actors/props/heatzone/scripts/heatzone.lua", false)
LavaZone = {iInsideCount = 0, sFXLavaZone = "inflames"}
function LavaZone.main()
end
function LavaZone.Reset()
  LavaZone.iInsideCount = 0
  fxcallbacks.SetFxEnabledOnPlayer(LavaZone.sFXLavaZone, false, false)
  Game.GetPlayer():StopEntityLoopWithFade("actors/samus/damage_alarm.wav", 0.6)
end
function LavaZone.OnPlayerDead()
  LavaZone.Reset()
  utils.LOG(utils.LOGTYPE_LOGIC, "LavaZoneDead")
end
function LavaZone.OnEnter(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_2_ == true then
    LavaZone.OnEnter()
  end
end
function LavaZone.OnExit(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_2_ == true then
    LavaZone.OnExit()
  end
end
function LavaZone.OnEnter()
  utils.LOG(utils.LOGTYPE_LOGIC, "LavaZoneEnter inside count" .. LavaZone.iInsideCount)
  if LavaZone.iInsideCount == 0 and not (0 < Game.GetGravitySuitOn()) then
    guicallbacks.OnPlayerContinuousDamageStart()
    fxcallbacks.SetFxEnabledOnPlayer(LavaZone.sFXLavaZone, true, true)
    Game.GetPlayer():PlayEntityLoop("actors/samus/damage_alarm.wav", 0.4, 100000, 110000, 1, false)
    Game.PlayEntitySound("levels/hazarous_pain_0" .. math.random(2) .. ".wav", Game.GetPlayer().sName, 0.45, 500, 5000, 1)
    utils.LOG(utils.LOGTYPE_LOGIC, "LavaZoneEnter")
  end
  LavaZone.iInsideCount = LavaZone.iInsideCount + 1
end
function LavaZone.OnExit()
  utils.LOG(utils.LOGTYPE_LOGIC, "LavaZoneExit inside count" .. LavaZone.iInsideCount)
  LavaZone.iInsideCount = LavaZone.iInsideCount - 1
  if LavaZone.iInsideCount == 0 and not (0 < Game.GetGravitySuitOn()) then
    if Game.GetPlayerInfo().iHeatZoneCount == 0 or 0 < Game.GetVariaSuitOn() then
      guicallbacks.OnPlayerContinuousDamageEnd()
      Game.GetPlayer():StopEntityLoopWithFade("actors/samus/damage_alarm.wav", 0.6)
    end
    fxcallbacks.SetFxEnabledOnPlayer(LavaZone.sFXLavaZone, false, false)
    utils.LOG(utils.LOGTYPE_LOGIC, "LavaZoneExit")
  end
  if LavaZone.iInsideCount < 0 then
    LavaZone.iInsideCount = 0
  end
end
function LavaZone.OnDisable()
  LavaZone.Reset()
end
