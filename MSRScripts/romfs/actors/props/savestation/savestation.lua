Game.ImportLibraryWithName("actors/props/usable/scripts/usable.lua", "Usable")
SaveStation = {}
setmetatable(SaveStation, {__index = Usable})
function SaveStation.OnStart(_ARG_0_, _ARG_1_)
  if Game.GetEntity("LE_Platform_" .. string.sub(_ARG_0_.sName, 4)) == nil then
  end
  if Game.GetEntity("LE_" .. string.sub(_ARG_0_.sName, 4)) ~= nil and Game.GetEntity("LE_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT ~= nil then
    Game.GetEntity("LE_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT:OnStartUse(_ARG_0_.sName)
  end
end
function SaveStation.OnLevelChangeUse(_ARG_0_, _ARG_1_, _ARG_2_)
  if not Game.PreviousLoadWasReload() and Game.GetPreviousGameMode() == "MAINMENU" then
    Game.SetSFXMuted(true)
    Game.PlayMusicStream(0, "streams/music/matad_jintojo_32728k.wav", -1, -1, 0, 0, 0, 0)
    if _ARG_0_.FX ~= nil then
      _ARG_0_.FX:SetEffectEnabled("glitchSpawn", true, true)
    end
  end
end
function SaveStation.OnLevelChangeUseEnd(_ARG_0_, _ARG_1_, _ARG_2_)
  Game.SetSFXMuted(false)
  if _ARG_0_.FX ~= nil then
    _ARG_0_.FX:SetEffectEnabled("glitchSpawn", false, false)
  end
end
