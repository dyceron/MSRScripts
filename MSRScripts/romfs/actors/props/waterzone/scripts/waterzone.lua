WaterZone = {iInsideCount = 0}
function WaterZone.main()
end
function WaterZone.OnPlayerDead()
  WaterZone.iInsideCount = 0
end
function WaterZone.OnEnter(_ARG_0_)
  WaterZone.OnEnter()
end
function WaterZone.OnEnter()
  if WaterZone.iInsideCount == 0 then
    Game.PlayEntitySound("generic/water_in_0" .. math.random(2) .. ".wav", Game.GetPlayer().sName, 0.3, 500, 5000, 1)
    utils.LOG(utils.LOGTYPE_LOGIC, "waterzoneenter")
  end
  WaterZone.iInsideCount = WaterZone.iInsideCount + 1
end
function WaterZone.OnExit(_ARG_0_)
  WaterZone.OnExit()
end
function WaterZone.OnExit()
  WaterZone.iInsideCount = WaterZone.iInsideCount - 1
  if WaterZone.iInsideCount == 0 then
    Game.PlayEntitySound("generic/water_out_0" .. math.random(2) .. ".wav", Game.GetPlayer().sName, 0.3, 500, 5000, 1.2)
    utils.LOG(utils.LOGTYPE_LOGIC, "waterzoneexit")
  elseif WaterZone.iInsideCount < 0 then
    WaterZone.iInsideCount = 0
  end
end
function WaterZone.OnPuddleEnter()
  if WaterZone.iInsideCount == 0 then
    Game.PlayEntitySound("generic/water_in_0" .. math.random(2) .. ".wav", Game.GetPlayer().sName, 0.15, 500, 5000, 1.1)
    utils.LOG(utils.LOGTYPE_LOGIC, "waterminizoneenter")
  end
  WaterZone.iInsideCount = WaterZone.iInsideCount + 1
end
function WaterZone.OnPuddleExit()
  WaterZone.iInsideCount = WaterZone.iInsideCount - 1
  if WaterZone.iInsideCount < 0 then
    WaterZone.iInsideCount = 0
  end
end
