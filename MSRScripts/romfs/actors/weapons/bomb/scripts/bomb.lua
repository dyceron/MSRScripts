function Bomb.main()
end
function Bomb.OnExplosion(_ARG_0_)
  Game.PlayEntitySound("weapons/bomb_boom_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 3000, 1)
end
