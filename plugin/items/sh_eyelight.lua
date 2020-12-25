--local ITEM = Clockwork.item:New();
--ITEM.name = "Eyelight";
--ITEM.cost = 50;
--ITEM.model = "models/lagmite/lagmite.mdl";
--ITEM.weight = 0.2;
--ITEM.access = "1v";
--ITEM.useText = "Apply";
--ITEM.category = "UU-Branded Medicaments";
--ITEM.business = true;
--ITEM.description = "A small flashlight you can check someones eyes with.";

-- Called when a player uses the item.
--function ITEM:OnUse(player, itemEntity)
--	local lookingPly = player:GetEyeTrace().Entity
	
--	if lookingPly:IsPlayer() then
--		if lookingPly:GetCharacterData("diseases") == "blindness" then
--			Clockwork.player:Notify(player, "The eyes of the person barely respond to the light.");
--		elseif lookingPly:GetCharacterData("diseases") == "colorblindness" then
--			Clockwork.player:Notify(player, "The eyes of the person seems not to respond to colored light.");
--		else
--			Clockwork.player:Notify(player, "The eyes of the person seems to respond to the light.");
--		end
--		return false;
--	else
--		Clockwork.player:Notify(player, "You must target a person!");
--		return false;
--	end;
--end;

-- Called when a player drops the item.
--function ITEM:OnDrop(player, position) end;

--ITEM:Register();