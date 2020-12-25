local PLUGIN = PLUGIN;

-- Called when the local player's motion blurs should be adjusted.
function PLUGIN:PlayerAdjustMotionBlurs(motionBlurs)
	if ( Clockwork.Client:HasInitialized() ) then
		local disease = Clockwork.Client:GetSharedVar("diseases");
		
		if (disease == "fever") then
			motionBlurs.blurTable["fever"] = 0.25;
		end;
	end;
end;