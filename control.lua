
-- runs when a script is triggered
script.on_event(defines.events.on_script_trigger_effect, function(event)

  -- adds the ender pearl position as a variable
  local enderpearl_position = event.target_position

  -- adds the player as a variable
  local player = event.source_entity

  -- adds player position as a variable
  local player_position = event.source_position

  -- finds a non-coolliding position within 2 tiles of target
  local valid_position = player.surface.find_non_colliding_position("character", enderpearl_position, 2, 1)

  -- calculates distance between player and ender peal target
  local distance = math.floor(((player_position.x - enderpearl_position.x) ^ 2 + (player_position.y - enderpearl_position.y) ^ 2) ^ 0.5)

  -- calculates a rancom variable between .91 and 1.09
  local almost = (math.random(91, 109))*.01

  -- subtracts ~88% of distance traveled from player health
  local ouch = player.health-distance*(.88*almost)

  -- checks if capsule is an enderpearl, then teleports player to pearl
  if event.effect_id == "ender_pearl_effect_id" then
    if valid_position then
      -- teleports player to ender pearl
      player.teleport(valid_position)
      -- if player health will be at or below zero then kill the them
		  if ( ouch <= 0 ) then
			     player.die()
      -- otherwise subtract ~88% of distance traveled from player health
      else
			   player.health = ouch
		  end
    else
      play_sound{
        path = "__factorio-ender-pearl__/sounds/enderpearl-failed.ogg", position = enderpearl_position, volume_modifier = 1}
      player.player.print("Teleport failed: No valid locations nearby")
    end
  else
    return
  end

end)
