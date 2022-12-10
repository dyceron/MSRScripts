Game.ImportLibraryWithName("system/scripts/logiccallbacks.lua", "logiccallbacks")
guicallbacks = {bAudioModified = false, OnASyncLoadProfileFinishedCallback = nil}
function guicallbacks.SetAudioForPickable()
  if guicallbacks.bAudioModified == true then
    print("GUICallbacks: Trying to change audio after pickable that was already modified")
  else
    guicallbacks.bAudioModified = true
    Game.SetMusicAndSoundsInMenu(true)
  end
end
function guicallbacks.RestoreAudio()
  if guicallbacks.bAudioModified then
    Game.SetMusicAndSoundsInMenu(false)
    guicallbacks.bAudioModified = false
  end
end
function guicallbacks.GoToStateItemSpecialAbilities()
  guicallbacks.RestoreAudio()
  Game.PlayCurrentEnvironmentMusic()
  Game.GoToStateItemSpecialAbilities()
end
function guicallbacks.OnItemSpecialAbilitiesExit()
  guicallbacks.RestoreAudio()
end
function guicallbacks.GoToStateItemStatus()
  guicallbacks.RestoreAudio()
  Game.GoToStateItemStatus()
end
function guicallbacks.OnStateItemStatusExit()
  guicallbacks.RestoreAudio()
end
function guicallbacks.OnPickableItemPickedUp(_ARG_0_, _ARG_1_)
  if _ARG_1_ then
    GUI.LaunchMessageAbilityAdquired(_ARG_0_, "guicallbacks.GoToStateItemSpecialAbilities")
  else
    GUI.LaunchMessagePowerUpAdquired(_ARG_0_, "guicallbacks.GoToStateItemStatus")
  end
end
function guicallbacks.OnScanningPulsePickedUp()
  GUI.LaunchMessageSequence(4)
end
function guicallbacks.OnPickableItemHide()
  if hud then
    guicallbacks.RestoreAudio()
  end
end
function guicallbacks.OnPlayerSecondaryGunsChanged()
  if hud then
    hud.OnPlayerSecondaryGunsChanged()
  end
end
function guicallbacks.OnPlayerSecondaryGunFire()
  if hud then
    hud.OnPlayerSecondaryGunFire()
  end
end
function guicallbacks.OnPlayerSecondaryGunsFire()
  if hud then
    hud.OnPlayerSecondaryGunsFire()
  end
end
function guicallbacks.OnPlayerSecondaryGunLoop(_ARG_0_)
  if hud then
    hud.OnPlayerSecondaryGunLoop()
  end
end
function guicallbacks.OnSelectedAbilityChanged(_ARG_0_, _ARG_1_)
  if hud then
    hud.OnPlayerSelectedAbilityChanged(_ARG_1_)
  end
end
function guicallbacks.OnAbilityStateChanged(_ARG_0_, _ARG_1_)
  if hud then
    hud.OnPlayerAbilityStateChanged(_ARG_1_)
  end
end
function guicallbacks.OnAbilityActivatedChanged(_ARG_0_, _ARG_1_)
  if hud then
    hud.OnPlayerAbilityActivatedChanged(_ARG_1_)
  end
end
function guicallbacks.OnPlayerFailedToSelectAbility(_ARG_0_)
  if hud then
    hud.OnPlayerFailedToSelectAbility(_ARG_0_)
  end
end
function guicallbacks.OnPlayerFailedToActivateAbility(_ARG_0_, _ARG_1_)
  if hud then
    hud.OnPlayerFailedToActivateAbility(_ARG_0_, _ARG_1_)
  end
end
function guicallbacks.OnMinimapCellVisited(_ARG_0_, _ARG_1_, _ARG_2_)
  if minimap then
  end
end
function guicallbacks.OnFadeOutStart(_ARG_0_)
end
function guicallbacks.OnCancelIngameMenuMode()
end
function guicallbacks.OnLoadScenarioRequest(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if loadingscreen then
    loadingscreen.OnLoadScenarioRequest(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  end
  if minimap then
  end
end
function guicallbacks.OnScenarioChangeTriggerActivated(_ARG_0_, _ARG_1_)
end
function guicallbacks.OnTeleporterUse(_ARG_0_)
end
function guicallbacks.OnPlayerContinuousDamageStart()
  if hud then
    hud.OnContinuousDamageStart()
  end
end
function guicallbacks.OnPlayerContinuousDamageEnd()
  if hud then
    hud.OnContinuousDamageEnd()
  end
end
function guicallbacks.OnPlayerDead(_ARG_0_)
  if logiccallbacks then
    logiccallbacks.OnPlayerDead(_ARG_0_)
  end
  if hud then
    hud.OnPlayerDead(_ARG_0_)
  end
end
function guicallbacks.OnFakeDeadFinished(_ARG_0_)
end
function guicallbacks.OnPlayerRevived(_ARG_0_)
  if hud then
    hud.OnPlayerRevived(_ARG_0_)
  end
end
function guicallbacks.OnNewPlayerCreated(_ARG_0_, _ARG_1_)
  if hud then
    hud.OnNewPlayerCreated(_ARG_0_, _ARG_1_)
  end
  if WeaponSelector then
    WeaponSelector.OnNewPlayerCreated(_ARG_0_, _ARG_1_)
  end
end
function guicallbacks.OnPlayerReinit()
  if hud then
    hud.OnPlayerReinit()
  end
  if WeaponSelector then
    WeaponSelector.OnPlayerReinit()
  end
end
function guicallbacks.OnProgressionDefItemAdded(_ARG_0_)
end
function guicallbacks.OnEnemyDefeated(_ARG_0_, _ARG_1_)
end
function guicallbacks.OnInputEnabledChanged(_ARG_0_)
end
function guicallbacks.OnSpecialControlEnabled(_ARG_0_)
end
function guicallbacks.OnInputIgnoredChanged(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
end
function guicallbacks.OnCutsceneStarted(_ARG_0_, _ARG_1_)
end
function guicallbacks.OnCutsceneFinished(_ARG_0_)
end
function guicallbacks.OnGameModeChanged(_ARG_0_, _ARG_1_)
end
function guicallbacks.OnASyncLoadProfileFinished(_ARG_0_, _ARG_1_)
  if guicallbacks.OnASyncLoadProfileFinishedCallback then
    guicallbacks.OnASyncLoadProfileFinishedCallback.oCallback(guicallbacks.OnASyncLoadProfileFinishedCallback.sItemName, guicallbacks.OnASyncLoadProfileFinishedCallback.fActivate)
  end
end
function guicallbacks.OnTeleporterUndisclosed(_ARG_0_, _ARG_1_)
end
function guicallbacks.OnTravelBookOpened()
end
function guicallbacks.OnTravelBookClosed()
end
function guicallbacks.OnMessageWindowOpened()
end
function guicallbacks.OnMessageWindowClosed()
end
function guicallbacks.OnMinimapCustomMarkCreated(_ARG_0_)
end
function guicallbacks.OnMinimapCustomMarkDestroyed(_ARG_0_)
end
function guicallbacks.OnCurrentScenarioChanged(_ARG_0_)
  if hud then
    hud.OnCurrentScenarioChanged(_ARG_0_)
  end
end
function guicallbacks.OnCurrentMinimapStateUpdated()
end
function guicallbacks.OnProgressionDefItemReviewed()
  if hud then
    hud.OnProgressionDefItemReviewed()
  end
end
function guicallbacks.OnSheetItemReviewed()
  if hud then
    hud.OnSheetItemReviewed()
  end
end
function guicallbacks.OnCreatureItemReviewed()
  if hud then
    hud.OnCreatureItemReviewed()
  end
end
function guicallbacks.OnCustomMarksEditModeChanged(_ARG_0_)
end
function guicallbacks.OnASyncOpIOError(_ARG_0_, _ARG_1_)
  if menu_root ~= nil then
    menu_root.PopAllPopUps()
  end
  slots.SetAllDirty()
end
function guicallbacks.OnPadDisconnected(_ARG_0_)
end
function guicallbacks.OnPadReconnected(_ARG_0_)
end
function guicallbacks.OnPurchased()
end
function guicallbacks.OnSystemMenuClosed()
end
function guicallbacks.OnInputFocusedDeviceChanged()
  if qte then
    qte.OnInputFocusedDeviceChanged()
  end
  if hud then
    hud.OnInputFocusedDeviceChanged()
  end
  if CurrentScenario and CurrentScenario.OnInputFocusedDeviceChanged then
    CurrentScenario.OnInputFocusedDeviceChanged()
  end
end
function guicallbacks.OnInputCfgChanged()
  if qte then
    qte.OnInputCfgChanged()
  end
end
function guicallbacks.OnElevatorUseMessageDeclined()
  Game.AddGUISF(0.5, GUI.HideElevatorStateShowHUDState, "")
end
