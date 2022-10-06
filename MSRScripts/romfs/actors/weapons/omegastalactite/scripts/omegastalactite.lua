function OmegaStalactite.main()
end
function OmegaStalactite.OnCollision(_ARG_0_)
end
function OmegaStalactite.OnLaunched(_ARG_0_)
end
function OmegaStalactite.OnDestroy(_ARG_0_)
  Game.PlayEntitySound("generic/tile_break_0" .. math.random(4) .. ".wav", _ARG_0_.sName, 1, 400, 2200, 1.3)
end
