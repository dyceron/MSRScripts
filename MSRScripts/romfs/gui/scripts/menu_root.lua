function menu_root.Create(_ARG_0_)
  Game.ImportLibrary("gui/scripts/" .. _ARG_0_ .. ".lua")
  menu_root.oMenu = _G[_ARG_0_](_ARG_0_)
  setmetatable(menu_root, {
    __index = menu_root.FindCallback
  })
  return menu_root.oMenu.oRoot
end
function menu_root.Destroy(_ARG_0_)
  if menu_root.oMenu ~= nil then
    menu_root.oMenu:finalize()
    menu_root.oMenu = nil
  end
end
function menu_root.GenerateCallbackNotFoundFallback(_ARG_0_)
  return function()
    utils.LOG(utils.LOGTYPE_GUI, "menu_root.CallbackNotFoundFallback, Key: " .. tostring(_UPVALUE0_))
  end
end
function menu_root.FindCallback(_ARG_0_, _ARG_1_)
  if menu_root.oMenu ~= nil then
  end
  if menu_root.oMenu:FindCallback(_ARG_1_) == nil then
  end
  return (menu_root.GenerateCallbackNotFoundFallback(_ARG_1_))
end
function menu_root.PopCurrentItem()
  menu_root.oMenu:PopItem()
end
function menu_root.GetStackTopMenuProps()
  return menu_root.oMenu:GetStackTopMenuProps()
end
