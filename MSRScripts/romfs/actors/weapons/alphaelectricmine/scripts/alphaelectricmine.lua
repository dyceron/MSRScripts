function AlphaElectricMine.main()
end
function AlphaElectricMine.OnDestroy(_ARG_0_)
  Game.PlayEntitySound("actors/alpha/alpha_bombs_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.6, 300, 2200, 1)
end
