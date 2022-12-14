function Arachnus.main()
end
function Arachnus.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/arachnus/arachnus_firevoice_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.4, 500, 3000, 1.4)
  end
end
function Arachnus.OnProjectileEntityCollision(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  Game.PlayPosSound("actors/arachnus/arachnus_fireboom_01.wav", _ARG_1_, _ARG_2_, _ARG_3_, 1.2, 500, 1750, 1)
end
function Arachnus.OnProjectileScenarioCollision(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  Game.PlayPosSound("actors/arachnus/arachnus_fireboom_01.wav", _ARG_1_, _ARG_2_, _ARG_3_, 1.1, 500, 1750, 1)
end
function Arachnus.OnDeath(_ARG_0_)
  if Game.GetPlayer() ~= nil then
    Game.GetPlayer().LIFE:SetInvulnerableWithReaction(false)
  end
end
