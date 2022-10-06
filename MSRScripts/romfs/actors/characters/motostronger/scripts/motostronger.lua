function MotoStronger.main()
end
function MotoStronger.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/moto/moto_hurt_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.4, 500, 3000, 1.3)
  end
end
