function ItemSphereIceBeam.main()
end
function ItemSphereIceBeam.OnOpen(_ARG_0_)
  Game.PlayEntitySoundContinueOnDead("generic/itemsphere_crack.wav", _ARG_0_.sName, 1, 500, 5000, 1.5)
end
