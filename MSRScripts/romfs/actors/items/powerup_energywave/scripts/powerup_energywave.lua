function PowerUpEnergyWave.main()
end
function PowerUpEnergyWave.BeginPlay(_ARG_0_)
  Game.PlayEntityLoop("generic/hability_projector.wav", _ARG_0_.sName, 0.15, 600, 1800, 1.2, false)
end
function PowerUpEnergyWave.OnPickedUp(_ARG_0_)
  if Game.GetPlayer() ~= nil and Game.GetPlayer().SPECIALENERGY ~= nil then
    Game.GetPlayer().SPECIALENERGY.fMaxEnergy = Game.GetPlayer().SPECIALENERGY.fMaxEnergy + 150
    Game.GetPlayer().SPECIALENERGY.fEnergy = Game.GetPlayer().SPECIALENERGY.fMaxEnergy
  end
  Game.PlayEntitySoundContinueOnDead("generic/obtencion.wav", _ARG_0_.sName, 1, 500, 4000, 1)
  CurrentScenario.LaunchSpecialEnergyCutscene()
  SpecialEnergyCloud.ActivateSpecialEnergy("TG_SpecialEnergyCloud")
  Game.GetPlayerInfo():FillSpecialEnergyReserveTank()
  Game.HUDAvailabilityGoOff(true, false, false, false)
  Game.SetIgnoreHUDAvailabilityActivationByAbilityComponent(true)
end
