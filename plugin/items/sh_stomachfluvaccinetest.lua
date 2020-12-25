local ITEM = Clockwork.item:New();
ITEM.name = "Stomach Flu Vaccine";
ITEM.description = "A syringe containing the vaccine against the Stomach Flu.";
ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
ITEM.business = true;
ITEM.weight = 0.1;
ITEM.access = "1v";
ITEM.category = "Medical";
ITEM.useText = "Inject";
ITEM.customFunctions = {"Give"};

function ITEM:OnUse(player, itemEntity)
	if (player.isInjecting) then
		Clockwork.player:Notify(player, "You are already injecting a vaccine into a character!");
	else
		local trace = player:GetEyeTraceNoCursor();
		if !(trace.Hit) then return; end;
		local entity = trace.Entity;
		local target = Clockwork.entity:GetPlayer(entity);

		if IsValid(target) then
			if (entity:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
				local injectTime = Schema:GetDexterityTime(player);
				Clockwork.player:SetAction(player, "injecting", injectTime);

				Clockwork.player:EntityConditionTimer(player, target, entity, injectTime, 192, function()
					local trace2 = player:GetEyeTraceNoCursor();
					if (!trace2.Entity) then return true; end;
					if (player:Alive() and !player:IsRagdolled() and trace2.Entity == entity) then
						return true;
					end;
				end, function(success)
					if (success) then
						if !(Clockwork.disease:IsPlayerImmune(entity, stomachflu)) then
							Clockwork.disease:MakePlayerImmune(entity, stomachflu);
							Clockwork.disease:CurePlayer(entity, stomachflu);
						end;
						
						player:TakeItem(self);
						player:ProgressAttribute(ATB_DEXTERITY, 20, true);
					end;
					
					player.isInjecting = nil;
					Clockwork.player:SetAction(player, "injecting", false);
				end);
			else
				if !(Clockwork.disease:IsPlayerImmune(player, stomachflu)) then
					Clockwork.disease:MakePlayerImmune(player, stomachflu);
					Clockwork.disease:CurePlayer(player, stomachflu);
				end;
				player:TakeItem(self);
			end;
		else
			if !(Clockwork.disease:IsPlayerImmune(player, stomachflu)) then
				Clockwork.disease:MakePlayerImmune(player, stomachflu);
				Clockwork.disease:CurePlayer(player, stomachflu);
			end;
			player:TakeItem(self);
		end
	end;
	return false;
end;

ITEM:Register()