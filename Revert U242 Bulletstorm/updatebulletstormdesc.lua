Hooks:Add("LocalizationManagerPostInit", "hud", function(loc)
	LocalizationManager:add_localized_strings({
		menu_ammo_reservoir_beta_desc = "BASIC: ##$basic;##$NL;Ammo bags placed by you grant players the ability to shoot without depleting their ammunition for up to ##$multibasic;## seconds after interacting with it. The more ammo players replenish, the longer the duration of the effect.$NL;$NL;ACE: ##$pro;##$NL;Increases the base duration of the effect by up to ##$multipro2;## seconds (##60## on last use)."
	})
end)