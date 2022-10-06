function Moheek.main()
end
function Moheek.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/moheek/moheek_deathvoice_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.6, 500, 3000, 1)
  end
end
