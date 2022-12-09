Game.ImportLibraryWithName("actors/props/usable/scripts/usable.lua", "Usable")
SamusShip = {}
setmetatable(SamusShip, {__index = Usable})
function SamusShip.OnLevelChangeUse(_ARG_0_, _ARG_1_, _ARG_2_)
  if not Game.PreviousLoadWasReload() and _ARG_1_ ~= "" and Game.GetPreviousGameMode() == "MAINMENU" then
    Game.SetSFXMuted(true)
    Game.PlayMusicStream(0, "streams/music/matad_jintojo_32728k.wav", -1, -1, 0, 0, 0, 0)
  end
end
function SamusShip.OnLevelChangeUseEnd(_ARG_0_, _ARG_1_, _ARG_2_)
  Game.SetSFXMuted(false)
end
