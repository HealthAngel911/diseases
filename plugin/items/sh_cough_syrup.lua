local ITEM = Clockwork.item:New();
ITEM.name = "UU-Branded Cough Syrup";
ITEM.uniqueID = "cough_syrup";
ITEM.cost = 25;
ITEM.model = "models/props_junk/glassjug01.mdl";
ITEM.weight = 0.1;
ITEM.access = "1v";
ITEM.useText = "Drink";
ITEM.category = "Medical";
ITEM.business = true;
ITEM.description = "A glass jug filled with a brown slimy substance.";
ITEM.customFunctions = {"Give"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if player:GetCharacterData("diseases") == "cough" then
		player:SetCharacterData( "diseases", "none" );
	end
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Give") then
			local lookingPly = player:GetEyeTrace().Entity
			if lookingPly:IsPlayer() then
				if lookingPly:GetCharacterData("diseases") == "cough" then
					lookingPly:SetCharacterData( "diseases", "none" );
					Clockwork.player:Notify(player, "You gave some cough syrup to the person.");
					player:TakeItem(player:FindItemByID("cough_syrup"));
				end
			else
				Clockwork.player:Notify(player, "You must look at a person!");
				return false;
			end;
		end;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();