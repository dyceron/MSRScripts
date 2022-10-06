function Gunzoo.main()
end
function Gunzoo.OnDirectionChanged(_ARG_0_)
  Game.PlayEntitySound("actors/autoad/autoad_step_0" .. math.random(3, 4) .. ".wav", _ARG_0_.sName, 1, 500, 2200, 1.1)
end
