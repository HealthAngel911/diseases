local DISEASE = Clockwork.disease:New("Xenian Infection");
DISEASE.description = "An infection from xenian origin, potentially dangerous..";
DISEASE.incubationTime = 5;
DISEASE.infectuous = true;
DISEASE.immuneFactions = {"Overwatch Transhuman Arm"};
DISEASE.severity = 80;
DISEASE.lethality = 20;

function DISEASE:OnTemporaryEffect(player)
	player:EmitSound("ambient/voices/cough"..math.random(1, 4)..".wav");
end;

DISEASE:Register();