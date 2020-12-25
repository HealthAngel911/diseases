local ITEM = Clockwork.item:New();
ITEM.name = "UU Diagnostic Device";
ITEM.cost = 50;
ITEM.model = "models/props_lab/reciever01b.mdl";
ITEM.weight = 0.1;
ITEM.access = "1v";
ITEM.useText = "Apply";
ITEM.category = "Medical";
ITEM.business = true;
ITEM.description = "A device that detects diseases.";
ITEM.customFunctions = {"Give"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if player:GetCharacterData("diseases") == "flu" then
		Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Flu'.");
	elseif player:GetCharacterData("diseases") == "cold" then
		Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Cold'.");
	elseif player:GetCharacterData("diseases") == "cough" then
		Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Cough'.");
	elseif player:GetCharacterData("diseases") == "stomachflu" then
		Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Stomach Flu'.");
	elseif player:GetCharacterData("diseases") == "bacterialinfection" then
		Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Bacterial Infection'.");
	elseif player:GetCharacterData("diseases") == "vorticough" then
		Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Vorticough'.");
	elseif player:GetCharacterData("diseases") == "xenianinfection" then
		Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has an infection from Xenian origin'.");
	else
		Clockwork.player:Notify(player, "The device beeped twice, a small green light lights up. The screen states: 'The patient is free of any known disease'.");
	end
	return false;
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Give") then
		local lookingPly = player:GetEyeTrace().Entity
	
		if lookingPly:IsPlayer() then
			if lookingPly:GetCharacterData("diseases") == "flu" then
				Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Flu'.");
			elseif lookingPly:GetCharacterData("diseases") == "cold" then
				Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Cold'.");
			elseif lookingPly:GetCharacterData("diseases") == "cough" then
				Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Cough'.");
			elseif lookingPly:GetCharacterData("diseases") == "stomachflu" then
				Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Stomach Flu'.");
			elseif lookingPly:GetCharacterData("diseases") == "bacterialinfection" then
				Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Bacterial Infection'.");
			elseif lookingPly:GetCharacterData("diseases") == "vorticough" then
				Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has a Vorticough'.");
			elseif lookingPly:GetCharacterData("diseases") == "xenianinfection" then
				Clockwork.player:Notify(player, "The device beeped, a red light lights up. The screen states: 'The patient has an infection from Xenian origin'.");
			else
				Clockwork.player:Notify(player, "The device beeped twice, a small green light lights up. The screen states: 'The patient is free of any known disease'.");
			end
			return false;
		else
			Clockwork.player:Notify(player, "You must look at a person!");
			return false;
		end;
	end;
	end;
end

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();