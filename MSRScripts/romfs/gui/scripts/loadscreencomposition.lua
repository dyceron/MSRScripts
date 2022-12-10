LoadScreenComposition = LoadScreenComposition or {}
function LoadScreenComposition.Create(_ARG_0_, _ARG_1_)
  return (LoadScreenComposition.CreateLoadScreenComposition(_ARG_0_, _ARG_1_))
end
function LoadScreenComposition.CreateLoadScreenComposition(_ARG_0_, _ARG_1_)
  GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}):AddChild((GUI.CreateDisplayObjectEx("Background", "CSprite", {
    X = "0.00000",
    Y = "0.00000",
    SizeX = "1.00000",
    SizeY = "1.00000",
    ScaleX = "1.00000",
    ScaleY = "1.00000",
    Angle = "0.00000",
    FlipX = false,
    FlipY = false,
    ColorR = "0.00000",
    ColorG = "0.00000",
    ColorB = "0.00000",
    ColorA = "1.00000",
    Enabled = true,
    SkinItemType = "",
    Autosize = false,
    SpriteSheetItem = "WhiteSquare",
    BlendMode = "AlphaBlend",
    USelMode = "Scale",
    VSelMode = "Scale"
  })))
  GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}):AddChild((GUI.CreateDisplayObjectEx("CircleA", "CSprite", {
    X = "0.82500",
    Y = "0.70833",
    SizeX = "0.16000",
    SizeY = "0.26666",
    ScaleX = "1.00000",
    ScaleY = "1.00000",
    Angle = "0.00000",
    FlipX = false,
    FlipY = false,
    ColorR = "0.15000",
    ColorG = "0.90000",
    ColorB = "1.00000",
    ColorA = "1.00000",
    Enabled = true,
    SkinItemType = "",
    Autosize = false,
    SpriteSheetItem = "circle_Inner&Outer",
    BlendMode = "Additive",
    USelMode = "Scale",
    VSelMode = "Scale"
  })))
  GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}):AddChild((GUI.CreateDisplayObjectEx("CircleB", "CSprite", {
    X = "0.82500",
    Y = "0.70833",
    SizeX = "0.16000",
    SizeY = "0.26666",
    ScaleX = "1.00000",
    ScaleY = "1.00000",
    Angle = "0.00000",
    FlipX = false,
    FlipY = false,
    ColorR = "0.15000",
    ColorG = "0.90000",
    ColorB = "1.00000",
    ColorA = "1.00000",
    Enabled = true,
    SkinItemType = "",
    Autosize = false,
    SpriteSheetItem = "circle_central",
    BlendMode = "Additive",
    USelMode = "Scale",
    VSelMode = "Scale"
  })))
  GUI.SetHierarchyProperties(GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}), _ARG_1_)
  return (GUI.CreateDisplayObjectEx(_ARG_0_, "CDisplayObjectContainer", {}))
end
