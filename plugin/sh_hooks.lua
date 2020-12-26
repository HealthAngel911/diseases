local PLUGIN = PLUGIN;

function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:String("diseases");
end;

-- God, I hope this doesn't break.
function Clockwork.disease:MakePlayerImmune(player, diseaseName)
	if !(self.stored[self:uniqueIDFormat(diseaseName)]) then return; end;

	if (player:IsValid() and player:HasInitialized()) then
		if (player:GetCharacterData("diseaseInfo")) then
			local diseaseInfo = player:GetCharacterData("diseaseInfo");
			local uniqueID = self:uniqueIDFormat(diseaseName);

			diseaseInfo.immunities[uniqueID] = true;

			player:SetCharacterData("diseaseInfo", diseaseInfo);
		end;
	end;
end;