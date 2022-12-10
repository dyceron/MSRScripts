Game.ImportLibrary("gui/scripts/msemenu.lua")
Game.ImportLibrary("gui/scripts/scenariomenu_common.lua", false)
Game.ImportLibrary("gui/scripts/msemenu_scenarios.lua", false)
Game.ImportLibrary("gui/scripts/msemenu_debug_locations.lua", false)
msemenu_mainmenu = {}
function msemenu_mainmenu.Create(_ARG_0_)
  msemenu.items = msemenu_mainmenu.items
  if not Game.IsInFINAL() then
    msemenu.items[" Debug"] = msemenu_mainmenu.debug_items
    msemenu.items["Select Boss"] = msemenu_mainmenu.GenerateLoadArenaItems(msemenu_mainmenu.aBossArenasPresavedGames)
    msemenu.items["Select Event"] = msemenu.GenerateLoadEventItems(msemenu_debug_events)
  end
  if msemenu.items.Config ~= nil and not Game.IsInWIN32() and msemenu.items.Config.Sound ~= nil then
    msemenu.items.Config.Sound.SpeakerMode = msemenu.DebugSetSpeakerMode()
    msemenu.items.Config.Sound.HeadphoneMultiplier = msemenu.DebugSetHeadPhoneMultiplier()
    msemenu.items.Config.Sound.StreamMix = msemenu.GenerateSetMixValues()
    msemenu.items.Config.Sound.FrontByPass = msemenu.GenerateSwitchFrontByPass()
  end
  function msemenu.OnClosed()
    GUI.ResetMainMenuReleaseGUI()
  end
  if Game.GetFileInfo("gui/scripts/msemenu_mainmenu_export.lua").Exists then
    Game.DoFile("gui/scripts/msemenu_mainmenu_export.lua")
  else
  end
  return (msemenu.Create("Up", "items", true, true, true, 11, "CDebugMenuEntryItemRenderer"))
end
function msemenu_mainmenu.EnableAmiiboMenu()
  Game.AddPSF(0.2, "Game.WriteToGameBlackboardSection", "ssb", "GAME", "AMIIBO_MENU_UNLOCKED", true)
end
function msemenu_mainmenu.LoadDebugScenario(_ARG_0_)
  Init.InitGameBlackboard()
  if _ARG_0_ ~= "surface" then
    msemenu_mainmenu.EnableAmiiboMenu()
  end
  ScenarioMenu.LoadScenario(_ARG_0_)
end
function msemenu_mainmenu.LoadPresavedDebugScenario(_ARG_0_)
  Game.LoadGameFromAssets(_ARG_0_)
  if _ARG_0_ ~= "surface" then
    msemenu_mainmenu.EnableAmiiboMenu()
  end
end
msemenu_mainmenu.aBossArenasPresavedGames = {
  {
    "Alpha",
    {
      {
        "surface",
        {
          surface = {"alpha1"}
        }
      },
      {
        "area1",
        {
          area1 = {
            "alpha1",
            "alpha2",
            "alpha3",
            "alpha4"
          }
        }
      },
      {
        "area2",
        {
          area2 = {
            "alpha1",
            "alpha3",
            "alpha4",
            "alpha5",
            "alpha6",
            "alpha7"
          },
          area2c = {"alpha2"}
        }
      },
      {
        "area3",
        {
          area3b = {"alpha2", "alpha3"},
          area3c = {"alpha1"}
        }
      },
      {
        "area4-5",
        {
          area4 = {"alpha1"}
        }
      },
      {
        "area6",
        {
          area6 = {"alpha1"}
        }
      }
    }
  },
  {
    "Gamma",
    {
      {
        "area2",
        {
          area2b = {"gamma1"}
        }
      },
      {
        "area3",
        {
          area3 = {"gamma5"},
          area3b = {
            "gamma1",
            "gamma2",
            "gamma3",
            "gamma4"
          },
          area3c = {"gamma6", "gamma7"}
        }
      },
      {
        "area4-5",
        {
          area4 = {"gamma1"},
          area5 = {"gamma2"}
        }
      },
      {
        "area6",
        {
          area6 = {"gamma4"},
          area6b = {"gamma2", "gamma3"},
          area6c = {"gamma1"}
        }
      }
    }
  },
  {
    "Zeta",
    {
      {
        "area4-5",
        {
          area5 = {"zeta1"}
        }
      },
      {
        "area6",
        {
          area6b = {"zeta1"},
          area6c = {"zeta2"}
        }
      },
      {
        "area7-8",
        {
          area7 = {"zeta1"}
        }
      }
    }
  },
  {
    "Omega",
    {
      {
        "area7-8",
        {
          area7 = {"omega1"}
        }
      },
      {
        "area9",
        {
          area9 = {
            "omega1",
            "omega2",
            "omega3"
          }
        }
      }
    }
  },
  {
    "Arachnus",
    {
      {
        "area2",
        {
          area2 = {"arachnus"}
        }
      }
    }
  },
  {
    "Queen",
    {
      {
        "area10",
        {
          area10 = {"queen"}
        }
      }
    }
  },
  {
    "Metroid",
    {
      {
        "area10",
        {
          area10 = {
            "metroid_hatchling_area"
          }
        }
      }
    }
  },
  {
    "Drill Chase",
    {
      {
        "area4-5",
        {
          area5 = {
            "manicminerchase"
          }
        }
      }
    }
  },
  {
    "Manic Miner Bot",
    {
      {
        "area7-8",
        {
          area7 = {
            "manicminerbot"
          }
        }
      }
    }
  },
  {
    "Ridley",
    {
      {
        "surfaceb",
        {
          surfaceb = {"ridley"}
        }
      }
    }
  }
}
msemenu_mainmenu.tBossesTestScenarios = {}
msemenu_mainmenu.aArenasLevels = {
  "surface",
  "area1",
  "area2",
  "area2b",
  "area3",
  "area3b",
  "area3c",
  "area4",
  "area6",
  "area6b",
  "area6c",
  "area7",
  "area9",
  "area10"
}
function msemenu_mainmenu.GenerateLoadArenaItems(_ARG_0_)
  for _FORV_5_, _FORV_6_ in ipairs(_ARG_0_) do
    table.insert({}, {
      ItemKey = _FORV_6_[1],
      ItemContent = {},
      ItemContent = {
        OnDirActivated = function(_ARG_0_, _ARG_1_)
          if _ARG_1_ == "ActivationButton" then
            Game.LoadGameFromAssets(_UPVALUE0_ .. "/" .. _UPVALUE1_ .. "/" .. _UPVALUE2_)
          end
        end
      },
      ItemContent = {
        OnDirActivated = function(_ARG_0_, _ARG_1_)
          if _ARG_1_ == "ActivationButton" then
            msemenu_mainmenu.LoadDebugScenario(_UPVALUE0_)
          end
        end
      }
    })
    if msemenu_mainmenu.tBossesTestScenarios[_FORV_6_[1]] ~= nil then
    end
    if #_FORV_6_[2] > 0 then
      if {
        OnDirActivated = function(_ARG_0_, _ARG_1_)
          if _ARG_1_ == "ActivationButton" then
            msemenu_mainmenu.LoadDebugScenario(_UPVALUE0_)
          end
        end
      } ~= nil then
        table.insert({
          ItemKey = _FORV_6_[1],
          ItemContent = {},
          ItemContent = {
            OnDirActivated = function(_ARG_0_, _ARG_1_)
              if _ARG_1_ == "ActivationButton" then
                Game.LoadGameFromAssets(_UPVALUE0_ .. "/" .. _UPVALUE1_ .. "/" .. _UPVALUE2_)
              end
            end
          },
          ItemContent = {
            OnDirActivated = function(_ARG_0_, _ARG_1_)
              if _ARG_1_ == "ActivationButton" then
                msemenu_mainmenu.LoadDebugScenario(_UPVALUE0_)
              end
            end
          }
        }.ItemContent, {
          ItemKey = "_Test",
          ItemContent = {
            OnDirActivated = function(_ARG_0_, _ARG_1_)
              if _ARG_1_ == "ActivationButton" then
                msemenu_mainmenu.LoadDebugScenario(_UPVALUE0_)
              end
            end
          }
        })
      end
      for _FORV_15_, _FORV_16_ in pairs(_FORV_6_[2]) do
        for _FORV_25_, _FORV_26_ in pairs(_FORV_16_[2]) do
          for _FORV_30_, _FORV_31_ in ipairs(_FORV_26_) do
            if string.sub(_FORV_31_, 1, string.len(_FORV_6_[1])) == string.lower(_FORV_6_[1]) then
            end
          end
        end
        if 0 < 0 + 1 or {
          OnDirActivated = function(_ARG_0_, _ARG_1_)
            if _ARG_1_ == "ActivationButton" then
              msemenu_mainmenu.LoadDebugScenario(_UPVALUE0_)
            end
          end
        } ~= nil then
          table.insert({
            ItemKey = _FORV_6_[1],
            ItemContent = {},
            ItemContent = {
              OnDirActivated = function(_ARG_0_, _ARG_1_)
                if _ARG_1_ == "ActivationButton" then
                  Game.LoadGameFromAssets(_UPVALUE0_ .. "/" .. _UPVALUE1_ .. "/" .. _UPVALUE2_)
                end
              end
            },
            ItemContent = {
              OnDirActivated = function(_ARG_0_, _ARG_1_)
                if _ARG_1_ == "ActivationButton" then
                  msemenu_mainmenu.LoadDebugScenario(_UPVALUE0_)
                end
              end
            }
          }.ItemContent, {
            ItemKey = _FORV_6_[1] .. "_" .. _FORV_16_[1],
            ItemContent = {
              [_FORV_6_[1] .. "_" .. _FORV_16_[1] .. "_" .. "#" .. string.sub(_FORV_31_, string.len(_FORV_6_[1]) + 1)] = {
                OnDirActivated = function(_ARG_0_, _ARG_1_)
                  if _ARG_1_ == "ActivationButton" then
                    Game.LoadGameFromAssets(_UPVALUE0_ .. "/" .. _UPVALUE1_ .. "/" .. _UPVALUE2_)
                  end
                end
              }
            }
          })
        else
        end
      end
    elseif {
      OnDirActivated = function(_ARG_0_, _ARG_1_)
        if _ARG_1_ == "ActivationButton" then
          msemenu_mainmenu.LoadDebugScenario(_UPVALUE0_)
        end
      end
    } ~= nil then
    end
  end
  return {}
end
function msemenu_mainmenu.GenerateRewards()
  return {
    ["Default < 4 h"] = function()
      Game.ShowEndGameCredits(true, 5025)
    end,
    ["Default < 8 h"] = function()
      Game.ShowEndGameCredits(true, 17778)
    end,
    ["Default > 8 h"] = function()
      Game.ShowEndGameCredits(true, 30612)
    end,
    ["Hard < 4 h"] = function()
      Game.ShowEndGameCredits(true, 5025, "HARD")
    end,
    ["Hard < 8 h"] = function()
      Game.ShowEndGameCredits(true, 17778, "HARD")
    end,
    ["Hard > 8 h"] = function()
      Game.ShowEndGameCredits(true, 30612, "HARD")
    end,
    ["Fusion < 4 h"] = function()
      Game.ShowEndGameCredits(true, 5025, "FUSION")
    end,
    ["Fusion < 8 h"] = function()
      Game.ShowEndGameCredits(true, 17778, "FUSION")
    end,
    ["Fusion > 8 h"] = function()
      Game.ShowEndGameCredits(true, 30612, "FUSION")
    end
  }
end
msemenu_mainmenu.aPopUps = {
  "#GUI_AMIIBO_NFC_READER_UPDATE",
  "#GUI_AMIIBO_IR_ERROR",
  "#GUI_AMIIBO_NFC_READER_ERROR",
  "#GUI_SAVE_DATA_CORRUPT"
}
function msemenu_mainmenu.GenerateAmiiboMenu()
  return {
    ["Slot A"] = msemenu_mainmenu.GenerateAmiiboMenuForSlot("profile0"),
    ["Slot B"] = msemenu_mainmenu.GenerateAmiiboMenuForSlot("profile1"),
    ["Slot C"] = msemenu_mainmenu.GenerateAmiiboMenuForSlot("profile2")
  }
end
function msemenu_mainmenu.GenerateAmiiboMenuForSlot(_ARG_0_)
  return {
    ["Smash Bros Zero - Energy tank and Matadora music"] = msemenu_mainmenu.GenerateAmiiboActivateDeactivateMenu(_ARG_0_, "ITEM_RESERVE_TANK_LIFE"),
    ["Smash Bros Samus - Missile tank and Matadora art"] = msemenu_mainmenu.GenerateAmiiboActivateDeactivateMenu(_ARG_0_, "ITEM_RESERVE_TANK_MISSILE"),
    ["Matadora Samus - SE tank and Metroid II art"] = msemenu_mainmenu.GenerateAmiiboActivateDeactivateMenu(_ARG_0_, "ITEM_RESERVE_TANK_SPECIAL_ENERGY")
  }
end
function msemenu_mainmenu.GenerateAmiiboActivateDeactivateMenu(_ARG_0_, _ARG_1_)
  return {
    Activate = {
      OnDirActivated = function()
        msemenu_mainmenu.ActivateAmiibo(_UPVALUE0_, _UPVALUE1_, 1)
      end
    },
    Deactivate = {
      OnDirActivated = function()
        msemenu_mainmenu.ActivateAmiibo(_UPVALUE0_, _UPVALUE1_, 0)
      end
    },
    Fill = {
      OnDirActivated = function()
        msemenu_mainmenu.ActivateAmiibo(_UPVALUE0_, _UPVALUE1_, 2)
      end
    },
    Empty = {
      OnDirActivated = function()
        msemenu_mainmenu.ActivateAmiibo(_UPVALUE0_, _UPVALUE1_, 3)
      end
    }
  }
end
function msemenu_mainmenu.MetroidLarvaAmiiboActivation(_ARG_0_)
end
function msemenu_mainmenu.ActivateAmiibo(_ARG_0_, _ARG_1_, _ARG_2_)
  Game.LoadProfile(_ARG_0_, true)
  guicallbacks.OnASyncLoadProfileFinishedCallback = {
    oCallback = msemenu_mainmenu.ActivateAmiiboProfileLoaded,
    sItemName = _ARG_1_,
    fActivate = _ARG_2_
  }
end
function msemenu_mainmenu.ActivateAmiiboProfileLoaded(_ARG_0_, _ARG_1_)
  guicallbacks.OnASyncLoadProfileFinishedCallback = nil
  if _ARG_1_ == 0 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_ACTIVE", "b", false)
  elseif _ARG_1_ == 1 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_ACTIVE", "b", true)
  elseif _ARG_1_ == 2 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_FULL", "b", true)
  elseif _ARG_1_ == 3 then
    Blackboard.SetProp("GAME", _ARG_0_ .. "_FULL", "b", false)
  end
  Game.AddSF(0, "msemenu_mainmenu.ActivateAmiiboProfileSave", "")
end
function msemenu_mainmenu.ActivateAmiiboProfileSave()
  Game.SaveProfile(true)
  Game.LoadProfile("profile0", true)
end
msemenu_mainmenu.items = {
  ["Select Area"] = msemenu.GenerateDefaultItems(msemenu_mainmenu.LoadPresavedDebugScenario, msemenu.aAreasPresavedGames),
  ["_Format Save Games And Exit"] = Game.FormatSavedGames,
  ["_Force Fusion Mode"] = msemenu.SwitchForceFusionMode(),
  ["_Force Hard Mode"] = msemenu.SwitchForceHardMode(),
  ["Rewards And Credits"] = msemenu_mainmenu.GenerateRewards(),
  ["Sound"] = {
    MusicTests = {
      Volume = msemenu.DebugSetStreamVolume(),
      StopStream = msemenu.DebugStopStream(),
      PlayStream = msemenu.GeneratePlayStreamItems(msemenu.GenerateMusicTable(Game.GetAvailableMusicStreams())),
      SoundMode = msemenu.GenerateSwitchSoundMode()
    }
  }
}
msemenu_mainmenu.debug_items = {
  ["Load Scenario"] = msemenu.GenerateDefaultItems(ScenarioMenu.LoadScenario, tScenarioMenuDefs.aScenarios),
  ["Select Language"] = msemenu.GenerateLanguageSelectItems(),
  ["ShowPopups"] = msemenu.GeneratePopups(msemenu_mainmenu.aPopUps),
  ["PackSanityCheck"] = function()
    Game.PackSanityCheck()
  end
}
