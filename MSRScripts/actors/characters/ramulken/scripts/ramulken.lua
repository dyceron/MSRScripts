function Ramulken.main()
end
function Ramulken.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/ramulken/ramulken_pain_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 3000, 1.3)
  end
end
