hud = {oHUDRoot = nil, iContinuousDamageCount = 0}
Game.ImportLibrary("gui/scripts/sprites_TextureEnergyTankAnims.lua", false)
Game.ImportLibrary("gui/scripts/scenariomenu_game.lua", false)
hud_settings = hud_settings or {}
hud.sDefaultTutorialFont = "digital_medium"
function hud.Create(_ARG_0_)
  hud.bIngameMinimapEnabledOverride = nil
  hud.bBossHUDEnabled = false
  hud.oHUDRoot = GUI.CreateHUDRoot()
  return hud.oHUDRoot
end
function hud.UpdatePlayerInfo(_ARG_0_)
  hud.UpdateMaxEnergy()
  hud.UpdateEnergy(_ARG_0_)
  hud.UpdateSpecialEnergy(_ARG_0_)
  hud.UpdateAbilitySelector()
  hud.BroadUpdateSecondaryGuns()
  hud.BroadUpdatePrimaryGuns()
  hud.UpdateDNACounter()
end
function hud.OnNewPlayerCreated(_ARG_0_, _ARG_1_)
  hud.UpdatePlayerInfo(true)
end
function hud.OnPlayerRevived(_ARG_0_)
  hud.oHUDRoot:OnPlayerRevived()
end
function hud.OnPlayerReinit()
  hud.ResetContinuousDamage()
  hud.UpdatePlayerInfo(true)
end
function hud.OnPlayerPickableItemPickedUp(_ARG_0_, _ARG_1_, _ARG_2_)
  hud.UpdateItemAcquired(_ARG_0_, _ARG_1_, _ARG_2_)
end
function hud.OnPlayerPickableItemHide()
  hud.HideItemAcquired()
end
function hud.OnPlayerSecondaryGunsChanged()
  hud.BroadUpdateSecondaryGuns()
end
function hud.OnPlayerSecondaryGunFire()
  hud.UpdateSecondaryGunFire()
end
function hud.OnPlayerSecondaryGunsFire()
  hud.UpdateSecondaryGunsFire()
end
function hud.OnPlayerSecondaryGunLoop()
  hud.UpdateSecondaryGunLoop()
end
function hud.OnPlayerSelectedAbilityChanged(_ARG_0_)
  hud.UpdateAbilitySelector()
end
function hud.OnPlayerAbilityStateChanged(_ARG_0_)
  hud.UpdateAbilitySelector()
end
function hud.OnPlayerDead(_ARG_0_)
  hud.oHUDRoot:OnPlayerDead()
end
function hud.OnContinuousDamageStart()
  hud.iContinuousDamageCount = hud.iContinuousDamageCount + 1
  if hud.iContinuousDamageCount == 1 then
    hud.oHUDRoot:OnContinuousDamageStart()
  end
end
function hud.OnContinuousDamageEnd()
  hud.iContinuousDamageCount = hud.iContinuousDamageCount - 1
  if hud.iContinuousDamageCount == 0 then
    hud.oHUDRoot:OnContinuousDamageEnd()
  end
end
function hud.ResetContinuousDamage()
  hud.iContinuousDamageCount = 0
  hud.oHUDRoot:ResetContinuousDamage()
end
function hud.OnCurrentScenarioChanged(_ARG_0_)
end
function hud.OnInputFocusedDeviceChanged()
end
function hud.UpdateAbilitySelector()
  hud.oHUDRoot:UpdateAbilitySelector()
end
function hud.UpdateDNACounter(_ARG_0_)
  hud.oHUDRoot:UpdateDNACounter()
end
function hud.UpdateEnergy(_ARG_0_)
  hud.oHUDRoot:UpdatePlayerEnergy(_ARG_0_)
end
function hud.UpdateMaxEnergy()
  hud.oHUDRoot:UpdatePlayerMaxEnergy()
end
function hud.UpdateSpecialEnergy(_ARG_0_)
  hud.oHUDRoot:UpdatePlayerSpecialEnergy(_ARG_0_)
end
function hud.BroadUpdateSecondaryGuns()
  hud.oHUDRoot:UpdateSecondaryGunsInfo()
end
function hud.BroadUpdatePrimaryGuns()
  Game.OnPrimaryGunsPropertiesChanged()
end
function hud.UpdateSecondaryGunFire()
  hud.oHUDRoot:UpdateSecondaryGunsInfo()
end
function hud.UpdateSecondaryGunsFire()
  hud.oHUDRoot:UpdateSecondaryGunsInfo()
end
function hud.UpdateSecondaryGunLoop()
  hud.oHUDRoot:UpdateSecondaryGunsInfo()
end
function hud.SaveCurrentScenarioGameWithAllPreviousMapCellsVisited()
  Game.SaveCurrentScenarioGameWithAllPreviousMapsCellsVisited(tScenarioMenuDefs.aScenarios)
end
