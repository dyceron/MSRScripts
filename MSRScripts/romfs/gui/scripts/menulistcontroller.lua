MenuListController = class.New(function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  _ARG_0_.oOwner = _ARG_1_
  _ARG_0_.oList = _ARG_2_
  _ARG_0_.tMenuDef = _ARG_3_
  _ARG_0_.bAllEnabled = false
  _ARG_3_.tItemDefaults = _ARG_3_.tItemDefaults or {}
  for _FORV_8_, _FORV_9_ in ipairs(_ARG_0_.tMenuDef.aItems) do
    setmetatable(_FORV_9_, {
      __index = _ARG_0_.tMenuDef.tItemDefaults
    })
  end
  if _ARG_3_.tListConfig or {}.sNumItemRenderers ~= nil then
    GUI.SetProperties(_ARG_0_.oList, {
      NumItemRenderers = _ARG_3_.tListConfig or {}.sNumItemRenderers
    })
  else
    GUI.SetProperties(_ARG_0_.oList, {
      NumItemRenderers = #_ARG_0_.tMenuDef.aItems
    })
  end
  GUI.AddLuaEventHandler(_ARG_0_.oList, "Activated", class.BindMethodByName(_ARG_0_, "OnItemActivated"))
  GUI.SetListOnItemSelectedCallback(_ARG_0_.oList, class.BindMethodByName(_ARG_0_, "OnItemSelected"))
  if _ARG_3_.tListConfig or {}.fListHeightPerItem ~= nil then
    GUI.SetProperties(_ARG_2_, {
      SizeY = #_ARG_3_.aItems * _ARG_3_.tListConfig or {}.fListHeightPerItem
    })
  end
  if _ARG_4_ ~= false then
    _ARG_0_:RefreshList()
  end
  _ARG_2_:ForceRedraw()
end)
function MenuListController.SetAllEnabled(_ARG_0_, _ARG_1_)
  if _ARG_0_.bAllEnabled ~= _ARG_1_ then
    _ARG_0_.bAllEnabled = _ARG_1_
    _ARG_0_:RefreshList()
  end
end
function MenuListController.GetTooltip(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return ""
end
function MenuListController.RefreshList(_ARG_0_)
  for _FORV_10_, _FORV_11_ in ipairs(_ARG_0_.tMenuDef.aItems) do
    if not _ARG_0_.bAllEnabled and _FORV_11_.fnIsEnabled ~= nil then
    end
    if _FORV_11_.fnIsNew ~= nil then
    end
    if _FORV_11_.fnIsUpdated ~= nil then
    end
    if _FORV_11_.fnGetText ~= nil then
    end
    if _FORV_11_.fnGetTooltip ~= nil then
    end
    if _FORV_11_.fnGetTooltip(_ARG_0_.oOwner, _FORV_11_, _FORV_11_.fnIsEnabled(_ARG_0_.oOwner, _FORV_11_), (_FORV_11_.fnIsNew(_ARG_0_.oOwner, _FORV_11_))) == nil then
    end
  end
  GUI.SetMenuListValues(_ARG_0_.oList, {
    [_FORV_10_] = _FORV_11_.fnGetText(_ARG_0_.oOwner, _FORV_11_, _FORV_11_.fnIsEnabled(_ARG_0_.oOwner, _FORV_11_), (_FORV_11_.fnIsNew(_ARG_0_.oOwner, _FORV_11_)))
  }, {
    [_FORV_10_] = _ARG_0_:GetTooltip(_FORV_11_, _FORV_11_.fnIsEnabled(_ARG_0_.oOwner, _FORV_11_), (_FORV_11_.fnIsNew(_ARG_0_.oOwner, _FORV_11_)))
  }, {
    [_FORV_10_] = _FORV_11_.fnIsEnabled(_ARG_0_.oOwner, _FORV_11_)
  }, {
    [_FORV_10_] = _FORV_11_.fnIsNew(_ARG_0_.oOwner, _FORV_11_)
  }, {
    [_FORV_10_] = _FORV_11_.fnIsUpdated(_ARG_0_.oOwner, _FORV_11_)
  }, false)
end
function MenuListController.GetItemByItemTextID(_ARG_0_, _ARG_1_)
  for _FORV_6_, _FORV_7_ in ipairs(_ARG_0_.tMenuDef.aItems) do
    if _FORV_7_.fnGetText ~= nil then
      if not _ARG_0_.bAllEnabled and _FORV_7_.fnIsEnabled ~= nil then
      end
      if _FORV_7_.fnIsNew ~= nil then
      end
    end
    utils.LOG(utils.LOGTYPE_GUI, "Compare :" .. _FORV_7_.fnGetText(_ARG_0_.oOwner, _FORV_7_, _FORV_7_.fnIsEnabled(_ARG_0_.oOwner, _FORV_7_), (_FORV_7_.fnIsNew(_ARG_0_.oOwner, _FORV_7_))) .. " == " .. _ARG_1_)
    if _FORV_7_.fnGetText(_ARG_0_.oOwner, _FORV_7_, _FORV_7_.fnIsEnabled(_ARG_0_.oOwner, _FORV_7_), (_FORV_7_.fnIsNew(_ARG_0_.oOwner, _FORV_7_))) == _ARG_1_ then
      break
    end
  end
  return _FORV_7_
end
function MenuListController.GetItemByID(_ARG_0_, _ARG_1_)
  for _FORV_6_, _FORV_7_ in ipairs(_ARG_0_.tMenuDef.aItems) do
    if _FORV_7_.sID == _ARG_1_ then
      break
    end
  end
  return _FORV_7_
end
function MenuListController.OnItemSelected(_ARG_0_)
  utils.LOG(utils.LOGTYPE_GUI, "MenuListController:OnItemSelected")
  Game.PlayGUISound(gui_global_sounds.tSelect.sPath, 1, 1)
  if _ARG_0_:GetItemByID(_ARG_0_.oList:GetSelectedItemID()).fnOnSelected ~= nil then
    _ARG_0_:GetItemByID(_ARG_0_.oList:GetSelectedItemID()).fnOnSelected(_ARG_0_.oOwner, (_ARG_0_:GetItemByID(_ARG_0_.oList:GetSelectedItemID())))
  end
end
function MenuListController.OnItemActivated(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_3_.ActivationDir == "ActivationButton" then
    utils.LOG(utils.LOGTYPE_GUI, "tItem.fnOnActivated: " .. tostring(_ARG_3_.SelectedItem) .. "-> " .. tostring(_ARG_0_:GetItemByItemTextID(_ARG_3_.SelectedItem)))
    if _ARG_0_:GetItemByItemTextID(_ARG_3_.SelectedItem) ~= nil then
      if _ARG_0_:GetItemByItemTextID(_ARG_3_.SelectedItem).fnOnActivated ~= nil then
        _ARG_0_:GetItemByItemTextID(_ARG_3_.SelectedItem).fnOnActivated(_ARG_0_.oOwner, _ARG_0_:GetItemByItemTextID(_ARG_3_.SelectedItem), _ARG_3_.ActivationDir)
      end
      if true then
        Game.PlayGUISound(gui_global_sounds.tAccept.sPath, 1, 1)
      end
    end
  end
end
function MenuListController.OnAccept(_ARG_0_)
  if _ARG_0_.oList ~= nil then
    GUI.DispatchEvent(_ARG_0_.oList, "Activated", {})
  end
end
