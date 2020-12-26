local PLUGIN = PLUGIN;

-- Called when the local player's motion blurs should be adjusted.
function PLUGIN:PlayerAdjustMotionBlurs(motionBlurs)
	if ( Clockwork.Client:HasInitialized() ) then
		local disease = Clockwork.Client:GetSharedVar("diseases");
		
		if (disease == "flu") then
			motionBlurs.blurTable["flu"] = 0.25;
		end;
		if (disease == "colorblindness") then
			DrawTexturize( 1, Material( "pp/texturize/plain.png" ) )
		end
		if (disease == "slow_deathinjection" or disease == "fast_deathinjection") then
			motionBlurs.blurTable["injection"] = 0.1;
		end;
	end;
end;