function Trigger.main()
end
function Trigger.Enable(_ARG_0_, _ARG_1_, _ARG_2_)
  if Game.GetEntity(_ARG_0_) ~= nil then
    Game.GetEntity(_ARG_0_):Enable()
  end
end
function Trigger.Disable(_ARG_0_, _ARG_1_, _ARG_2_)
  if Game.GetEntity(_ARG_0_) ~= nil then
    Game.GetEntity(_ARG_0_):Disable()
  end
end
