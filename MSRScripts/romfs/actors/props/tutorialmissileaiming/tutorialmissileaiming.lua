TutorialMissileAiming = {}
function TutorialMissileAiming.main()
end
function TutorialMissileAiming.OnEnter()
  utils.LOG(utils.LOGTYPE_LOGIC, "TutorialMissileAiming.OnEnter()")
  oTutorial = Game.GetEntity("LE_TutorialMissileAiming").TUTORIAL
  oTutorial:OnEnter()
end
function TutorialMissileAiming.OnExit()
  utils.LOG(utils.LOGTYPE_LOGIC, "TutorialMissileAiming.OnExit()")
  oTutorial = Game.GetEntity("LE_TutorialMissileAiming").TUTORIAL
  oTutorial:OnExit()
end
