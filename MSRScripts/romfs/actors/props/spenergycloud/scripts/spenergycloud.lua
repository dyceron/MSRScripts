Game.ImportLibraryWithName("actors/logic/trigger/scripts/trigger.lua", "Trigger")
SpecialEnergyCloud = {}
setmetatable(SpecialEnergyCloud, {__index = Trigger})
SpecialEnergyCloud.FirstRechargeTime = 5
SpecialEnergyCloud.RechargeTime = 5
function SpecialEnergyCloud.main()
end
function SpecialEnergyCloud.BeginPlay(_ARG_0_)
  _ARG_0_:PlayEntityLoop("props/bestowalstatue/hability_loop.wav", 0.3, 300, 1200, 1.5, false)
  if _ARG_0_.TRIGGER == nil or not _ARG_0_.TRIGGER.bEnabled or not Game.GetPlayer().ABILITY:IsAnyAbilityUnlocked() then
    SpecialEnergyCloud.DisableSpecialEnergy(_ARG_0_.sName)
  else
    SpecialEnergyCloud.EnableSpecialEnergy(_ARG_0_.sName)
  end
end
function SpecialEnergyCloud.ActivateSpecialEnergy(_ARG_0_)
  if Game.GetEntity(_ARG_0_) ~= nil then
    Game.GetEntity(_ARG_0_).TRIGGER:EnableTrigger()
    Game.GetEntity(_ARG_0_).TRIGGER.bCallEntityLuaCallback = false
    if Game.GetPlayer().ABILITY:IsAnyAbilityUnlocked() then
      Game.AddSF(SpecialEnergyCloud.FirstRechargeTime, "SpecialEnergyCloud.EnableSpecialEnergy", "s", _ARG_0_)
    end
  end
end
function SpecialEnergyCloud.EnableSpecialEnergy(_ARG_0_)
  if Game.GetEntity(_ARG_0_) ~= nil then
    if not Game.GetEntity(_ARG_0_).TRIGGER:IsPlayerInside() then
      Game.GetEntity(_ARG_0_).TRIGGER.bCallEntityLuaCallback = true
      Game.GetEntity(_ARG_0_).FX:SetEffectActive("generator", true, true)
      Game.GetEntity(_ARG_0_).FX:SetEffectActive("orb", true, true)
      Game.GetEntity(_ARG_0_).FX:SetEffectActive("leye", true, true)
      Game.GetEntity(_ARG_0_).FX:SetEffectActive("reye", true, true)
      Game.GetEntity(_ARG_0_):PlayEntityLoop("props/bestowalstatue/hability_loop.wav", 0.3, 300, 1200, 1.5, false)
    else
      Game.AddSF(0.1, "SpecialEnergyCloud.EnableSpecialEnergy", "s", _ARG_0_)
    end
  end
end
function SpecialEnergyCloud.DisableSpecialEnergy(_ARG_0_)
  if Game.GetEntity(_ARG_0_) ~= nil then
    Game.GetEntity(_ARG_0_).TRIGGER.bCallEntityLuaCallback = false
    Game.GetEntity(_ARG_0_).FX:SetEffectActive("orb", false, true)
    Game.GetEntity(_ARG_0_).FX:SetEffectActive("leye", false, true)
    Game.GetEntity(_ARG_0_).FX:SetEffectActive("reye", false, true)
    Game.GetEntity(_ARG_0_):StopEntityLoop("props/bestowalstatue/hability_loop.wav")
  end
end
function SpecialEnergyCloud.OnEnter(_ARG_0_)
  SpecialEnergyCloud.RechargeSpecialEnergy(_ARG_0_.sName)
end
function SpecialEnergyCloud.RechargeSpecialEnergy(_ARG_0_)
  if Game.GetPlayer() ~= nil then
    if Game.GetPlayer().SPECIALENERGY ~= nil then
      Game.GetPlayerInfo():FillSpecialEnergyReserveTank()
      Game.GetPlayer().SPECIALENERGY.fEnergy = Game.GetPlayer().SPECIALENERGY.fMaxEnergy
    end
    if Game.GetPlayer() ~= nil then
      Game.PlayEntitySound("props/bestowalstatue/energy_cloud_get.wav", Game.GetPlayer().sName, 0.5, 500, 2000, 1)
      Game.SetEntityFXEnabled(Game.GetPlayer().sName, "recoverspecialenergy", true, true, true)
      Game.UpdateLegendSpecialEnergyCloud()
    end
    if Game.GetEntity(_ARG_0_) ~= nil then
      SpecialEnergyCloud.DisableSpecialEnergy(_ARG_0_)
      Game.AddSF(SpecialEnergyCloud.RechargeTime, "SpecialEnergyCloud.EnableSpecialEnergy", "s", _ARG_0_)
    end
  end
end
