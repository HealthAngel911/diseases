/*
===================================================
================== CONFIGURATION ==================
===================================================
*/

local CONFIG_coughChance = 200 // Set the chance of getting a cough each 5-10 minutes. Default is 200, which means 1/200.
local CONFIG_fluChance = 600 // Set the chance of getting a flu each 5-10 minutes. Default is 600, which means 1/600.

local CONFIG_coughPerform = math.random(15,45) // This functoin finds a random value between your two values for when it'll display the next /me of the player who coughs. Default is (15,45). Number is in seconds.
local CONFIG_fluPerform = math.random(120,300) // This functoin finds a random value between your two values for when it'll display the next /me of the player who has flu. Default is (120,300). Number is in seconds.

/*
===================================================
============= DO NOT EDIT BELOW THIS ==============
===================================================
*/

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	if ( !data["diseases"] ) then
		data["diseases"] = "none";
	end;
end;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar( "diseases", player:GetCharacterData("diseases") );
end;

-- Called at an interval while a player is connected.

coughSounds = {
"ambient/voices/cough1.wav",
"ambient/voices/cough2.wav",
"ambient/voices/cough3.wav",
"ambient/voices/cough4.wav"
}

local nextTrigger = CurTime();
function PLUGIN:PlayerThink(player, curTime, infoTable)
	local faction = player:GetFaction();
	
	if ( player:Alive() ) then
		if !Schema:PlayerIsCombine(player) then
			if player:GetSharedVar("diseases") == "cough" then
			
				if !player.nextCough or CurTime() > player.nextCough then
					if !player:IsNoClipping() then
						player:EmitSound(table.Random(coughSounds), 100, 100);
						Clockwork.chatBox:AddInTargetRadius(player, "me", string.gsub("coughs.", "^.", string.lower), player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
						player.nextCough = CurTime() + CONFIG_coughPerform;
					end
				end;
			elseif player:GetSharedVar("diseases") == "flu" then
				if !player.nextFlu or CurTime() > player.nextFlu then
					if !player:IsNoClipping() then
						Clockwork.chatBox:AddInTargetRadius(player, "me", string.gsub("feels very dizzy and hot.", "^.", string.lower), player:GetPos(), Clockwork.config:Get("talk_radius"):Get());
						player.nextFlu = CurTime() + CONFIG_fluPerform;
					end
				end;
			else -- Give people randomly disease.
			
				if CurTime() > nextTrigger then
					for k, v in ipairs( _player.GetAll() ) do
						if math.random(1,CONFIG_coughChance) == 2 then
							player:SetCharacterData("diseases", "cough");
						end
						if math.random(1,CONFIG_fluChance) == 2 then
							player:SetCharacterData("diseases", "flu");
						end
					end
					nextTrigger = CurTime() + math.random(300,600);
				end
				
			end;
		end;
		
		-- This should effect all type of players.
		/*if player:GetSharedVar("diseases") == "slow_deathinjection" or player:GetSharedVar("diseases") == "fast_deathinjection" then
			if !player.nextInject or CurTime() > player.nextInject then
				if !player:IsNoClipping() then
					if player:GetGender() == GENDER_FEMALE then
						player:EmitSound("vo/npc/female01/pain0"..math.random(1, 9)..".wav", 30, 100 );
					else
						player:EmitSound("vo/npc/male01/pain0"..math.random(1, 9)..".wav", 30, 100 );
					end;
					
					if player:Health() >= 5 then
						player:SetHealth(player:Health() - 1)
					else
						Schema:PermaKillPlayer(player, player:GetRagdollEntity());
						Clockwork.player:Notify(player, "You're now PermaKilled caused by your toxins injected to your body...");
					end
					
					if player:GetSharedVar("diseases") == "fast_deathinjection" then
						player.nextInject = CurTime() + 0.5;
					else
						player.nextInject = CurTime() + math.random(4,6);
					end;
				end
			end;
		end;*/
		
		
	end;
end;