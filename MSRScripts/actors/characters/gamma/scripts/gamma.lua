function Gamma.main()
end
function Gamma.OnDeathCameraFinished()
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathCameraFinished()
end
function Gamma.OnDead(_ARG_0_, _ARG_1_)
end
function Gamma.GenerateADN(_ARG_0_)
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathStart(_ARG_0_)
end
function Gamma.GetNumValveUsed(_ARG_0_)
  if _ARG_0_.SPAWNPOINT.sSpawnGroup ~= nil and Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup) ~= nil and Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup).SPAWNGROUP.sArenaId ~= nil and Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup).SPAWNGROUP.sArenaId ~= "" then
    return (Scenario.ReadFromBlackboard("Arena_" .. Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup).SPAWNGROUP.sArenaId .. "_ValveUsed", 0))
  end
  return 0
end
function Gamma.OnMultiArenaTrigger(_ARG_0_, _ARG_1_)
  Game.DisableTrigger("TG_" .. _ARG_0_ .. "_" .. _ARG_1_)
  if Game.GetEntity("SG_" .. _ARG_0_ .. "_" .. _ARG_1_) ~= nil then
    Game.GetEntity("SG_" .. _ARG_0_ .. "_" .. _ARG_1_).SPAWNGROUP:EnableSpawnGroup()
  end
  Scenario.WriteToBlackboard("Arena_" .. _ARG_0_ .. "_UseIntro", "b", false)
  if Game.GetEntity("SP_" .. _ARG_0_ .. "_" .. _ARG_1_) ~= nil and Game.GetEntity("SP_" .. _ARG_0_ .. "_" .. _ARG_1_).SPAWNPOINT ~= nil then
    Game.GetEntity("SP_" .. _ARG_0_ .. "_" .. _ARG_1_).SPAWNPOINT:Activate()
  end
  if Game.GetEntity("SP_" .. _ARG_0_ .. "_Intro_" .. _ARG_1_) ~= nil and Game.GetEntity("SP_" .. _ARG_0_ .. "_Intro_" .. _ARG_1_).SPAWNPOINT ~= nil then
    Game.GetEntity("SP_" .. _ARG_0_ .. "_Intro_" .. _ARG_1_).SPAWNPOINT:Deactivate()
  end
end
function Gamma.SetArenaLife(_ARG_0_, _ARG_1_)
  if _ARG_0_.SPAWNPOINT.sSpawnGroup ~= nil and Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup) ~= nil and Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup).SPAWNGROUP.sArenaId ~= nil and Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup).SPAWNGROUP.sArenaId ~= "" and Scenario.ReadFromBlackboard("Arena_" .. Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup).SPAWNGROUP.sArenaId .. "_Life", -1) > 0 then
    _ARG_1_.AI.fArenaLife = Scenario.ReadFromBlackboard("Arena_" .. Game.GetEntity(_ARG_0_.SPAWNPOINT.sSpawnGroup).SPAWNGROUP.sArenaId .. "_Life", -1)
  end
end
function Gamma.OnFrozenStart(_ARG_0_)
  Game.SetEntitySoundPitch(_ARG_0_.sName, "actors/alpha/alpha_loop.wav", 0.8)
  Game.PlayEntityLoop("generic/freezed_bosses_loop.wav", _ARG_0_.sName, 0.2, 500, 3000, 1, false)
end
function Gamma.OnFrozenEnd(_ARG_0_)
  Game.SetEntitySoundPitch(_ARG_0_.sName, "actors/alpha/alpha_loop.wav", 1)
  Game.StopEntitySound(_ARG_0_.sName, "generic/freezed_bosses_loop.wav", 0.5)
end
function Gamma.OnBombFire(_ARG_0_)
  Game.PlayEntitySound("actors/gamma/gamma_bombsvoice_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.4, 500, 3000, 1.1)
end
function Gamma.PlayInLairScream(_ARG_0_)
  Game.PlayEntitySound("actors/gamma/gamma_hidden_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.8, 500, 3000, 0.9)
end
function Gamma.OnFXMouthStart(_ARG_0_)
  Game.PlayEntityLoop("actors/gamma/gamma_shieldloop.wav", _ARG_0_.sName, 0.4, 300, 1600, 1.5, false)
end
function Gamma.OnFXMouthEnd(_ARG_0_)
  Game.StopEntitySound(_ARG_0_.sName, "actors/gamma/gamma_shieldloop.wav", 0.2)
end
function Gamma.OnFXShellStart(_ARG_0_)
end
function Gamma.OnFXShellEnd(_ARG_0_)
end
