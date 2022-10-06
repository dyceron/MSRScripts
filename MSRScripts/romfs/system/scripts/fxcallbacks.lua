fxcallbacks = {
  lfxenabled = {}
}
function fxcallbacks.SetFxEnabledOnPlayer(_ARG_0_, _ARG_1_, _ARG_2_)
  for _FORV_7_, _FORV_8_ in ipairs({
    Game.GetDefaultPlayer(),
    Game.GetSecondaryPlayer()
  }) do
    if _FORV_8_ ~= nil and _FORV_8_.FX ~= nil then
      _FORV_8_.FX:SetEffectEnabled(_ARG_0_, _ARG_1_, _ARG_2_)
      if _ARG_1_ then
        table.insert(fxcallbacks.lfxenabled, _ARG_0_)
      else
        for _FORV_13_, _FORV_14_ in ipairs(fxcallbacks.lfxenabled) do
          if _FORV_14_ == _ARG_0_ then
            table.remove(fxcallbacks.lfxenabled, _FORV_13_)
          end
        end
      end
    end
  end
end
function fxcallbacks.OnPlayerChange()
  for _FORV_4_, _FORV_5_ in ipairs({
    Game.GetDefaultPlayer(),
    Game.GetSecondaryPlayer()
  }) do
    if _FORV_5_ ~= nil and _FORV_5_.FX ~= nil then
      for _FORV_10_, _FORV_11_ in ipairs(fxcallbacks.lfxenabled) do
        _FORV_5_.FX:SetEffectEnabled(_FORV_11_, true, true)
      end
    end
  end
end
function fxcallbacks.OnPlayerDead()
  fxcallbacks.lfxenabled = {}
end
