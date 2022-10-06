function Hornoad.main()
end
function Hornoad.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/hornhoad/hornhoad_impact_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.6, 500, 3000, 1.1)
  end
end
