function PowerUpPowerBomb.main()
end
function PowerUpPowerBomb.OnPickedUp(_ARG_0_)
  Game.GetSecondaryPlayer().GUN:SelectGun("PowerBomb", false)
end
