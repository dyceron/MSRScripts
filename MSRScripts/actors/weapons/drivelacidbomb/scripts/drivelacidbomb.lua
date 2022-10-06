function DrivelAcidBomb.main()
end
function DrivelAcidBomb.OnDestroy(_ARG_0_)
  Game.PlayEntitySound("actors/hornhoad/hornhoad_spitsplash_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.6, 200, 1800, 1)
end
