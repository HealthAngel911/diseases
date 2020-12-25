local DISEASE = Clockwork.disease:New("Xen Flu");
DISEASE.description = "A Xen Flu, highly infectious and fast-acting. Potentially dangerous.";
DISEASE.incubationTime = 2;
DISEASE.infectuous = true;
DISEASE.immuneFactions = {"Overwatch Transhuman Arm"};
DISEASE.transmissionType = "hybrid";
DISEASE.severity = 60;
DISEASE.lethality = 5;

function DISEASE:OnTemporaryEffect(player)
	player:EmitSound("ambient/voices/cough"..math.random(1, 4)..".wav");
end;

DISEASE:Register();