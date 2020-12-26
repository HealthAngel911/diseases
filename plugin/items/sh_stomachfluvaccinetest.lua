local ITEM = Clockwork.item:New();
ITEM.name = "Stomach Flu Vaccine";
ITEM.uniqueID = "stomachfluvaccine"
ITEM.cost = 25
ITEM.description = "A syringe containing the vaccine against the Stomach Flu.";
ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
ITEM.business = true;
ITEM.weight = 0.1;
ITEM.access = "1v";
ITEM.category = "Medical";
ITEM.useText = "Inject";
ITEM.customFunctions = {"Give"};

function ITEM:OnUse(player, itemEntity)
	Clockwork.disease:MakePlayerImmune(player, "stomachflu");
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Give") then
			local lookingPly = player:GetEyeTrace().Entity
			if lookingPly:IsPlayer() then
				Clockwork.disease:MakePlayerImmune(lookingPly, "stomachflu");
				player:TakeItem(player:FindItemByID("stomachfluvaccine"));
			else 
				Clockwork.player:Notify(player, "You must look at a person!")
				return false;
			end;
		end;
	end;
end;

ITEM:Register()