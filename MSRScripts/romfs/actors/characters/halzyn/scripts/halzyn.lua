function Halzyn.main()
end
function Halzyn.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/halzyn/halzyn_pain_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.5, 500, 3000, 1.2)
  end
end
