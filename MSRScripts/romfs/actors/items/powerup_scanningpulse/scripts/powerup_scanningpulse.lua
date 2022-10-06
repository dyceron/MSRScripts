function PowerUpScanningPulse.main()
end
function PowerUpScanningPulse.BeginPlay(_ARG_0_)
  Game.PlayEntityLoop("generic/hability_projector.wav", _ARG_0_.sName, 0.15, 600, 1800, 1.2, false)
end
function PowerUpScanningPulse.OnPickedUp(_ARG_0_)
  Game.ScanningPulseTutorialSE_XY()
  Game.PlayEntitySoundContinueOnDead("generic/obtencion.wav", _ARG_0_.sName, 1, 500, 4000, 1)
  CurrentScenario.LaunchSpecialEnergyCutscene()
  SpecialEnergyCloud.ActivateSpecialEnergy("TG_SpecialEnergyCloud")
  Game.HUDAvailabilityGoOff(true, false, false, false)
  Game.SetIgnoreHUDAvailabilityActivationByAbilityComponent(true)
end
