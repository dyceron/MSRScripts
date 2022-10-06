function HornoadSpit.main()
end
function HornoadSpit.OnDestroy(_ARG_0_)
  Game.PlayEntitySound("actors/hornhoad/hornhoad_spitsplash_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.55, 200, 1600, 1.3)
end
function HornoadSpit.OnMeleeAttack(_ARG_0_)
  _ARG_0_:DelMe()
end
