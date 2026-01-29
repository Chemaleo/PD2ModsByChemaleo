Hooks:Add("LocalizationManagerPostInit", "hud", function(loc)
	if Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_ammo_reservoir_beta_desc = "БАЗОВЫЙ: ##$basic;##$NL;Сразу после установки и использования сумки с патронами, вы и ваша команда можете стрелять из своего оружия не расходуя боеприпасы в течение ##$multibasic;## секунд. Чем больше амуниции вы восстановите из сумки, тем дольше будет эффект непрерывной стрельбы.$NL;$NL;ПРО: ##$pro;##$NL;Вы можете стрелять на ##$multipro2;## (или ##60## при последнем использовании сумки с патронами) секунд дольше, не расходуя боеприпасы."
		})
	else
		LocalizationManager:add_localized_strings({
			menu_ammo_reservoir_beta_desc = "BASIC: ##$basic;##$NL;Ammo bags placed by you grant players the ability to shoot without depleting their ammunition for up to ##$multibasic;## seconds after interacting with it. The more ammo players replenish, the longer the duration of the effect.$NL;$NL;ACE: ##$pro;##$NL;Increases the base duration of the effect by up to ##$multipro2;## seconds (##60## on last use)."
		})
	end
end)