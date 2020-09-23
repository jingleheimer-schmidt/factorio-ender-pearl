
-- runs when a capsule is used
script.on_event(defines.events.on_player_used_capsule, function(event)

    -- adds the player as a variable
    local player = game.players[event.player_index]

    -- adds the ender pearl position as a variable (?)
    local enderpearl_position = event.position

    -- checks if capsule is an enderpearl, then calls teleport function
    if event.item == "enderpearl" then
        teleport_player_to_enderpearl(player, enderpearl_position)
    else
        return
    end
end)

function teleport_player_to_enderpearl(player, enderpearl_position)
  local position = enderpearl_position.surface.find_non_colliding_position("character", enderpearl_position.position, 128, 2)

  if position then
      player.print("Nice throw! Total distance: " .. distance(player.position, position))
      player.teleport(position, enderpearl.surface)
  else
      player.print("Teleport failed: No valid locations nearby")
  end
end

function distance(position_1, position_2)
    return math.floor(((position_1.x - position_2.x) ^ 2 + (position_1.y - position_2.y) ^ 2) ^ 0.5)
end
