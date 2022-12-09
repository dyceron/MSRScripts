function IntroManicMinerBotChase_Samus.main()
end
function IntroManicMinerBotChase_Samus.OnWeaponChanged(_ARG_0_)
  Game.GetDefaultPlayer().GUN:SelectGun("SpazerBeam", true)
  _ARG_0_.MODELUPDATER:UpdateCurrentPrimaryWeaponColor()
end
