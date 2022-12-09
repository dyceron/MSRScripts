Game.ImportLibraryWithName("actors/props/usable/scripts/usable.lua", "Usable")
Teleporter = {}
setmetatable(Teleporter, {__index = Usable})
function Teleporter.OnStart(_ARG_0_, _ARG_1_)
  if Game.GetEntity("LE_Platform_" .. string.sub(_ARG_0_.sName, 4)) ~= nil and Game.GetEntity("LE_Platform_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT ~= nil then
    Game.GetEntity("LE_Platform_" .. string.sub(_ARG_0_.sName, 4)).SMARTOBJECT:OnStartUse()
  end
end
function Teleporter.DiscoverFX(_ARG_0_)
  if Game.GetEntity(_ARG_0_) ~= nil and Game.GetEntity(_ARG_0_).USABLE ~= nil then
    Game.GetEntity(_ARG_0_).USABLE:DiscoverFX()
  end
end
function Teleporter.OnTeleportCancel(_ARG_0_)
  _ARG_0_.USABLE:OnTeleportCancel()
end
function Teleporter.OnTeleportAccept(_ARG_0_, _ARG_1_, _ARG_2_)
  print(_ARG_2_)
  _ARG_0_.USABLE:OnTeleportAccept(_ARG_1_, _ARG_2_)
end
function Teleporter.TeleportToDestination(_ARG_0_, _ARG_1_)
  Game.SetLoadScreenType(5)
  Scenario.FadeOutAndLoad(Scenario.tCharacterScenarioLevels.c10_samus ~= nil and Scenario.tCharacterScenarioLevels.c10_samus or "c10_samus", utils.Split(_ARG_1_, "|")[1], "ST_" .. string.sub(utils.Split(_ARG_1_, "|")[2], 4), 1)
  Game.AddPSF(1 * 0.9, "Game.PlayLoadingStream", "sif", "streams/maps/teleport_ambience.wav", 1, 1)
end
