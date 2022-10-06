function WallfireFireball.main()
end
function WallfireFireball.OnProjectileEntityCollision(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  Game.PlayPosSound("actors/wallfire/wallfire_firehit_0" .. math.random(2) .. ".wav", _ARG_1_, _ARG_2_, _ARG_3_, 1.3, 500, 1750, 1)
end
function WallfireFireball.OnProjectileScenarioCollision(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  Game.PlayPosSound("actors/wallfire/wallfire_firehit_0" .. math.random(2) .. ".wav", _ARG_1_, _ARG_2_, _ARG_3_, 0.8, 300, 1100, 1)
end
