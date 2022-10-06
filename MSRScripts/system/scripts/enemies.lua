setmetatable(Enemies, {__index = _G})
setfenv(1, Enemies)
function main()
end
function AddChildBehavior(_ARG_0_, _ARG_1_, _ARG_2_)
  if #_ARG_1_ >= 2 then
    if _ARG_2_ == nil then
    else
    end
    for _FORV_7_, _FORV_8_ in pairs(_ARG_1_[2]) do
      _ARG_0_:AddBehavior(_ARG_1_[1], _ARG_2_)[_FORV_7_] = _FORV_8_
    end
    for _FORV_7_ = 3, #_ARG_1_ do
      Enemies.AddChildBehavior(_ARG_0_, _ARG_1_[_FORV_7_], (_ARG_0_:AddBehavior(_ARG_1_[1], _ARG_2_)))
    end
  end
end
