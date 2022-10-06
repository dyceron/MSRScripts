function Fan.main()
end
function Fan.OnBombSwallowed(_ARG_0_)
  Game.PlayEntitySound("props/fan/fan_swallow_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.5, 100, 3000, 1)
end
