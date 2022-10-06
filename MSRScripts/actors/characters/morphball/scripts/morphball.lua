Game.ImportLibraryWithName("actors/characters/player/scripts/player.lua", "Player")
MorphBall = {}
setmetatable(MorphBall, {__index = Player})
function MorphBall.main()
end
function MorphBall.OnBombFire(_ARG_0_)
  Game.PlayEntitySound("weapons/bomb_deploy_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 3000, 1.3)
end
function MorphBall.OnPowerBombFire(_ARG_0_)
  Game.PlayEntitySound("weapons/bomb_deploy_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 3000, 1.3)
end
function MorphBall.OnBombWeaponChanged(_ARG_0_)
  Game.PlayEntitySound("weapons/select_bombs.wav", _ARG_0_.sName, 0.3, 500, 5000, 1)
end
function MorphBall.OnBeforeDamage(_ARG_0_, _ARG_1_)
  if _ARG_1_ == false then
    Game.PlayEntitySound("actors/samus/impact_med_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.2, 500, 5000, 1.3)
  else
    Game.PlayEntitySound("actors/samus/impact_hard_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 1, 500, 5000, 1)
  end
end
function MorphBall.OnHitBlockedByShield(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_1_ == false or _ARG_2_ == true then
    Game.PlayEntitySound("actors/samus/ener_boom_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 1, 500, 3000, 1.1)
  end
end
