SaveGame = SaveGame ~= nil and SaveGame or {}
SaveGame.Version = 2
function SaveGame.IsValidGameInBlackboard()
  return (Blackboard.GetProp("GAME", "Version") ~= nil and Blackboard.GetProp("GAME", "Version") or 0) >= SaveGame.Version
end
function SaveGame.OnNoDeviceSelected()
end
function SaveGame.OnOverridePermissionNeeded()
end
function SaveGame.OnOverrideSelected()
end
function SaveGame.OnOverrideConfirmed()
  Game.CommitSaveDataDeviceSelection()
end
function SaveGame.OnOverrideCancel()
  Game.InitSaveData()
end
function SaveGame.OnDeviceChanged(_ARG_0_)
  if not _ARG_0_ or menu_root ~= nil then
  else
    SaveGame.SaveDataToNewDevice()
  end
end
function SaveGame.SaveDataToNewDevice()
  Game.SaveDataToNewDevice()
end
function SaveGame.OnSaveDataToNewDeviceFinished()
end
function SaveGame.NotEnoughSpaceDeviceSelected(_ARG_0_)
end
function SaveGame.NotEnoughSpaceToCreateSlot(_ARG_0_)
end
function SaveGame.InvalidDeviceSelected()
end
function SaveGame.OnSaveDataDeviceInitFinished()
end
function SaveGame.OnContinueWithoutSavingConfirmed()
  Game.CommitSaveDataDeviceSelection()
end
function SaveGame.OnContinueWithoutSavingSelected()
end
function SaveGame.OnDeviceInvalidated(_ARG_0_)
end
