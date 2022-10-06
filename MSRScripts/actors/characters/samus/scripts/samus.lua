Game.ImportLibraryWithName("actors/characters/player/scripts/player.lua", "Player")
Samus = {}
setmetatable(Samus, {__index = Player})
function Samus.main()
  Game.ImportLibraryWithName("actors/props/damageplants/scripts/damageplants.lua", "DamagePlants", false)
end
function Samus.OnDamage(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  Samus.NotifyDamage(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
end
function Samus.OnHackedTrapInitialDamage(_ARG_0_, _ARG_1_, _ARG_2_)
  Game.PlayEntitySound("weapons/singleshot_fleshimpact_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 1, 500, 5000, 1)
  Samus.NotifyDamage(_ARG_0_.sName, _ARG_1_, _ARG_2_)
end
function Samus.NotifyDamage(_ARG_0_, _ARG_1_, _ARG_2_)
  if CurrentScenario ~= nil and CurrentScenario.OnPlayerDamaged ~= nil then
    CurrentScenario.OnPlayerDamaged(_ARG_0_.sName, _ARG_1_, _ARG_2_)
  end
end
function Samus.OnStartGrab(_ARG_0_, _ARG_1_)
  if CurrentScenario.OnPlayerStartGrab ~= nil then
    CurrentScenario.OnPlayerStartGrab(_ARG_0_.sName, _ARG_1_)
  end
end
function Samus.OnGrabbedBy(_ARG_0_)
  utils.LOG(utils.LOGTYPE_LOGIC, _ARG_0_.sName .. " grabbed by " .. _ARG_0_.sName)
end
function Samus.OnEndGrab(_ARG_0_, _ARG_1_)
end
function Samus.OnEndGrabbedBy(_ARG_0_)
  utils.LOG(utils.LOGTYPE_LOGIC, "Samus: end grabbed by " .. _ARG_0_.sName)
end
function Samus.OnBeforeDamage(_ARG_0_, _ARG_1_)
end
function Samus.Delete()
  Game.DeleteEntity(Game.GetPlayer().sName)
end
function Samus.OnRevived(_ARG_0_)
  if CurrentScenario.OnPlayerRevived ~= nil then
    CurrentScenario.OnPlayerRevived(_ARG_0_.sName)
  end
end
function Samus.OnPowerBeamFire(_ARG_0_, _ARG_1_)
  if _ARG_1_ == true then
    Game.PlayEntitySound("weapons/samus_chargedbeam_01.wav", _ARG_0_.sName, 0.5, 500, 5000, 1)
  else
    Game.PlayEntitySound("weapons/samus_singleshot_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 5000, 1)
  end
end
function Samus.OnIceBeamFire(_ARG_0_, _ARG_1_)
  if _ARG_1_ == true then
    Game.PlayEntitySound("weapons/samus_chargedice_01.wav", _ARG_0_.sName, 0.5, 500, 5000, 1.2)
  else
    Game.PlayEntitySound("weapons/iceshot_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 5000, 1.2)
  end
end
function Samus.OnWaveBeamFire(_ARG_0_, _ARG_1_, _ARG_2_)
  if not _ARG_2_ then
    if _ARG_1_ == true then
      Game.PlayEntitySound("weapons/samus_chargedspazer_01.wav", _ARG_0_.sName, 0.3, 500, 5000, 1.3)
    else
      Game.PlayEntitySound("weapons/spazershot_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.3, 500, 5000, 1)
    end
  end
end
function Samus.OnSpazerBeamFire(_ARG_0_, _ARG_1_, _ARG_2_)
  if not _ARG_2_ then
    if _ARG_1_ == true then
      Game.PlayEntitySound("weapons/samus_chargedwave_01.wav", _ARG_0_.sName, 0.3, 500, 5000, 1)
    else
      Game.PlayEntitySound("weapons/waveshot_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.3, 500, 5000, 1)
    end
  end
end
function Samus.OnPlasmaBeamFire(_ARG_0_, _ARG_1_, _ARG_2_)
  if not _ARG_2_ then
    if _ARG_1_ == true then
      Game.PlayEntitySound("weapons/samus_chargedplasma_01.wav", _ARG_0_.sName, 0.6, 500, 5000, 1)
    else
      Game.PlayEntitySound("weapons/plasma_shot_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.4, 500, 5000, 1)
    end
  end
end
function Samus.OnMissileFire(_ARG_0_)
  Game.PlayEntitySound("weapons/rocket_shot_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 5000, 1)
end
function Samus.OnGrappleBeamFire(_ARG_0_)
  Game.PlayEntitySound("weapons/grapple_shot_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 5000, 1)
end
function Samus.OnSuperMissileFire(_ARG_0_)
  Game.PlayEntitySound("weapons/supermissile_shot_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.6, 500, 5000, 1)
end
function Samus.OnMissileOpen(_ARG_0_)
  Game.PlayEntitySound("weapons/open_weapon_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.2, 500, 5000, 1)
end
function Samus.OnMissileClose(_ARG_0_)
  Game.PlayEntitySound("weapons/close_weapon_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.2, 500, 5000, 1)
end
function Samus.OnMissileWeaponChanged(_ARG_0_)
  Game.PlayEntitySound("weapons/select_weapon_0" .. math.random(2) .. ".wav", Game.GetPlayer().sName, 0.3, 500, 5000, 1)
end
function Samus.OnBeamWeaponChanged(_ARG_0_, _ARG_1_)
  if not _ARG_1_ then
    Game.PlayEntitySound("weapons/select_beam.wav", Game.GetPlayer().sName, 0.3, 500, 5000, 1.3)
  end
end
Samus.iBreathSound = 0
Samus.asBreathSounds = {}
function Samus.OnBreathRecovered(_ARG_0_)
  Samus.iBreathSound = (Samus.iBreathSound + 1) % #Samus.asBreathSounds
end
function Samus.OnLongJump(_ARG_0_)
end
function Samus.OnShieldSynchronizedBlock(_ARG_0_)
  Game.PlayEntitySound("generic/sync_shield.wav", _ARG_0_.sName, 1, 900, 50000, 1)
end
function Samus.OnAnalogAimingLaserCreated(_ARG_0_)
  Game.PlayEntitySound("actors/samus/apuntado_laser.wav", _ARG_0_.sName, 0.1, 500, 2500, 1.1)
end
function Samus.OnMeleeAttackCrazy(_ARG_0_)
  Game.PlayEntitySound("weapons/kick_hit_02.wav", _ARG_0_.sName, 0.4, 300, 2500, 1)
end
function Samus.OnMeleeAttackImpact(_ARG_0_)
  Game.PlayEntitySound("weapons/kick_hit_02.wav", _ARG_0_.sName, 0.4, 300, 2500, 1.5)
end
function Samus.OnMeleeAttackPush(_ARG_0_)
  Game.PlayEntitySound("weapons/push_hit_01.wav", _ARG_0_.sName, 1, 300, 2500, 1.2)
end
function Samus.OnMeleeAttackBlocked(_ARG_0_, _ARG_1_)
  if _ARG_1_ then
    Game.PlayEntitySound("weapons/ice_hit_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 0.5, 500, 3000, 1.5)
  else
    Game.PlayEntitySound("actors/samus/samus_kickattackfail_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.4, 300, 2500, 1)
  end
end
function Samus.OnElectricMeleeStart(_ARG_0_)
  Game.PlayEntitySound("weapons/grapple_swing_0" .. math.random(3) .. ".wav", _ARG_0_.sName, 1, 500, 3500, 1)
end
function Samus.OnSynchronizedBlockMissedPunish(_ARG_0_)
  Game.PlayEntitySound("actors/samus/samus_shieldfail.wav", _ARG_0_.sName, 0.6, 300, 2500, 1.3)
end
function Samus.OnKickJump(_ARG_0_)
  Game.PlayEntitySound("actors/samus/samus_grabhand_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.15, 300, 2500, 0.75)
end
function Samus.OnHitBlockedByShield(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_1_ == false or _ARG_2_ == true then
    Game.PlayEntitySound("actors/samus/ener_boom_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 1, 500, 3000, 1.1)
  end
end
