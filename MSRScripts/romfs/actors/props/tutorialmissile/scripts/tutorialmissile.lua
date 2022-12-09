TutorialMissile = {}
function TutorialMissile.main()
end
function TutorialMissile.OnEnter()
  utils.LOG(utils.LOGTYPE_LOGIC, "TutorialMissile.OnEnter()")
  oTutorial = Game.GetEntity("LE_TutorialMissile").TUTORIAL
  oTutorial:OnEnter()
end
function TutorialMissile.OnExit()
  utils.LOG(utils.LOGTYPE_LOGIC, "TutorialMissile.OnExit()")
  oTutorial = Game.GetEntity("LE_TutorialMissile").TUTORIAL
  oTutorial:OnExit()
end
