Game.ImportLibrary("gui/scripts/msemenu.lua")
Game.ImportLibrary("gui/scripts/scenariomenu_common.lua")
Game.ImportLibrary("gui/scripts/msemenu_scenarios.lua", false)
Game.ImportLibrary("gui/scripts/msemenu_ingame_common.lua")
Game.ImportLibrary("gui/scripts/menu_root.lua")
Game.ImportLibrary("gui/scripts/msemenu_profile.lua")
function msemenu_ingame.Create(_ARG_0_)
  Game.ImportLibrary("gui/scripts/msemenu.lua")
  msemenu.items = msemenu_ingame.items
  if Game.IsInWIN32() and msemenu.items.Config ~= nil then
    msemenu.items.Config.ToggleWindowSize = Game.ToggleWindowResolution
  elseif msemenu.items.Config ~= nil and msemenu.items.Config.Sound ~= nil then
    msemenu.items.Config.Sound.SpeakerMode = msemenu.DebugSetSpeakerMode()
    msemenu.items.Config.Sound.HeadphoneMultiplier = msemenu.DebugSetHeadPhoneMultiplier()
    msemenu.items.Config.Sound.FrontByPass = msemenu.GenerateSwitchFrontByPass()
  end
  if not Game.IsInFINAL() then
    msemenu.items[" Debug"] = msemenu_ingame.debug_items
    msemenu.items.Quit = msemenu_ingame.Quit
  end
  function msemenu.OnClosed()
    Game.CloseDebugMenu(3)
  end
  return msemenu.Create("Up", "items", false, true, false, 11, "CDebugMenuEntryItemRenderer")
end
function msemenu_ingame.Quit()
  Game.QuitGame()
end
function msemenu_ingame.OnExitToMainMenuConfirmed()
  Game.CloseDebugMenuAndReadyExit()
  Scenario.FadeOutAndGoToMainMenu(0.3, false, true)
end
function msemenu_ingame.OnReloadCurrentScenarioConfirmed()
  Game.CloseDebugMenuAndReadyExit()
  Scenario.FadeOutAndReloadCurrentScenario(0.3)
end
function msemenu_ingame.OnLoadFromCheckpointConfirmed()
  Game.CloseDebugMenuAndReadyExit()
  Game.LoadGame("checkpoint")
end
function msemenu_ingame.OnLoadFromSavedataConfirmed()
  Game.CloseDebugMenuAndReadyExit()
  Game.LoadGame("savedatacache")
end
function msemenu_ingame.OnExportStrippedDownSystemPack()
  Game.ExportPackAnyTimeReferencedFilesPfg("system", "packs/system/system.pkg", "system/pkg/system.pfg")
end
function msemenu_ingame.GenerateAmiiboMenu()
  return {
    ["Smash Bros Zero - Energy tank and Matadora music"] = msemenu_ingame.GenerateAmiiboActivateDeactivateMenu("ITEM_RESERVE_TANK_LIFE"),
    ["Smash Bros Samus - Missile tank and Matadora art"] = msemenu_ingame.GenerateAmiiboActivateDeactivateMenu("ITEM_RESERVE_TANK_MISSILE"),
    ["Matadora Samus - SE tank and Metroid II art"] = msemenu_ingame.GenerateAmiiboActivateDeactivateMenu("ITEM_RESERVE_TANK_SPECIAL_ENERGY")
  }
end
function msemenu_ingame.GenerateAmiiboActivateDeactivateMenu(_ARG_0_)
  return {
    Activate = {
      OnDirActivated = function()
        msemenu_ingame.ActivateAmiibo(_UPVALUE0_, 1)
      end
    },
    Deactivate = {
      OnDirActivated = function()
        msemenu_ingame.ActivateAmiibo(_UPVALUE0_, 0)
      end
    },
    Fill = {
      OnDirActivated = function()
        msemenu_ingame.ActivateAmiibo(_UPVALUE0_, 2)
      end
    },
    Empty = {
      OnDirActivated = function()
        msemenu_ingame.ActivateAmiibo(_UPVALUE0_, 3)
      end
    }
  }
end
function msemenu_ingame.ActivateAmiibo(_ARG_0_, _ARG_1_)
  if _ARG_1_ == 0 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_ACTIVE", "b", false)
  elseif _ARG_1_ == 1 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_ACTIVE", "b", true)
  elseif _ARG_1_ == 2 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_FULL", "b", true)
  elseif _ARG_1_ == 3 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_FULL", "b", false)
  end
end
function msemenu_ingame.MetroidLarvaAmiiboActivation()
end
msemenu_ingame.items = {
  Config = {
    [" Inventory"] = {
      ["Weapons"] = msemenu.GenerateWeaponList(),
      ["Items"] = msemenu.GenerateItemsList(),
      ["Aeion Abilities"] = msemenu.GenerateAbilitiesList()
    },
    ["Sound"] = {
      EnableMusic = msemenu.EnableMusic(),
      EnableEnvironmentSounds = msemenu.EnableEnvironmentSound(),
      EnableMetroidRadarSounds = msemenu.EnableMetroidRadarSound(),
      MusicTests = {
        Volume = msemenu.DebugSetStreamVolume(),
        StopStream = msemenu.DebugStopStream(),
        CurrentFactor = msemenu.DebugSetEnvFactor(),
        PlayStream = msemenu.GeneratePlayStreamItems(msemenu.GenerateMusicTable(Game.GetAvailableMusicStreams())),
        SetEnvironmentFactor = msemenu.GenerateSetEnvironmentMultiplierItems(msemenu.GenerateMusicTable(Game.GetAvailableMusicStreams())),
        SoundMode = msemenu.GenerateSwitchSoundMode()
      },
      MuteSfx = msemenu.DebugMuteSfx(),
      StreamMix = msemenu.GenerateSetMixValues()
    },
    ["KillCurrentBoss"] = msemenu.KillCurrentBoss,
    ["GainAllItemsAndPowerUps"] = msemenu.GainAllItemsAndPowerUps,
    ["PlayerLifeLocked"] = msemenu.GenerateEntityBoolMsgEntry("[PLAYER]", "LIFE", "bCurrentLifeLocked"),
    ["PlayerLifeTo1"] = {
      OnActivated = function()
        Game.SetItemAmount(Game.GetPlayerName(), "ITEM_CURRENT_LIFE", 1)
        Game.ReinitPlayerFromBlackboard()
      end
    },
    ["RecoverAmmo"] = msemenu.RecoverAmmo,
    ["RecoverSpecialEnergy"] = msemenu.RecoverSpecialEnergy,
    ["ScanVisitDiscoverEverything"] = msemenu.ScanVisitDiscoverEverything,
    ["SkipCutscenes"] = {
      GetCurrentValue = Game.IsForceSkipCutscenes,
      OnActivated = function()
        Game.SetForceSkipCutscenes(not Game.IsForceSkipCutscenes())
      end
    },
    ["FixedStepTime"] = msemenu.SwitchFixedSlotTime()
  }
}
msemenu_ingame.debug_items = {
  ["TeleportToScenario"] = msemenu.GenerateDefaultItems(ScenarioMenu.TeleportToScenario, tScenarioMenuDefs.aScenarios),
  ["LoadScenario"] = msemenu.GenerateDefaultItems(ScenarioMenu.LoadScenario, tScenarioMenuDefs.aScenarios),
  ["Flags"] = msemenu.GenerateDebugFlagsTable(Game.Debug, Game.IsDebugFlagActive, false),
  ["Inventory"] = msemenu.GenerateInventoryItems(),
  ["Config"] = {
    InputPreset = msemenu.SwitchInputPreset(),
    HUDMode = msemenu.SwitchHUDMode(),
    SamusSuit = msemenu.SwitchSuit(),
    TransferProgress = Game.TransferGameProgress
  },
  ["Tunables"] = {
    Abilities = {
      MinTimeBetweenMeleeActions = msemenu.GenerateComponentVarEntry("[PLAYER]", "ABILITY", "fMinTimeBetweenMeleeActions", 8.3),
      TimeToBlock = msemenu.GenerateComponentVarEntry("[PLAYER]", "ABILITY", "fTimeToBlock", 0.1),
      TimeToCharge = msemenu.GenerateComponentVarEntry("[PLAYER]", "ABILITY", "fTimeToCharge", 0.1),
      TimeBufferingTeleportInput = msemenu.GenerateComponentVarEntry("[PLAYER]", "ABILITY", "fTeleportMaxTimeToAcceptTriggeredDir", 0.1)
    }
  },
  ["Cheats"] = {
    PlayerLifeLocked = msemenu.GenerateEntityBoolMsgEntry("[PLAYER]", "LIFE", "bCurrentLifeLocked"),
    PlayerSpecialEnergyLocked = msemenu.GenerateEntityBoolMsgEntry("[PLAYER]", "SPECIALENERGY", "bSpecialEnergyLocked"),
    RecoverSpecialEnergy = msemenu.RecoverSpecialEnergy,
    RecoverLife = msemenu.RecoverLife,
    KillPlayer = Game.KillPlayer,
    KeepKillingPlayer = {
      GetCurrentValue = Game.DEBUG_TEST_GetKeepKillingPlayer,
      OnActivated = function()
        Game.DEBUG_TEST_SetKeepKillingPlayer(not Game.DEBUG_TEST_GetKeepKillingPlayer())
      end
    },
    KillAllEnemies = msemenu.KillAllEnemies,
    KillCurrentBoss = msemenu.KillCurrentBoss,
    GainAllItemsAndPowerUps = msemenu.GainAllItemsAndPowerUps,
    CurrentMinimapVisitAndScanAllCells = msemenu.CurrentMinimapVisitAndScanAllCells,
    ScanVisitDiscoverEverything = msemenu.ScanVisitDiscoverEverything,
    SaveCurrentScenarioGameWithAllPreviousMapCellsVisited = hud.SaveCurrentScenarioGameWithAllPreviousMapCellsVisited
  },
  ["AI"] = {
    ["AttacksEnabled"] = msemenu.SwitchAttacksEnabled(),
    [" SELECTED"] = {
      ["Attack"] = msemenu.SwitchAIForcedAttack(),
      ["Attack Stage"] = msemenu.SwitchAIForcedAttackPreset(),
      ["Select"] = msemenu.SelectCloserAI()
    },
    ["ReloadTrees"] = msemenu.ReloadTrees
  },
  ["Sound"] = {
    ReverbPreset = msemenu.ChangeReverbConfig(),
    LowPassFilterCutoff = msemenu.ChangeLowPassFilterCutoffFreq(),
    EnableMusic = msemenu.EnableMusic(),
    EnableEnvironmentSounds = msemenu.EnableEnvironmentSound(),
    EnableEnvironmentSoundEffects = msemenu.EnableEnvironmentSoundEffects(),
    EnableMetroidRadarSounds = msemenu.EnableMetroidRadarSound()
  },
  ["Load Event"] = msemenu.GenerateLoadEventItems(msemenu_debug_events),
  ["Locations"] = {
    NoCurrentLocationSpecificEntries = function()
    end
  },
  ["Packs"] = {
    ExportStrippedDownSystemPack = msemenu_ingame.OnExportStrippedDownSystemPack
  },
  ["EntitySchedulers"] = {
    ForceRoundRobin = {
      GetCurrentValue = Game.IsForceRoundRobinForNonCulledEntities,
      OnActivated = function()
        Game.SetForceRoundRobinForNonCulledEntities(not Game.IsForceRoundRobinForNonCulledEntities())
      end
    }
  }
}
msemenu_ingame.debug_items[" Scenario"] = {
  Hide = msemenu.HideScenario,
  Show = msemenu.ShowScenario,
  _FreeCamLockAllSubAreas = {
    GetCurrentValue = Game.IsFreeCamLockSubAreasEnabled,
    OnActivated = function()
      Game.SetFreeCamLockSubAreas(not Game.IsFreeCamLockSubAreasEnabled())
    end
  }
}
msemenu_ingame.debug_items.AI.NavMesh = {
  [" GenerateNavMesh"] = Game.GenerateNavMesh,
  [" GenerateNavMeshSpawnPointNavigableInfo"] = Game.GenerateNavMeshSpawnPointNavigableInfo,
  [" GenerateNavMeshSpawnPointSpecialInfo"] = Game.GenerateNavMeshSpawnPointSpecialInfo,
  ["DebugBreakablePolyIndex"] = msemenu.DebugBreakablePolyIndex()
}
