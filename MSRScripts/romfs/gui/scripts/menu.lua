Game.ImportLibrary("system/scripts/class.lua", false)
Menu = class.New(function(_ARG_0_, _ARG_1_)
  _ARG_0_.sID = _ARG_1_
  _ARG_0_.oRoot = GUI.CreateDisplayObjectEx(_ARG_1_, "CDisplayObjectContainer", {StageID = "Up"})
  _ARG_0_.atItemStack = {}
end)
function Menu.finalize(_ARG_0_)
  if _ARG_0_.oRoot ~= nil then
    GUI.DestroyDisplayObject(_ARG_0_.oRoot)
    _ARG_0_.oRoot = nil
  end
end
function Menu.GetTopStackItem(_ARG_0_)
  if #_ARG_0_.atItemStack > 0 then
  end
  return _ARG_0_.atItemStack[#_ARG_0_.atItemStack]
end
function Menu.OnLuaLibrariesReloaded(_ARG_0_)
  _ARG_0_:OnLuaLibrariesReloaded()
end
function Menu.ResetTopStackItem(_ARG_0_)
  if #_ARG_0_.atItemStack > 0 then
    utils.LOG(utils.LOGTYPE_GUI, "Menu.ResetTopStackItem: Menu: " .. tostring(_ARG_0_.sID) .. ", CurrentItemClass: " .. tostring(_ARG_0_.atItemStack[#_ARG_0_.atItemStack].sClassName))
    if _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem ~= nil then
      _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem:finalize()
    end
    _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem = _G[_ARG_0_.atItemStack[#_ARG_0_.atItemStack].sClassName](_ARG_0_.atItemStack[#_ARG_0_.atItemStack].sClassName, _ARG_0_, _ARG_0_.atItemStack[#_ARG_0_.atItemStack].tCreateParams)
    _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem:OnInitialized()
  end
end
function Menu.PushItemByClassName(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  utils.LOG(utils.LOGTYPE_GUI, "Menu:PushItemByClassName: _sClassName:" .. _ARG_1_)
  if _ARG_3_ ~= false and #_ARG_0_.atItemStack > 0 and _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem ~= nil then
    _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem:finalize(_ARG_0_.atItemStack[#_ARG_0_.atItemStack].tCreateParams)
    _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem = nil
  end
  if _ARG_2_ == nil then
    _ARG_2_ = {}
  end
  if _G[_ARG_1_] ~= nil then
    if _ARG_2_.bCreateItem ~= false then
    end
    utils.LOG(utils.LOGTYPE_GUI, "Menu:PushItemByClassName: insert item to stack :" .. tostring({
      sClassName = _ARG_1_,
      tCreateParams = _ARG_2_,
      oItem = _G[_ARG_1_](_ARG_1_, _ARG_0_, _ARG_2_)
    }) .. ", item: " .. tostring({
      sClassName = _ARG_1_,
      tCreateParams = _ARG_2_,
      oItem = _G[_ARG_1_](_ARG_1_, _ARG_0_, _ARG_2_)
    }.oItem))
    table.insert(_ARG_0_.atItemStack, {
      sClassName = _ARG_1_,
      tCreateParams = _ARG_2_,
      oItem = _G[_ARG_1_](_ARG_1_, _ARG_0_, _ARG_2_)
    })
    if {
      sClassName = _ARG_1_,
      tCreateParams = _ARG_2_,
      oItem = _G[_ARG_1_](_ARG_1_, _ARG_0_, _ARG_2_)
    }.oItem ~= nil then
      {
        sClassName = _ARG_1_,
        tCreateParams = _ARG_2_,
        oItem = _G[_ARG_1_](_ARG_1_, _ARG_0_, _ARG_2_)
      }.oItem:OnInitialized()
    end
  else
    utils.ERR(utils.LOGTYPE_GUI, "Menu:PushItemByClassName, Class '" .. _ARG_1_ .. "' not found")
  end
  return (_G[_ARG_1_](_ARG_1_, _ARG_0_, _ARG_2_))
end
function Menu.PopAllPopUps(_ARG_0_)
  utils.LOG(utils.LOGTYPE_GUI, "Menu:PopAllPopUps")
  while #_ARG_0_.atItemStack > 0 and _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem.bIsPopUp do
    _ARG_0_:PopItem()
  end
end
function Menu.PopAllItems(_ARG_0_)
  utils.LOG(utils.LOGTYPE_GUI, "Menu:PopAllItems")
  while #_ARG_0_.atItemStack > 0 do
    _ARG_0_:PopItem()
  end
end
function Menu.PopItemIfAtTop(_ARG_0_, _ARG_1_, _ARG_2_)
  if #_ARG_0_.atItemStack > 0 and _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem.sID == _ARG_1_.sID then
    _ARG_0_:PopItem(_ARG_2_)
  end
end
function Menu.PopItem(_ARG_0_, _ARG_1_)
  if #_ARG_0_.atItemStack > 0 then
    utils.LOG(utils.LOGTYPE_GUI, "Menu:PopItem, item: " .. _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem.sID)
    if _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem then
      _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem:finalize()
    end
    table.remove(_ARG_0_.atItemStack, #_ARG_0_.atItemStack)
    if _ARG_0_.atItemStack[#_ARG_0_.atItemStack].tCreateParams.fnOnCloseCallback ~= nil then
      _ARG_0_.atItemStack[#_ARG_0_.atItemStack].tCreateParams.fnOnCloseCallback()
    end
    if #_ARG_0_.atItemStack > 0 then
      if _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem == nil then
        _ARG_0_.atItemStack[#_ARG_0_.atItemStack].tCreateParams.tPrevScreenInfo = {
          sID = _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem.sID,
          tReturnValues = _ARG_1_
        }
        _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem = _G[_ARG_0_.atItemStack[#_ARG_0_.atItemStack].sClassName](_ARG_0_.atItemStack[#_ARG_0_.atItemStack].sClassName, _ARG_0_, _ARG_0_.atItemStack[#_ARG_0_.atItemStack].tCreateParams)
        _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem:OnInitialized()
      end
    elseif _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem:GetBackDefaultScreen() ~= nil then
      _ARG_0_:PushItemByClassName(_ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem:GetBackDefaultScreen(), {
        tPrevScreenInfo = {
          sID = _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem.sID,
          tReturnValues = _ARG_1_
        }
      }, false)
    end
  end
end
function Menu.FindTopStackItemCallback(_ARG_0_, _ARG_1_)
  if #_ARG_0_.atItemStack > 0 then
    if _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem ~= nil then
      utils.LOG(utils.LOGTYPE_GUI, "Looking for callback " .. _ARG_1_ .. " top stack item: " .. _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem.sID)
    end
  end
  return function(...)
    _UPVALUE0_(_UPVALUE1_.oItem, unpack(nil))
  end
end
function Menu.GetStackTopMenuProps(_ARG_0_)
  return {
    sID = _ARG_0_.atItemStack[#_ARG_0_.atItemStack].oItem.sID
  }
end
function Menu.FindCallback(_ARG_0_, _ARG_1_)
  if function(...)
    _UPVALUE0_(_UPVALUE1_, unpack(nil))
  end == nil then
  end
  return (_ARG_0_:FindTopStackItemCallback(_ARG_1_))
end
