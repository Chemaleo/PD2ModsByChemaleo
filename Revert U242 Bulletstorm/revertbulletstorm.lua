function AmmoBagBase:take_ammo(unit)
	if self._empty then
		return false, false
	end

	local taken = self:_take_ammo(unit)

	if taken > 0 then
		unit:sound():play("pickup_ammo")
		managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", self._unit, taken)
	end

	if self._ammo_amount <= 0 then
		self:_set_empty()
	else
		self:_set_visual_stage()
	end

	local bullet_storm = false

	if self._bullet_storm_level and self._bullet_storm_level > 0 then
		bullet_storm = self._BULLET_STORM[self._bullet_storm_level] * taken
		
	end

	return taken > 0, bullet_storm
end

function AmmoBagBase:_take_ammo(unit)
	local taken = 0
	local inventory = unit:inventory()

	if inventory then
		for _, weapon in pairs(inventory:available_selections()) do
			local took = self:round_value(weapon.unit:base():add_ammo_from_bag(self._ammo_amount))
			taken = taken + took
			self._ammo_amount = self:round_value(self._ammo_amount - took)

			if self._ammo_amount <= 0 then
				taken = self._max_ammo_amount

				self:_set_empty()

				return taken
			end
		end
	end

	return taken
end