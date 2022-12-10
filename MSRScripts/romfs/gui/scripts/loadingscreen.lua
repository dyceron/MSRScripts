loadingscreen = {oGUIRoot = nil}
loadingscreen.sTooltipTextTagPreffix = "#GUI_TIPS_"
loadingscreen.asTooltips = {
  "COMBAT_COMPLETECOMBOS",
  "COMBAT_COUNTERATTACK",
  "COMBAT_DEADLYENEMYGRABS",
  "COMBAT_STOMP",
  "COMBAT_RISINGSTRIKE",
  "COMBAT_CRAWLERS",
  "COMBAT_DIFFERENCEBETWEENATTACKS",
  "COMBAT_DIRTENEMYATTACKS",
  "COMBAT_DODGE",
  "COMBAT_ENEMYWITHMAGIC",
  "COMBAT_GUARDBREAKER",
  "COMBAT_KILLBYGRAB",
  "COMBAT_NARROWAREAS",
  "COMBAT_SYNCHROBLOCK",
  "COMBAT_UNSTOPPABLEATTACK",
  "COMBAT_WIDEATTACK",
  "PROGRESSION_MAXLEVEL",
  "WEAPONS_CHARGEDSECONDARYWEAP",
  "WEAPONS_SECONDARYWEAPONSANDMAGIC",
  "WEAPONS_BARRELSCONTENT",
  "MAGIC_REFILLDISABLEDIFACTIVE",
  "CASTLE_COMPLETE100",
  "CASTLE_REVISIT",
  "EXTRAJUMPWITHAIRDASH",
  "CASTLE_TRAPS",
  "CHECKLIFEANDMAGIC",
  "DIVE_CHECKOXYGEN",
  "FONTS_USEALWAYSONE",
  "KNIGHTS_SCROLLS",
  "LEVERUSE",
  "MAP_SECRETS",
  "OBJECTIVE_ARROW_01",
  "OBJECTIVE_ARROW_02",
  "ALLAIDSHIDDEN",
  "LEADERBOARDS",
  "TRAVELBOOK_LEVELUP",
  "MAINMENU_CHAPTERSELECTION",
  "MAINMENU_EXTRAS_CUTSCENES",
  "TRAVELBOOK_BESTIARY",
  "TRAVELBOOK_MAPNOTES",
  "TRAVELBOOK_SKILLS",
  "BEALWAYSALERT",
  "COMPLETETHEGAME100",
  "DIFFICULTYSELECTION"
}
loadingscreen.tInitUnlockedTooltips = {
  "COMBAT_COMPLETECOMBOS",
  "COMBAT_COUNTERATTACK",
  "COMBAT_DEADLYENEMYGRABS",
  "COMBAT_STOMP",
  "COMBAT_DIFFERENCEBETWEENATTACKS",
  "COMBAT_DIRTENEMYATTACKS",
  "COMBAT_DODGE",
  "COMBAT_KILLBYGRAB",
  "COMBAT_NARROWAREAS",
  "COMBAT_SYNCHROBLOCK",
  "COMBAT_UNSTOPPABLEATTACK",
  "COMBAT_WIDEATTACK",
  "PROGRESSION_MAXLEVEL",
  "CHECKLIFEANDMAGIC",
  "OBJECTIVE_ARROW_01",
  "OBJECTIVE_ARROW_02",
  "ALLAIDSHIDDEN",
  "LEADERBOARDS",
  "MAINMENU_EXTRAS_CUTSCENES",
  "TRAVELBOOK_SKILLS",
  "BEALWAYSALERT"
}
loadingscreen.tOnScenarioLoadUnlockTooltip = {
  s020_moat_caves = {
    "WEAPONS_CHARGEDSECONDARYWEAP",
    "WEAPONS_BARRELSCONTENT",
    "KNIGHTS_SCROLLS",
    "LEVERUSE"
  },
  s030_sanctuary = {
    "DIVE_CHECKOXYGEN",
    "MAP_SECRETS",
    "TRAVELBOOK_SKILLS",
    "TRAVELBOOK_BESTIARY",
    "TRAVELBOOK_MAPNOTES"
  },
  s040_waterfalls_bridge_base = {
    "WEAPONS_SECONDARYWEAPONSANDMAGIC",
    "MAGIC_REFILLDISABLEDIFACTIVE",
    "CASTLE_REVISIT",
    "EXTRAJUMPWITHAIRDASH",
    "FONTS_USEALWAYSONE"
  },
  s070_cells = {
    "CASTLE_TRAPS"
  },
  s075_cells_end = {
    "COMBAT_CRAWLERS"
  },
  s100_slaughterhouse_kitchen_cellar = {
    "COMBAT_RISINGSTRIKE"
  },
  s160_library = {
    "COMBAT_GUARDBREAKER",
    "CASTLE_COMPLETE100"
  },
  s170_carousel = {
    "COMBAT_ENEMYWITHMAGIC"
  },
  s010_bellfry_chain = {
    "MAINMENU_CHAPTERSELECTION",
    "DIFFICULTYSELECTION"
  },
  s000_bridge_cemetery = {
    "COMPLETETHEGAME100"
  }
}
loadingscreen.asUnlockedTooltips = {}
function loadingscreen.UpdateUnlockedTooltips()
  loadingscreen.asUnlockedTooltips = utils.DeepCopy(loadingscreen.tInitUnlockedTooltips)
  for _FORV_3_, _FORV_4_ in ipairs(loadingscreen.asTooltips) do
    if loadingscreen.IsTooltipUnlocked(_FORV_4_) then
      table.insert(loadingscreen.asUnlockedTooltips, _FORV_4_)
    end
  end
end
function loadingscreen.IsTooltipUnlocked(_ARG_0_)
  return Blackboard.GetProp("GAME_PROGRESS", "TOOLTIP_" .. _ARG_0_)
end
function loadingscreen.UnlockTooltip(_ARG_0_)
  if Blackboard.GetProp("GAME_PROGRESS", "TOOLTIP_" .. _ARG_0_) ~= true then
    Blackboard.SetProp("GAME_PROGRESS", "TOOLTIP_" .. _ARG_0_, "b", true)
    table.insert(loadingscreen.asUnlockedTooltips, _ARG_0_)
  end
  return true
end
function loadingscreen.GetRandomTooltip()
  if #loadingscreen.asUnlockedTooltips > 0 then
  end
  return loadingscreen.asUnlockedTooltips[math.random(#loadingscreen.asUnlockedTooltips)]
end
loadingscreen.sImageTexturePreffix = "gui/textures/Load"
loadingscreen.tCutscenesImages = {
  ["cutscenes/daemonlord1/takes/01/daemonlord101.bmscu"] = "TextureLoadTrevorTowers",
  ["cutscenes/cryptlady1/takes/01/cryptlady101.bmscu"] = "TrevorWormCinematic"
}
loadingscreen.tScenarioDefaultImages = {
  s000_surface = "Gym",
  s010_area1 = "Gym",
  s020_area2 = "Gym",
  s025_area2b = "Gym",
  s028_area2c = "Gym",
  s030_area3 = "Gym",
  s033_area3b = "Gym",
  s036_area3c = "Gym",
  s040_area4 = "Gym",
  s050_area5 = "Gym",
  s060_area6 = "Gym",
  s065_area6b = "Gym",
  s067_area6c = "Gym",
  s070_area7 = "Gym",
  s090_area9 = "Gym",
  s100_area10 = "Gym",
  s110_surfaceb = "Gym",
  s901_alpha = "Gym",
  s902_gamma = "Gym",
  s903_zeta = "Gym",
  s904_omega = "Gym",
  s905_queen = "Gym",
  s905_arachnus = "Gym",
  s906_metroid = "Gym",
  s910_gym = "Gym",
  s915_animinstances = "Gym"
}
loadingscreen.tScenarioInBossImages = {}
function loadingscreen.Create(_ARG_0_)
  loadingscreen.oGUIRoot = GUI.CreateDisplayObjectEx("LoadingScreen", "CDisplayObjectContainer", {})
  loadingscreen.sNextLoadingScreenText = nil
  loadingscreen.bVisible = false
  GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"}):FindChild("CircleA"):SetAutoRotateVelocity(-3)
  GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"}):FindChild("CircleB"):SetAutoRotateVelocity(-1.5)
  GUI.SpriteSetFilterEnabled(GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"}):FindChild("CircleA"), true)
  GUI.SpriteSetFilterEnabled(GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"}):FindChild("CircleB"), true)
  GUI.SpriteSetUseColorModeDefault(GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"}):FindChild("CircleA"), false)
  GUI.SpriteSetUseColorModeDefault(GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"}):FindChild("CircleB"), false)
  GUI.SpriteSetUseColorModeDefault(GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"}):FindChild("Background"), false)
  loadingscreen.oGUIRoot:AddChild((GUI.CreateCompInstanceEx("ASyncScreen", "LoadScreenComposition", {Enabled = true, StageID = "LoadingUp"})))
  GUI.CreateCompInstanceEx("ASyncScreenDn", "LoadScreenCompositionDown", {Enabled = true, StageID = "LoadingDn"}):FindChild("CircleBot"):SetSortKeyOverride(-1000000000, false)
  GUI.SpriteSetUseColorModeDefault(GUI.CreateCompInstanceEx("ASyncScreenDn", "LoadScreenCompositionDown", {Enabled = true, StageID = "LoadingDn"}):FindChild("BackgroundBot"), false)
  GUI.SpriteSetUseColorModeDefault(GUI.CreateCompInstanceEx("ASyncScreenDn", "LoadScreenCompositionDown", {Enabled = true, StageID = "LoadingDn"}):FindChild("CircleBot"), false)
  loadingscreen.oGUIRoot:AddChild((GUI.CreateCompInstanceEx("ASyncScreenDn", "LoadScreenCompositionDown", {Enabled = true, StageID = "LoadingDn"})))
  loadingscreen.oGUIRoot:SetSortKeyOverride(-20000, true)
  loadingscreen.UpdateUnlockedTooltips()
  return loadingscreen.oGUIRoot
end
function loadingscreen.ReleaseImage()
end
function loadingscreen.SetImage(_ARG_0_)
end
function loadingscreen.SetTooltip(_ARG_0_)
end
function loadingscreen.SetText(_ARG_0_)
end
function loadingscreen.SetNextLoadingScreenText(_ARG_0_)
end
function loadingscreen.SetScenarioLoadingScreen(_ARG_0_)
  loadingscreen.ShowLoadingScreen(sLoadingScreenScenarioTextTag, sLoadingScreenTooltip, sLoadingScreenImage)
end
function loadingscreen.SetIngameStartButtonEnabled(_ARG_0_)
end
function loadingscreen.ShowLoadingScreen(_ARG_0_, _ARG_1_, _ARG_2_)
  GUI.SetProperties(loadingscreen.oGUIRoot:FindChild("ASyncScreen"), {Enabled = true})
  GUI.SetProperties(loadingscreen.oGUIRoot:FindChild("ASyncScreenDn"), {Enabled = true})
  loadingscreen.oGUIRoot:ForceRedraw()
  loadingscreen.bVisible = true
end
function loadingscreen.HideLoadingScreen()
  loadingscreen.bVisible = false
  GUI.SetProperties(loadingscreen.oGUIRoot:FindChild("ASyncScreen"), {Enabled = false})
  GUI.SetProperties(loadingscreen.oGUIRoot:FindChild("ASyncScreenDn"), {Enabled = false})
  loadingscreen.oGUIRoot:ForceRedraw()
end
function loadingscreen.OnLoadScenarioRequest(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  loadingscreen.SetScenarioLoadingScreen(_ARG_1_)
end
function loadingscreen.OnNewScenarioLoaded(_ARG_0_, _ARG_1_, _ARG_2_)
end
function loadingscreen.SetCutsceneLoadingScreen(_ARG_0_)
  loadingscreen.ShowLoadingScreen("", "", sImage)
  Game.SetLoadingScreen(true)
end
function loadingscreen.HideCutsceneLoadingScreen()
  Game.SetLoadingScreen(false)
  loadingscreen.HideLoadingScreen()
end
function loadingscreen.SetMainMenuLoadingScreen()
  loadingscreen.ShowLoadingScreen("")
  Game.SetLoadingScreen(true)
end
function loadingscreen.HideMainMenuLoadingScreen()
  Game.SetLoadingScreen(false)
  loadingscreen.HideLoadingScreen()
end
function loadingscreen.OnCutsceneLoadingRequest(_ARG_0_)
  loadingscreen.SetCutsceneLoadingScreen(_ARG_0_)
end
function loadingscreen.OnCutsceneRequestProcessed()
  loadingscreen.HideCutsceneLoadingScreen()
end
function loadingscreen.OnCutsceneLoadingStarts(_ARG_0_)
  loadingscreen.SetCutsceneLoadingScreen(_ARG_0_)
end
function loadingscreen.OnCutsceneLoaded()
  loadingscreen.HideCutsceneLoadingScreen()
end
