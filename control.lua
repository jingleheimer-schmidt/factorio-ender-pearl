
-- runs when a script is triggered, which is after the enderpearl throw
script.on_event(defines.events.on_script_trigger_effect, function(event)

  -- adds the ender pearl position as a variable (?)
  local enderpearl_position = event.target_position

  -- adds the player as a variable
  local player = event.source_entity

  local valid_position = player.surface.find_non_colliding_position("character", enderpearl_position, 2, 1)

  -- checks if capsule is an enderpearl, then calls teleport function
  if event.effect_id == "ender_pearl_effect_id" then
    if valid_position then
      player.player.print("Nice throw!")
      player.teleport(valid_position)
    else
    player.player.print("Teleport failed: No valid locations nearby")
    end
  else
    return
  end

end)
