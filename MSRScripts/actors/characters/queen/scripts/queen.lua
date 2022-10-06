function Queen.main()
end
function Queen.DeepCopy(_ARG_0_)
  if type(_ARG_0_) == "table" then
    for _FORV_6_, _FORV_7_ in next, _ARG_0_, nil do
    end
    setmetatable({
      [Queen.DeepCopy(_FORV_6_)] = Queen.DeepCopy(_FORV_7_)
    }, Queen.DeepCopy(getmetatable(_ARG_0_)))
  else
  end
  return _ARG_0_
end
function Queen.AddSubtree(_ARG_0_, _ARG_1_)
  if Queen.ComboSubtree[_ARG_0_] ~= nil then
    if _ARG_1_ ~= nil and type(_ARG_1_) == "table" and type(Queen.DeepCopy(Queen.ComboSubtree[_ARG_0_])[2]) == "table" then
      for _FORV_7_, _FORV_8_ in pairs(_ARG_1_) do
        Queen.DeepCopy(Queen.ComboSubtree[_ARG_0_])[2][_FORV_7_] = _FORV_8_
      end
    end
  else
    utils.LOG_ERR(utils.LOGTYPE_AI, "Queen subtree " .. _ARG_0_ .. " does not exists")
  end
  return (Queen.DeepCopy(Queen.ComboSubtree[_ARG_0_]))
end
Queen.ComboSubtree = {}
Queen.ComboTreeDef = {}
Queen.ComboTreeDef[1] = {
  WalkBack = {
    {fProbability = 1},
    {
      "WalkBack",
      {}
    }
  },
  Crushing = {
    {fProbability = 1},
    {
      "Crushing",
      {}
    }
  },
  PlasmaArcFloorSingle = {
    {fProbability = 1},
    {
      "PlasmaArcFloorSingle",
      {fTime = 9, bAbortCombo = true},
      {
        "PlasmaArcCeiling2Wall",
        {fProbability = 0.8}
      }
    }
  },
  PlasmaArcCeilingSingle = {
    {fProbability = 1},
    {
      "PlasmaArcCeilingSingle",
      {},
      {
        "Nothing",
        {fTime = 1}
      }
    }
  },
  PlasmaArcWallUpSingle = {
    {fProbability = 1},
    {
      "PlasmaArcWallUpSingle",
      {}
    }
  },
  PlasmaArcWallDownSingle = {
    {fProbability = 1},
    {
      "PlasmaArcWallDownSingle",
      {}
    }
  },
  ShortAssault = {
    {fProbability = 1},
    {
      "ShortAssault",
      {},
      {
        "Crushing",
        {fProbability = 1}
      },
      {
        "WalkBack",
        {fProbability = 1}
      }
    }
  },
  ShortAssaultAbuse = {
    {fProbability = 1000},
    {
      "ShortAssaultAbuse",
      {},
      {
        "Crushing",
        {fProbability = 1}
      },
      {
        "WalkBack",
        {fProbability = 1}
      }
    }
  },
  CrushingAbuse = {
    {fProbability = 1000},
    {
      "CrushingAbuse",
      {},
      {
        "Crushing",
        {fProbability = 1}
      },
      {
        "Nothing",
        {fProbability = 1}
      }
    }
  },
  WalkFront = {
    {fProbability = 1},
    {
      "WalkFront",
      {},
      {
        "Crushing",
        {fProbability = 1000}
      },
      {
        "ShakingJump",
        {},
        {
          "Crushing",
          {}
        }
      }
    }
  }
}
Queen.ComboTreeDef[2] = {
  WalkBack = {
    {fProbability = 1},
    {
      "WalkBack",
      {}
    }
  },
  Crushing = {
    {fProbability = 1},
    {
      "Crushing",
      {}
    }
  },
  PlasmaArcWallUpSingle = {
    {fProbability = 1},
    {
      "PlasmaArcWallUpSingle",
      {}
    }
  },
  PlasmaArcWallDownSingle = {
    {fProbability = 1},
    {
      "PlasmaArcWallDownSingle",
      {}
    }
  },
  ShortAssault = {
    {fProbability = 1},
    {
      "ShortAssault",
      {},
      {
        "Crushing",
        {fProbability = 1}
      },
      {
        "WalkBack",
        {fProbability = 1}
      }
    }
  },
  ShortAssaultAbuse = {
    {fProbability = 1000},
    {
      "ShortAssaultAbuse",
      {},
      {
        "Crushing",
        {fProbability = 1}
      },
      {
        "WalkBack",
        {fProbability = 1}
      }
    }
  },
  WalkFront = {
    {fProbability = 1},
    {
      "WalkFront",
      {},
      {
        "Crushing",
        {fProbability = 1000}
      },
      {
        "ShakingJump",
        {},
        {
          "Crushing",
          {}
        }
      }
    }
  },
  RoarAfterPlasmaArcWallDown = {
    {fProbability = 3},
    {
      "PlasmaArcWallDown",
      {bAbortCombo = false},
      {
        "Roar",
        {fTime = 5, bAbortCombo = true}
      }
    }
  },
  Balls = {
    {fProbability = 2},
    {
      "PlasmaBalls",
      {},
      {
        "PlasmaArcFloor2Wall_FloorDisappear",
        {
          fProbability = 1,
          fTime = 7,
          bAbortCombo = true
        },
        {
          "ShakingJumpCeiling",
          {bAbortCombo = true}
        }
      },
      {
        "PlasmaArcCeilingSingle",
        {bAbortCombo = true},
        {
          "PlasmaArcWallDownSingle",
          {bAbortCombo = true}
        }
      }
    }
  }
}
Queen.ComboTreeDef[3] = {
  WalkBack = {
    {fProbability = 1},
    {
      "WalkBack",
      {}
    }
  },
  Crushing = {
    {fProbability = 1},
    {
      "Crushing",
      {}
    }
  },
  PlasmaArcWallUpSingle = {
    {fProbability = 1},
    {
      "PlasmaArcWallUpSingle",
      {}
    }
  },
  PlasmaArcWallDownSingle = {
    {fProbability = 1},
    {
      "PlasmaArcWallDownSingle",
      {}
    }
  },
  ShortAssault = {
    {fProbability = 1},
    {
      "ShortAssault",
      {},
      {
        "Crushing",
        {fProbability = 1}
      },
      {
        "WalkBack",
        {fProbability = 1}
      }
    }
  },
  ShortAssaultAbuse = {
    {fProbability = 1000},
    {
      "ShortAssaultAbuse",
      {},
      {
        "Crushing",
        {fProbability = 1}
      },
      {
        "WalkBack",
        {fProbability = 1}
      }
    }
  },
  WalkFront = {
    {fProbability = 1},
    {
      "WalkFront",
      {},
      {
        "Crushing",
        {fProbability = 1000}
      },
      {
        "ShakingJump",
        {},
        {
          "Crushing",
          {}
        }
      }
    }
  },
  Balls = {
    {fProbability = 4},
    {
      "PlasmaBalls",
      {},
      {
        "PlasmaArcWallDown",
        {fProbability = 1, bAbortCombo = false},
        {
          "Roar",
          {fTime = 5, bAbortCombo = true}
        }
      },
      {
        "PlasmaArcFloor2Wall_FloorDisappear",
        {
          fProbability = 1,
          fTime = 9,
          bAbortCombo = true
        },
        {
          "PlasmaArcCeiling",
          {bAbortCombo = true}
        }
      },
      {
        "PlasmaArcCeiling2Wall_CeilingDisappear",
        {
          fProbability = 1,
          fTime = 9,
          bCheckPowerBomb = true
        },
        {
          "PlasmaArcFloorSlow",
          {bAbortCombo = true}
        }
      },
      {
        "ShakingJumpCeiling",
        {fProbability = 1}
      }
    }
  }
}
function Queen.CreateComboTree(_ARG_0_)
  if _ARG_0_ ~= nil then
    for _FORV_4_, _FORV_5_ in pairs(Queen.ComboTreeDef[1]) do
      Queen.AddChildCombo(_ARG_0_, 0, _FORV_4_, _FORV_5_[1], _FORV_5_[2], nil)
    end
    for _FORV_4_, _FORV_5_ in pairs(Queen.ComboTreeDef[2]) do
      Queen.AddChildCombo(_ARG_0_, 1, _FORV_4_, _FORV_5_[1], _FORV_5_[2], nil)
    end
    for _FORV_4_, _FORV_5_ in pairs(Queen.ComboTreeDef[3]) do
      Queen.AddChildCombo(_ARG_0_, 2, _FORV_4_, _FORV_5_[1], _FORV_5_[2], nil)
    end
  end
end
function Queen.AddChildCombo(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if #_ARG_4_ >= 2 then
    if _ARG_5_ == nil then
      if _ARG_0_:CreateCombo(_ARG_1_, _ARG_2_) ~= nil then
        for _FORV_11_, _FORV_12_ in pairs(_ARG_3_) do
          _ARG_0_:CreateCombo(_ARG_1_, _ARG_2_)[_FORV_11_] = _FORV_12_
        end
      end
    else
    end
    for _FORV_10_, _FORV_11_ in pairs(_ARG_4_[2]) do
      if type(_FORV_11_) == "table" then
        _ARG_0_:AddComboAttack(_ARG_1_, _ARG_2_, _ARG_4_[1], _ARG_5_)[_FORV_10_ .. "Min"] = _FORV_11_[1]
        _ARG_0_:AddComboAttack(_ARG_1_, _ARG_2_, _ARG_4_[1], _ARG_5_)[_FORV_10_ .. "Max"] = _FORV_11_[2]
      else
        _ARG_0_:AddComboAttack(_ARG_1_, _ARG_2_, _ARG_4_[1], _ARG_5_)[_FORV_10_] = _FORV_11_
      end
    end
    for _FORV_10_ = 3, #_ARG_4_ do
      Queen.AddChildCombo(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_[_FORV_10_], (_ARG_0_:AddComboAttack(_ARG_1_, _ARG_2_, _ARG_4_[1], _ARG_5_)))
    end
  end
end
function Queen.OnProjectileEntityCollision(_ARG_0_, _ARG_1_, _ARG_2_)
  Game.PlayPosSound("actors/queen/queen_greenballs_hit_0" .. math.random(2) .. ".wav", _ARG_0_, _ARG_1_, _ARG_2_, 1, 500, 1750, 1)
end
