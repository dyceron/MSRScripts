function Omega.main()
end
function Omega.OnDeathCameraFinished()
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathCameraFinished()
end
function Omega.OnDead(_ARG_0_, _ARG_1_)
end
function Omega.GenerateADN(_ARG_0_)
  Game.GetDefaultPlayer().ADNSCANNERUSER:OnADNGeneratingEnemyDeathStart(_ARG_0_)
end
