function Drivel.main()
end
function Drivel.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/drivel/drivel_attackpain_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.4, 500, 3000, 1.1)
  end
end
function Drivel.OnScheduledBombFire(_ARG_0_)
end
function Drivel.OnBombFire(_ARG_0_)
end
