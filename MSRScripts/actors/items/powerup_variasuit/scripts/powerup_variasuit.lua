function PowerUpVariaSuit.main()
end
function PowerUpVariaSuit.OnPickedUp(_ARG_0_)
  Game.PlayEntitySoundContinueOnDead("generic/obtencion.wav", _ARG_0_.sName, 1, 500, 4000, 1)
  Game.TogglePause()
  Game.AddGUISF(0.5, Game.TogglePause, "")
  Game.AddGUISF(0.5, class.BindMethod(_ARG_0_, PowerUpVariaSuit.OnItemEnd), "")
  Game.AddGUISF(0.5, Game.LaunchCutscene, "s", "cutscenes/variasuit/takes/01/variasuit01.bmscu")
  Game.SetGameModeStartButtonForbidden("INGAME", true)
  Game.HUDIdleScreenGo()
end
function PowerUpVariaSuit.OnItemEnd(_ARG_0_)
  _ARG_0_.PICKABLE:OnItemEnd()
end
