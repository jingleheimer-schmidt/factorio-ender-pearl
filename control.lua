function on_player_used_capsule(player, ender-pearl)
  local position = ender-pearl.surface.find_non_colliding_position("character", ender-pearl.position, 128, 2)

  if position then
      player.print("Nice throw! Total distance: " .. distance(player.position, position))
      player.teleport(position, ender-pearl.surface)
  else
      player.print("Teleport failed: No valid locations nearby")
  end
end
