function Alpha.main()
end
function Alpha.OnSpawned(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntityLoop("actors/alpha/alpha_loop.wav", _ARG_0_.sName, 0.5, 300, 1800, 1, false)
  end
end
function Alpha.OnDeathCameraFinished()
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathCameraFinished()
end
function Alpha.OnDead(_ARG_0_, _ARG_1_)
end
function Alpha.GenerateADN(_ARG_0_)
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathStart(_ARG_0_)
end
function Alpha.OnScheduledBombFire(_ARG_0_)
  Game.PlayEntitySound("actors/alpha/alpha_triple_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.4, 500, 3000, 0.9)
end
function Alpha.OnBombFire(_ARG_0_)
  Game.PlayEntitySound("actors/alpha/alpha_bombthrow_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.7, 500, 3000, 1)
end
function Alpha.OnFrozenStart(_ARG_0_)
end
function Alpha.OnFrozenEnd(_ARG_0_)
end
