local DISEASE = Clockwork.disease:New("Stomach Flu");
DISEASE.description = "A stomach flu, may happen after eating something bad.";
DISEASE.incubationTime = 5;
DISEASE.infectuous = true;
DISEASE.immuneFactions = {"Overwatch Transhuman Arm"};
DISEASE.transmissionType = "hybrid";
DISEASE.severity = 40;
DISEASE.lethality = 0;

function DISEASE:OnTemporaryEffect(player)
	player:EmitSound("ambient/voices/cough"..math.random(1, 4)..".wav");
end;

DISEASE:Register();