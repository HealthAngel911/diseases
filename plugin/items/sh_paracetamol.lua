--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "UU-Branded Paracetamol";
ITEM.uniqueID = "paracetamol";
ITEM.cost = 25;
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
ITEM.weight = 0.2;
ITEM.access = "q";
ITEM.useText = "Swallow";
ITEM.category = "UU-Branded Medicaments";
ITEM.business = true;
ITEM.description = "A tin can with just enough pills to cure your fever.";
ITEM.customFunctions = {"Give"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if player:GetCharacterData("diseases") == "fever" then
		player:SetCharacterData( "diseases", "none" );
	end
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Give") then
			local lookingPly = player:GetEyeTrace().Entity
			if lookingPly:IsPlayer() then
				if lookingPly:GetCharacterData("diseases") == "fever" then
					lookingPly:SetCharacterData( "diseases", "none" );
					Clockwork.player:Notify(player, "You gave some paracetamol to the person.");
					player:TakeItem(player:FindItemByID("paracetamol"));
				end
			else
				Clockwork.player:Notify(player, "You must target a person!");
				return false;
			end;
		end;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();