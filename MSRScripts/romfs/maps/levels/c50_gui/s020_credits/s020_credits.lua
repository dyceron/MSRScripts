s020_credits = {
  fAngleMaxDefault = 12,
  fAngleMaxDefaultY = 5,
  fTimePerDiorama = 11.5,
  iNumRepeat = 1,
  fDefaultDistance = 3000
}
function s020_credits.main()
end
function s020_credits.AddCreditsDioramas()
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/planetarrival.bccam", s020_credits.fAngleMaxDefault, s020_credits.fAngleMaxDefaultY, s020_credits.fTimePerDiorama, "samusship1", {
    CharClass = "samusshipcredits",
    Path = "actors/characters/samusshipcredits/charclasses/samusshipcredits.bmsad",
    Action = "planetarrival"
  }, {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "planetarrival",
    Model = "Default",
    Weapon = "Beam",
    GunColorR = 1,
    GunColorG = 0.729,
    GunColorB = 0
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/grabsamusalpha.bccam", s020_credits.fAngleMaxDefault, s020_credits.fAngleMaxDefaultY, s020_credits.fTimePerDiorama, "alphasamus", {
    CharClass = "alphacredits",
    Path = "actors/characters/alphacredits/charclasses/alphacredits.bmsad",
    Action = "grabsamusalpha"
  }, {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "grabsamusalpha",
    Model = "Default",
    Weapon = "Beam",
    GunColorR = 0.356,
    GunColorG = 1,
    GunColorB = 1
  }, {
    CharClass = "creditsfx",
    Path = "actors/props/creditsfx/charclasses/creditsfx.bmsad",
    Model = "Alpha"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/introgamma.bccam", s020_credits.fAngleMaxDefault, s020_credits.fAngleMaxDefaultY, s020_credits.fTimePerDiorama, "deadalpha", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "diorama4",
    Model = "Varia",
    Weapon = "Beam",
    GunColorR = 1,
    GunColorG = 0.729,
    GunColorB = 0
  }, {
    CharClass = "alphacocooncredits",
    Path = "actors/characters/alphacocooncredits/charclasses/alphacocooncredits.bmsad",
    Action = "diorama4"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/grabsamusgamma.bccam", 16, 10, s020_credits.fTimePerDiorama, "agarregamma", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "grabsamusgamma",
    Model = "Varia",
    Weapon = "Beam",
    GunColorR = 0.356,
    GunColorG = 1,
    GunColorB = 1
  }, {
    CharClass = "gammacredits",
    Path = "actors/characters/gammacredits/charclasses/gammacredits.bmsad",
    Action = "grabsamusgamma"
  }, {
    CharClass = "creditsfx",
    Path = "actors/props/creditsfx/charclasses/creditsfx.bmsad",
    Model = "Gamma"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/grabsamuszeta.bccam", s020_credits.fAngleMaxDefault, s020_credits.fAngleMaxDefaultY, s020_credits.fTimePerDiorama, "zeta", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "diorama1",
    Model = "Varia",
    Weapon = "SuperMissile",
    GunColorR = 1,
    GunColorG = 0.2,
    GunColorB = 1
  }, {
    CharClass = "zetacredits",
    Path = "actors/characters/zetacredits/charclasses/zetacredits.bmsad",
    Action = "diorama1"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/variasuitcredits.bccam", 20, s020_credits.fAngleMaxDefaultY, s020_credits.fTimePerDiorama, "varia", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "variasuitcredits",
    Model = "Varia",
    Weapon = "Beam",
    GunColorR = 0,
    GunColorG = 1,
    GunColorB = 0
  }, {
    CharClass = "creditsfx",
    Path = "actors/props/creditsfx/charclasses/creditsfx.bmsad",
    Model = "Varia"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/intromanicminer.bccam", 5, 3, s020_credits.fTimePerDiorama, "queen", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "intromanicminer",
    Model = "Gravity",
    Weapon = "Beam",
    GunColorR = 0,
    GunColorG = 1,
    GunColorB = 0
  }, {
    CharClass = "manicminerbotcredits",
    Path = "actors/characters/manicminerbotcredits/charclasses/manicminerbotcredits.bmsad",
    Action = "intromanicminer"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/grabsamusomega.bccam", s020_credits.fAngleMaxDefault, 10, s020_credits.fTimePerDiorama, "omega", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "grabsamusomega",
    Model = "Gravity",
    Weapon = "Missile",
    GunColorR = 0,
    GunColorG = 1,
    GunColorB = 0
  }, {
    CharClass = "omegacredits",
    Path = "actors/characters/omegacredits/charclasses/omegacredits.bmsad",
    Action = "grabsamusomega",
    HideNodes = "C01_Ribs_Ch|C01_RibsB_Ch"
  }, {
    CharClass = "creditsfx",
    Path = "actors/props/creditsfx/charclasses/creditsfx.bmsad",
    Model = "Omega"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/intrometroid.bccam", 20, 15, s020_credits.fTimePerDiorama, "larva", {
    CharClass = "metroidcredits",
    Path = "actors/characters/metroidcredits/charclasses/metroidcredits.bmsad",
    Action = "intrometroid"
  }, {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "intrometroid",
    Model = "Gravity",
    Weapon = "Beam",
    GunColorR = 0,
    GunColorG = 1,
    GunColorB = 0
  }, {
    CharClass = "creditsfx",
    Path = "actors/props/creditsfx/charclasses/creditsfx.bmsad",
    Model = "Metroid"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/introqueen.bccam", 5, 5, s020_credits.fTimePerDiorama, "queen", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "diorama3",
    Model = "Gravity",
    Weapon = "Beam",
    GunColorR = 0,
    GunColorG = 1,
    GunColorB = 0
  }, {
    CharClass = "queencredits",
    Path = "actors/characters/queencredits/charclasses/queencredits.bmsad",
    Action = "diorama3"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/samusbaby.bccam", s020_credits.fAngleMaxDefault, s020_credits.fAngleMaxDefault, s020_credits.fTimePerDiorama, "queen", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "diorama2",
    Model = "Gravity",
    Weapon = "Beam",
    GunColorR = 0.356,
    GunColorG = 1,
    GunColorB = 1
  }, {
    CharClass = "babyhatchlingcredits",
    Path = "actors/characters/babyhatchlingcredits/charclasses/babyhatchlingcredits.bmsad",
    Action = "diorama2"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/ridley2credits.bccam", 3, 3, s020_credits.fTimePerDiorama, "queen", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "ridley2credits",
    Model = "Gravity",
    Weapon = "Beam",
    GunColorR = 0,
    GunColorG = 1,
    GunColorB = 0
  }, {
    CharClass = "babyhatchlingcredits",
    Path = "actors/characters/babyhatchlingcredits/charclasses/babyhatchlingcredits.bmsad",
    Action = "ridley2credits"
  }, {
    CharClass = "ridleycredits",
    Path = "actors/characters/ridleycredits/charclasses/ridleycredits.bmsad",
    Action = "ridley2credits"
  }, {
    CharClass = "creditsfx",
    Path = "actors/props/creditsfx/charclasses/creditsfx.bmsad",
    Model = "Ridley"
  })
  Game.AddCreditsDiorama("actors/characters/samuscredits/cameras/creditsdiorama.bccam", 0, 0, s020_credits.fTimePerDiorama, "varia", {
    CharClass = "samuscredits",
    Path = "actors/characters/samuscredits/charclasses/samuscredits.bmsad",
    Action = "creditsdiorama",
    Model = "Varia",
    Weapon = "Beam",
    GunColorR = 0.5,
    GunColorG = 0.6,
    GunColorB = 0.6
  })
end
function s020_credits.OnCreditsEnter()
end
function s020_credits.OnLoaded(_ARG_0_, _ARG_1_)
  s020_credits.AddCreditsDioramas()
end
function s020_credits.OnCreditsExit()
end
