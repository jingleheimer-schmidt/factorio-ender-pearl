
-- runs when a script is triggered
script.on_event(defines.events.on_script_trigger_effect, function(event)

  -- adds the ender pearl position as a variable (?)
  local enderpearl_position = event.target_position

  -- adds the player as a variable
  local player = event.source_entity

  -- finds a non-coolliding position within 2 tiles of target
  local valid_position = player.surface.find_non_colliding_position("character", enderpearl_position, 2, 1)

  -- subtracts 10 from player health and saves as variable
  local ouch = player.health-10

  -- checks if capsule is an enderpearl, then calls teleport function
  if event.effect_id == "ender_pearl_effect_id" then
    if valid_position then
      -- teleports player to ender pearl
      player.teleport(valid_position)
      -- if player health will be at or below zero then kill the entity
		  if ( ouch <= 0 ) then
			     player.die()
		  else
			-- otherwise subtract 10 from player health
			   player.health = ouch
		  end
    else
    player.player.print("Teleport failed: No valid locations nearby")
    end
  else
    return
  end

end)
