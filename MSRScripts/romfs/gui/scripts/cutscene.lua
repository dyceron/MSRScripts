function cutscene.Create(_ARG_0_)
  GUI.CreateDisplayObject(GUI.CreateDisplayObject(GUI.CreateDisplayObjectEx("Cutscene", "CDisplayObjectContainer", {Enabled = true, Depth = "0.05"}), "Up", "CDisplayObjectContainer", {StageID = "Up", Depth = "0.05"}), "CutsceneNameLabel", "CLabel", {
    BottomY = "0.02",
    LeftX = "0.02",
    Enabled = false
  })
  GUI.CreateDisplayObject(GUI.CreateDisplayObject(GUI.CreateDisplayObjectEx("Cutscene", "CDisplayObjectContainer", {Enabled = true, Depth = "0.05"}), "Up", "CDisplayObjectContainer", {StageID = "Up", Depth = "0.05"}), "CutsceneStageLabel", "CLabel", {
    BottomY = "0.02",
    LeftX = "0.02",
    Outline = true,
    Enabled = false
  })
  GUI.CreateDisplayObject(GUI.CreateDisplayObject(GUI.CreateDisplayObjectEx("Cutscene", "CDisplayObjectContainer", {Enabled = true, Depth = "0.05"}), "LoadingUp", "CDisplayObjectContainer", {StageID = "LoadingUp", Depth = "0.05"}), "CutsceneStageLabel", "CLabel", {
    BottomY = "0.02",
    LeftX = "0.02",
    Outline = true,
    Enabled = false
  })
  return (GUI.CreateDisplayObjectEx("Cutscene", "CDisplayObjectContainer", {Enabled = true, Depth = "0.05"}))
end
cutscene.dev_stage = {
  Placeholder = {
    Text = "Placeholder"
  },
  WorkInProgress = {
    Text = "Work In Progress"
  }
}
cutscene.animated_camera_dev_stage = {}
function cutscene.OnAnimatedCameraStarted(_ARG_0_)
  if cutscene.animated_camera_dev_stage[_ARG_0_] and GUI.GetDisplayObject("Cutscene") then
    if GUI.GetDisplayObject("Cutscene"):FindDescendant("Up.CutsceneStageLabel") then
      GUI.SetProperties(GUI.GetDisplayObject("Cutscene"):FindDescendant("Up.CutsceneStageLabel"), {
        Enabled = true,
        Text = cutscene.animated_camera_dev_stage[_ARG_0_].Text
      })
    end
    if GUI.GetDisplayObject("Cutscene"):FindDescendant("LoadingUp.CutsceneStageLabel") then
      GUI.SetProperties(GUI.GetDisplayObject("Cutscene"):FindDescendant("LoadingUp.CutsceneStageLabel"), {
        Enabled = true,
        Text = cutscene.animated_camera_dev_stage[_ARG_0_].Text
      })
    end
  end
end
function cutscene.OnAnimatedCameraFinished(_ARG_0_)
  if GUI.GetDisplayObject("Cutscene") then
    if GUI.GetDisplayObject("Cutscene"):FindDescendant("Up.CutsceneStageLabel") then
      GUI.SetProperties(GUI.GetDisplayObject("Cutscene"):FindDescendant("Up.CutsceneStageLabel"), {Enabled = false})
    end
    if GUI.GetDisplayObject("Cutscene"):FindDescendant("LoadingUp.CutsceneStageLabel") then
      GUI.SetProperties(GUI.GetDisplayObject("Cutscene"):FindDescendant("LoadingUp.CutsceneStageLabel"), {Enabled = false})
    end
  end
end
