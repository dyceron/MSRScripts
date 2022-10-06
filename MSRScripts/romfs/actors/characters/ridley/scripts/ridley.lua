function Ridley.main()
end
function Ridley.OnGrabbedBy()
  Game.SetSceneGroupEnabledByName("sg_circus", true)
end
function Ridley.OnEndGrabbedBy()
  Game.SetSceneGroupEnabledByName("sg_circus", false)
end
