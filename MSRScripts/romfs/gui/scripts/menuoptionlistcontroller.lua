Game.ImportLibrary("gui/scripts/MenuListController.lua")
MenuOptionListController = class.New(MenuListController, function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  MenuListController.init(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_0_.bDirty = false
  _ARG_0_.tCurValueIdx = {}
  _ARG_0_.tPrevValueIdx = {}
  _ARG_0_.fnOnItemActivatedButton = nil
  _ARG_0_.fnOnItemActivatedLeftRight = class.BindMethod(_ARG_0_, MenuOptionListController.OnLeftRightActivationDefault)
  _ARG_0_:LoadFromBlackboard()
end)
function MenuOptionListController.OnLeftRightActivationDefault(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_:GetItemByID(_ARG_1_) ~= nil then
    if _ARG_2_ == "Right" then
    elseif _ARG_2_ == "Left" then
    end
    _ARG_0_:SetOptionCurValueIdx(_ARG_0_:GetItemByID(_ARG_1_), _ARG_0_:GetItemByID(_ARG_1_).iMaxUnlockItem)
    Game.PlayGUISound(gui_global_sounds.tSelect.sPath, 1, 1)
  end
  return 1
end
function MenuOptionListController.OnItemActivated(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_3_.ActivationDir == "ActivationButton" then
    if _ARG_0_.fnOnItemActivatedButton then
    else
      Game.PlayGUISound(gui_global_sounds.tWrong.sPath, 1, 1)
    end
  elseif _ARG_0_.fnOnItemActivatedLeftRight then
  else
    Game.PlayGUISound(gui_global_sounds.tWrong.sPath, 1, 1)
  end
  return (_ARG_0_.fnOnItemActivatedLeftRight(_ARG_3_.SelectedItem, _ARG_3_.ActivationDir))
end
function MenuOptionListController.GetTooltip(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return _ARG_1_.asOptionValues[_ARG_0_:GetOptionCurValueIdx(_ARG_1_)]
end
function MenuOptionListController.IsDirty(_ARG_0_)
  return _ARG_0_.bDirty
end
function MenuOptionListController.LoadFromBlackboard(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_.tMenuDef.aItems) do
    if _FORV_5_.sBlackboardIdxProp ~= nil then
      if _FORV_5_.iDefaultIdx ~= nil then
        _ARG_0_:SetOptionCurValueIdx(_FORV_5_, _FORV_5_.iDefaultIdx)
      end
    end
  end
  _ARG_0_.bDirty = false
end
function MenuOptionListController.SetValueIdxs(_ARG_0_, _ARG_1_)
  if _ARG_1_ ~= nil then
    for _FORV_5_, _FORV_6_ in pairs(_ARG_1_) do
      utils.LOG(utils.LOGTYPE_GUI, "_tValueIdxs, sID: " .. tostring(_FORV_5_) .. ", iValueIdx: " .. tostring(_FORV_6_))
      if _ARG_0_:GetItemByID(_FORV_5_) then
        _ARG_0_:SetOptionCurValueIdx(_ARG_0_:GetItemByID(_FORV_5_), _FORV_6_)
      end
    end
  end
end
function MenuOptionListController.SaveToBlackboard(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_.tMenuDef.aItems) do
    if _FORV_5_.sBlackboardIdxProp ~= nil then
      ProfileBlackboard.SetProp("SETTINGS", _FORV_5_.sBlackboardIdxProp, "i", _ARG_0_:GetOptionCurValueIdx(_FORV_5_))
    end
  end
  _ARG_0_.bDirty = false
end
function MenuOptionListController.LoadFromDefault(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_.tMenuDef.aItems) do
    if _FORV_5_.iDefaultIdx ~= nil then
      if _FORV_5_.fnIsEnabled ~= nil then
      end
      if _FORV_5_.fnIsEnabled(_ARG_0_.oOwner, _FORV_5_) then
        _ARG_0_:SetOptionCurValueIdx(_FORV_5_, _FORV_5_.iDefaultIdx)
      end
    end
  end
end
function MenuOptionListController.GetOptionsByValueIdx(_ARG_0_, _ARG_1_)
  for _FORV_6_, _FORV_7_ in pairs(_ARG_0_.tCurValueIdx) do
    if _FORV_7_ == _ARG_1_ then
      table.insert({}, _FORV_6_)
    end
  end
  return {}
end
function MenuOptionListController.GetOptionCurValue(_ARG_0_, _ARG_1_)
  if _ARG_0_:GetOptionCurValueIdx(_ARG_1_) ~= nil then
  end
  return _ARG_1_.asOptionValues[_ARG_0_:GetOptionCurValueIdx(_ARG_1_)]
end
function MenuOptionListController.GetOptionCurValueIdx(_ARG_0_, _ARG_1_)
  if _ARG_0_.tCurValueIdx ~= nil and _ARG_0_.tCurValueIdx[_ARG_1_.sID] then
  end
  return _ARG_0_.tCurValueIdx[_ARG_1_.sID]
end
function MenuOptionListController.GetOptionPrevValueIdx(_ARG_0_, _ARG_1_)
  if _ARG_0_.tCurValueIdx ~= nil and _ARG_0_.tPrevValueIdx[_ARG_1_.sID] then
  end
  return _ARG_0_.tPrevValueIdx[_ARG_1_.sID]
end
function MenuOptionListController.SetOptionCurValue(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_1_.asOptionValues then
    for _FORV_6_, _FORV_7_ in ipairs(_ARG_1_.asOptionValues) do
      if _ARG_2_ == _FORV_7_ then
        _ARG_0_:SetOptionCurValueIdx(_ARG_1_, _FORV_6_)
        break
      end
    end
  end
end
function MenuOptionListController.SetOptionCurValueIdx(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_2_ ~= _ARG_0_:GetOptionCurValueIdx(_ARG_1_) then
    _ARG_0_.tPrevValueIdx[_ARG_1_.sID] = _ARG_0_.tCurValueIdx[_ARG_1_.sID]
    _ARG_0_.tCurValueIdx[_ARG_1_.sID] = _ARG_2_
    if _ARG_1_.fnIsEnabled ~= nil then
    end
    GUI.SetMenuListValue(_ARG_0_.oList, _ARG_1_.sID, _ARG_1_.asOptionValues[_ARG_2_], _ARG_1_.fnIsEnabled(_ARG_0_.oOwner, _ARG_1_), false)
    _ARG_0_.bDirty = true
    if _ARG_0_.oOwner.OnOptionChanged ~= nil then
      _ARG_0_.oOwner.OnOptionChanged(_ARG_0_.oOwner, _ARG_1_, _ARG_2_)
    end
  end
end
