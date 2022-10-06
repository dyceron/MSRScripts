function Gullugg.main()
end
function Gullugg.LaunchDamageSound(_ARG_0_)
  if _ARG_0_ ~= nil then
    Game.PlayEntitySound("actors/gullugg/gullugg_bumpattack_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.3, 500, 3000, 1.6)
  end
end
