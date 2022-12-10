LoadScreenCompositionDown = LoadScreenCompositionDown or {}
function LoadScreenCompositionDown.Create(_ARG_0_, _ARG_1_)
  return (LoadScreenCompositionDown.CreateLoadScreenCompositionDown(_ARG_0_, _ARG_1_))
end
function LoadScreenCompositionDown.CreateLoadScreenCompositionDown(_ARG_0_, _ARG_1_)
  GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}):AddChild((GUI.CreateDisplayObjectEx("BackgroundBot", "CSprite", {
    X = "0.00000",
    Y = "0.00000",
    SizeX = "1.00000",
    SizeY = "1.00000",
    ScaleX = "1.00000",
    ScaleY = "1.00000",
    Angle = "0.00000",
    FlipX = false,
    FlipY = false,
    ColorR = "0.34000",
    ColorG = "0.57000",
    ColorB = "0.84000",
    ColorA = "1.00000",
    Enabled = true,
    SkinItemType = "",
    Autosize = false,
    SpriteSheetItem = "Background",
    BlendMode = "AlphaBlend",
    USelMode = "Scale",
    VSelMode = "Scale"
  })))
  GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}):AddChild((GUI.CreateDisplayObjectEx("CircleBot", "CSprite", {
    X = "0.23750",
    Y = "0.15000",
    SizeX = "0.52500",
    SizeY = "0.70000",
    ScaleX = "1.00000",
    ScaleY = "1.00000",
    Angle = "0.00000",
    FlipX = false,
    FlipY = false,
    ColorR = "0.00000",
    ColorG = "0.50000",
    ColorB = "0.66000",
    ColorA = "1.00000",
    Enabled = true,
    SkinItemType = "",
    Autosize = false,
    SpriteSheetItem = "Circle_Logo",
    BlendMode = "Additive",
    USelMode = "Scale",
    VSelMode = "Scale"
  })))
  GUI.SetHierarchyProperties(GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}), _ARG_1_)
  return (GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}))
end
