TutorialAiming = {}
function TutorialAiming.main()
end
function TutorialAiming.OnEnter()
  utils.LOG(utils.LOGTYPE_LOGIC, "TutorialAiming.OnEnter()")
  oTutorial = Game.GetEntity("LE_TutorialAiming").TUTORIAL
  oTutorial:OnEnter()
end
function TutorialAiming.OnExit()
  utils.LOG(utils.LOGTYPE_LOGIC, "TutorialAiming.OnExit()")
  oTutorial = Game.GetEntity("LE_TutorialAiming").TUTORIAL
  oTutorial:OnExit()
end
