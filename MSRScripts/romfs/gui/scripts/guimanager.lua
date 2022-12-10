Game.ImportLibrary("system/scripts/utils.lua", false)
Game.ImportLibrary("gui/scripts/sprites_texturehudopaque.lua", false)
Game.ImportLibrary("gui/scripts/sprites_texturehudmainmenu.lua", false)
Game.ImportLibrary("gui/scripts/sprites_texturehud.lua")
Game.ImportLibrary("gui/scripts/gui_global_constants.lua", false)
Game.ImportLibrary("gui/scripts/sprites_global.lua", false)
Game.ImportLibrary("gui/scripts/sprites_splashes.lua", false)
Game.ImportLibrary("gui/scripts/sprites_localized.lua")
Game.ImportLibrary("gui/scripts/guicallbacks.lua", false)
if Game.ExtraDebugAllowed() or Game.VersionNumberAllowed() or Game.MemoryStatsAllowed() then
  Game.ImportLibrary("gui/scripts/msemessage.lua", false)
end
Game.ImportLibrary("gui/scripts/loadingscreen.lua", false)
function GUIManager.main()
  GUI.LoadShapes("DefaultShapes")
  if Game.ExtraDebugAllowed() or Game.VersionNumberAllowed() or Game.MemoryStatsAllowed() then
    GUI.GetDisplayObject("[Root]"):AddChild((msemessage.Create("DebugMessage")))
  end
  GUI.GetDisplayObject("[Root]"):AddChild((loadingscreen.Create("LoadingScreen")))
  GUI.GetDisplayObject("[Root]"):AddChild((GUI.CreateCompInstanceEx("Cutscene", "cutscene", {})))
  GUIManager.LoadCurrentLanguageResources()
end
function GUIManager.OnDestroying()
  if menu_root then
    menu_root.PopAllItems()
  end
end
function GUIManager.LoadLanguageResources(_ARG_0_)
  if _ARG_0_ == "JAPANESE" then
    GUI.AddFont("digital_small", "system/fonts/contm10.bfont", "", 0, true)
    GUI.AddFont("digital_medium", "system/fonts/contm12.bfont", "", 0, false)
    GUI.AddFont("digital_hefty", "system/fonts/contm12.bfont", "", 0, true)
    GUI.AddFont("digital_big", "system/fonts/contm12.bfont", "", 0, true)
    gui_global_fonts.sMenuListSmall = "trajan_small"
  else
    GUI.AddFont("digital_small", "system/fonts/mlsix10.bfont", "", 2, true)
    GUI.AddFont("digital_medium", "system/fonts/mlsix14.bfont", "", 2, true)
    GUI.AddFont("digital_hefty", "system/fonts/mlsix16.bfont", "", 2, true)
    GUI.AddFont("digital_big", "system/fonts/mlsix18.bfont", "", 2, true)
    gui_global_fonts.sMenuListSmall = "digital_hefty"
  end
end
function GUIManager.LoadCurrentLanguageResources()
  GUIManager.LoadLanguageResources((Game.GetCurrentLanguage()))
end
function GUIManager.LoadGUISoundResources()
end
