function ADN.main()
end
function ADN.OnPickedUp(_ARG_0_, _ARG_1_)
  utils.LOG(utils.LOGTYPE_LOGIC, "ADN picked up")
end
function ADN.GetCurrentScenarioSpawnGroupDNAScanLandmarks(_ARG_0_)
  if CurrentScenario ~= nil and CurrentScenario.tDNAScanLandmarks ~= nil and CurrentScenario.tDNAScanLandmarks[_ARG_0_] ~= nil then
    for _FORV_6_, _FORV_7_ in ipairs(CurrentScenario.tDNAScanLandmarks[_ARG_0_]) do
    end
  end
  return {
    [_FORV_7_] = true
  }
end
function ADN.StartADNAbsorb(_ARG_0_)
  Game.PlayEntityLoop("actors/samus/samus_dnascan.wav", _ARG_0_.sName, 0.1, 5000, 30000, 1, false)
  Game.PlayEntityGUILoop("gui/hud_text.wav", _ARG_0_.sName, 0.5, 1, false)
end
function ADN.FinishADNAbsorb(_ARG_0_)
  Game.StopEntitySound(_ARG_0_.sName, "actors/samus/samus_dnascan.wav", 0.2)
end
function ADN.IncrementADN(_ARG_0_)
  Game.StopEntitySound(_ARG_0_.sName, "gui/hud_text.wav", 0)
  Game.PlayEntityGUISound("generic/holo_get.wav", _ARG_0_.sName, 0.8, 1)
end
