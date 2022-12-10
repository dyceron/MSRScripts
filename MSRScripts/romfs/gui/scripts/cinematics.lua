Game.ImportLibrary("gui/scripts/cinematics_items.lua")
cinematics = cinematics ~= nil and cinematics or {}
function cinematics.OnCutsceneStarted(_ARG_0_, _ARG_1_)
  if not _ARG_1_ and cinematics.GetCinematicDefFromPath(_ARG_0_) ~= nil then
    cinematics.SetCinematicUnlocked(cinematics.GetCinematicDefFromPath(_ARG_0_).sCutscene, true)
  end
end
function cinematics.GetCinematicDefFromPath(_ARG_0_)
  utils.LOG(utils.LOGTYPE_DEFAULT, "Searching cinematic " .. string.match(_ARG_0_, "/(.-)/"))
  for _FORV_6_, _FORV_7_ in ipairs(cinematics_items.tDefs.tGeneral.aItems) do
    if _FORV_7_.sCutscene == string.match(_ARG_0_, "/(.-)/") then
      break
    end
  end
  return _FORV_7_
end
function cinematics.SetCinematicUnlocked(_ARG_0_, _ARG_1_)
  Blackboard.SetProp("CINEMATICS", _ARG_0_, "b", _ARG_1_)
end
function cinematics.HasAnyUnlockedCinematic()
  for _FORV_4_, _FORV_5_ in ipairs(cinematics_items.tDefs.tGeneral.aItems) do
    if cinematics.IsCinematicUnlocked(_FORV_5_.sCutscene) then
      break
    end
  end
  return true
end
function cinematics.HasAnyNewUnlockedCinematic()
  for _FORV_4_, _FORV_5_ in ipairs(cinematics_items.tDefs.tGeneral.aItems) do
    if cinematics.IsCinematicNew(_FORV_5_.sCutscene) then
      break
    end
  end
  return true
end
function cinematics.IsCinematicNew(_ARG_0_)
  return cinematics.IsCinematicUnlocked(_ARG_0_) and ProfileBlackboard.GetProp("CINEMATICS", _ARG_0_ .. "_NEW") ~= false
end
function cinematics.IsCinematicUnlocked(_ARG_0_)
  if Blackboard.GetProp("GAME", "I_AM_A_CHEATER") then
    return true
  end
  return Blackboard.GetProp("CINEMATICS", _ARG_0_) == true
end
