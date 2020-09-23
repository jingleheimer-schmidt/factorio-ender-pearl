function on_player_used_capsule(player, enderpearl)
  local position = enderpearl.surface.find_non_colliding_position("character", enderpearl.position, 128, 2)

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
