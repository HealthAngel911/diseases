local ITEM = Clockwork.item:New();
ITEM.name = "Ibuprofen";
ITEM.uniqueID = "ibuprofen";
ITEM.cost = 25;
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
ITEM.weight = 0.1;
ITEM.access = "1v";
ITEM.useText = "Swallow";
ITEM.category = "Medical";
ITEM.business = true;
ITEM.description = "A jar of ibuprofen pills.";
ITEM.customFunctions = {"Give"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if player:GetCharacterData("diseases") == "cold" then
		player:SetCharacterData( "diseases", "none" );
	end
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Give") then
			local lookingPly = player:GetEyeTrace().Entity
			if lookingPly:IsPlayer() then
				if lookingPly:GetCharacterData("diseases") == "cold" then
					lookingPly:SetCharacterData( "diseases", "none" );
					Clockwork.player:Notify(player, "You gave some Ibuprofen to the person.");
					player:TakeItem(player:FindItemByID("ibuprofen"));
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