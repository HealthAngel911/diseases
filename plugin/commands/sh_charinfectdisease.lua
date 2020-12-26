-- Fucking A'. Had to go through all this bullshit JUST to check if the vaccines work or not. >:(
COMMAND = Clockwork.command:New("CharCheckImmunity");
COMMAND.tip = "Infect someone with a disease.";
COMMAND.text = "<string Name> <String Disease>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] );
    local diseaseName = arguments[2];
    
	if (target:IsValid()) then
		if (target:GetCharacterData("diseaseInfo")) then
			local immune = target:IsPlayerImmune(target, diseaseName);

            if (immune) then
            Clockwork.player:Notify(player, "Fuck You.")
            end;
		end;
	end;
end;

COMMAND:Register()