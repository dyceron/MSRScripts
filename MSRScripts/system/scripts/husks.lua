Game.DoFile("system/scripts/husksdefs.lua")
Husks = Husks or {}
setmetatable(Husks, {__index = _G})
setfenv(1, Husks)
function Husks.main()
  InitHusksDefs(HusksDefs.tHusksDefs)
end
function InitHusksDefs(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_) do
    AddHusk(_FORV_5_)
  end
end
function AddHusk(_ARG_0_)
  Game.AddHusk(_ARG_0_)
end
