utils = utils or {}
utils.LOGTYPE_DEFAULT = 1
utils.LOGTYPE_AI = 2
utils.LOGTYPE_LUA = 3
utils.LOGTYPE_GUI = 4
utils.LOGTYPE_SOUND = 5
utils.LOGTYPE_EDITOR = 6
utils.LOGTYPE_LOGIC = 7
utils.LOGTYPE_ANIMS = 8
utils.LOGTYPE_FX = 9
utils.LOGTYPE_MEM = 10
function utils.CreateNElemsArray(_ARG_0_, _ARG_1_)
  for _FORV_6_ = 1, _ARG_1_ do
  end
  return {
    [_FORV_6_] = _ARG_0_
  }
end
function utils.DeepCopy(_ARG_0_)
  if type(_ARG_0_) == "table" then
    for _FORV_6_, _FORV_7_ in next, _ARG_0_, nil do
    end
    setmetatable({
      [utils.DeepCopy(_FORV_6_)] = utils.DeepCopy(_FORV_7_)
    }, utils.DeepCopy(getmetatable(_ARG_0_)))
  else
  end
  return _ARG_0_
end
function utils.Merge(_ARG_0_, _ARG_1_)
  for _FORV_6_, _FORV_7_ in pairs(_ARG_0_) do
  end
  for _FORV_6_, _FORV_7_ in pairs(_ARG_1_) do
  end
  return {
    [_FORV_6_] = _FORV_7_,
    [_FORV_6_] = _FORV_7_
  }
end
function utils.GetArrayIndexByID(_ARG_0_, _ARG_1_)
  for _FORV_5_, _FORV_6_ in ipairs(_ARG_0_) do
    if _FORV_6_.sID == _ARG_1_ then
      return _FORV_5_
    end
  end
  return -1
end
function utils.Split(_ARG_0_, _ARG_1_)
  if _ARG_1_ == nil then
    _ARG_1_ = "%s+"
  end
  for _FORV_6_ in string.gmatch(_ARG_0_, "([^" .. _ARG_1_ .. "]+)") do
    table.insert({}, _FORV_6_)
  end
  return {}
end
function utils.LOG(_ARG_0_, _ARG_1_)
  if Init.DEBUG then
    Game.Log(_ARG_0_, _ARG_1_)
  end
end
function utils.LOG_WARN(_ARG_0_, _ARG_1_)
  if Init.DEBUG then
    Game.LogWarn(_ARG_0_, _ARG_1_)
  end
end
function utils.LOG_ERR(_ARG_0_, _ARG_1_)
  if Init.DEBUG then
    Game.LogError(_ARG_0_, _ARG_1_)
  end
end
function utils.GeneratePopupUntilSuccess(_ARG_0_)
  if not GUI.MainMenuShowPopUp(_ARG_0_) then
    Game.AddSF(0.1, "utils.GeneratePopupUntilSuccess", "s", _ARG_0_)
  end
end
