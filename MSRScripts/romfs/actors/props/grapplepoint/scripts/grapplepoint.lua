function GrapplePoint.main()
end
function GrapplePoint.OnGrappleBeamAttached(_ARG_0_)
  Game.PlayEntitySound("weapons/grapple_hit_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 0.5, 100, 3000, 1)
end
function GrapplePoint.OnGrappleBeamDetached(_ARG_0_)
end
function GrapplePoint.OnGrapplePullFinished(_ARG_0_, _ARG_1_)
  if _ARG_1_ then
    if _ARG_0_.GRAPPLEPOINT.eType == "Movable" then
      Game.PlayEntitySound("props/grapplepoints/grappleblock_move_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 1, 3000, 30000, 0.85)
    elseif _ARG_0_.GRAPPLEPOINT.eType == "PullOff" then
      Game.PlayEntitySoundContinueOnDead("props/grapplepoints/grappleblock_boom_0" .. math.random(2) .. ".wav", _ARG_0_.sName, 1, 3000, 30000, 1)
      Game.PlayEntitySoundContinueOnDead("props/grapplepoints/grappleblock_boom_03.wav", _ARG_0_.sName, 1, 3000, 30000, 1)
    end
  end
  if CurrentScenario ~= nil and CurrentScenario.OnGrapplePullFinished ~= nil then
    CurrentScenario.OnGrapplePullFinished(_ARG_0_, _ARG_1_)
  end
end
