function ArachnusFireSplash.main()
end
function ArachnusFireSplash.OnDestroy(_ARG_0_, _ARG_1_)
  if _ARG_1_ == "" then
    Game.PlayEntitySound("actors/arachnus/arachnus_fireboom_01.wav", _ARG_0_.sName, 0.5, 200, 1900, 1)
  end
end
function ArachnusFireSplash.OnMeleeAttack(_ARG_0_)
  _ARG_0_:DelMe()
end
