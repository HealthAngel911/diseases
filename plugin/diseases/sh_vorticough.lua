local DISEASE = Clockwork.disease:New("Vorticough");
DISEASE.description = "A vorticough, worser than a regular cough since this one is more damaging to the patient's lungs.";
DISEASE.incubationTime = 5;
DISEASE.infectuous = true;
DISEASE.immuneFactions = {"Metropolice Force", "Overwatch Transhuman Arm"};
DISEASE.transmissionType = "hybrid";
DISEASE.severity = 60;
DISEASE.lethality = 20;

function DISEASE:OnTemporaryEffect(player)
	player:EmitSound("ambient/voices/cough"..math.random(1, 4)..".wav");
end;

DISEASE:Register();