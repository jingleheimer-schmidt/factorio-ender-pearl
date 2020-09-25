
-- -- runs when a capsule is used (?)
-- script.on_event(defines.events.on_player_used_capsule, function(event)
--
--     -- -- adds the player as a global variable
--     -- player = game.players[event.player_index]
--     --
--     -- -- adds the ender pearl position as a global variable (?)
--     -- enderpearl_position = event.position
--     --
--     -- -- checks if capsule is an enderpearl, then calls teleport function
--     -- if event.item == "enderpearl" then
--     --     teleport_player_to_enderpearl(player, enderpearl_position)
--     -- else
--     --     player.print("oh no")
--     -- end
--     --
--     -- -- deletes player variable
--     -- player = nil
--     -- enderpearl_position = nil
--
-- end)

-- runs when a script is triggered, which is after the enderpearl throw
script.on_event(defines.events.on_script_trigger_effect, function(event)

  -- adds the ender pearl position as a variable (?)
  local enderpearl_position = event.target_position

  -- adds the player as a variable
  local player = event.source_entity

  -- -- adds player position as a variable (?)
  -- local player_position = event.source_position

  -- checks if capsule is an enderpearl, then calls teleport function
  if event.effect_id == "ender_pearl_effect_id" then
    player.print("Nice throw!")
    -- Total distance: " .. distance(player.position, valid_position))
    player.teleport(enderpearl_position)
  else
    player.print("Teleport failed: No valid locations nearby")
  end

end)

-- -- pretty sure this function will not work at all
-- function teleport_player_to_enderpearl(player_variable, enderpearl_position)
--   local valid_position = enderpearl_position.surface.find_non_colliding_position("character", enderpearl_position, 128, 2) -- hopefully this works???? it should return a non_colliding_position or nil (it doesn't work)
--
--   if valid_position then
--       player_who_threw_pearl.print("Nice throw!")
--       -- Total distance: " .. distance(player.position, valid_position))
--       player_who_threw_pearl.teleport(valid_position)
--   else
--       player_who_threw_pearl.print("Teleport failed: No valid locations nearby")
--   end
--   enderpearl_position = nil
--
-- end

-- pretty sure this function will not work at all
function teleport_player_to_enderpearl(player, enderpearl_position)
  -- local valid_position = enderpearl_position.surface.find_non_colliding_position("character", enderpearl_position, 128, 2) -- hopefully this works???? it should return a non_colliding_position or nil (it doesn't work)

  if enderpearl_position then
      player.print("Nice throw!")
      -- Total distance: " .. distance(player.position, valid_position))
      player.teleport(enderpearl_position)
  else
      player.print("Teleport failed: No valid locations nearby")
  end
  -- enderpearl_position = nil

end

-- function distance(position_1, position_2)
--     return math.floor(((position_1.x - position_2.x) ^ 2 + (position_1.y - position_2.y) ^ 2) ^ 0.5)
-- end
