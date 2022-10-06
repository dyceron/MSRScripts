function Glowfly.main()
end
function Glowfly.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/glowfly/glowfly_voice_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.3, 500, 3000, 1.1)
  end
end
function Glowfly.OnExplodeInmediately(_ARG_0_)
  Game.PlayEntitySound("generic/evey_death_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 1, 200, 2000, 0.9)
  Game.PlayEntitySound("weapons/kick_hit_02.wav", _ARG_0_.sName, 0.4, 150, 1450, 0.9)
end
