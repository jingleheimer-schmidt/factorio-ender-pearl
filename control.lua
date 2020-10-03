-- runs when a script is triggered
script.on_event(defines.events.on_script_trigger_effect, function(event)

  -- adds the ender pearl position as a variable
  local enderpearl_position = event.target_position

  -- adds the player as a variable
  local player = event.source_entity

  -- adds player position as a variable
  local player_position = event.source_position

  -- finds a non-colliding position within 2 tiles of target
  local valid_position = player.surface.find_non_colliding_position("character", enderpearl_position, 2, 1)

  -- calculates distance between player and ender peal target
  local distance = math.floor(((player_position.x - enderpearl_position.x) ^ 2 + (player_position.y - enderpearl_position.y) ^ 2) ^ 0.5)

  -- calculates a rancom variable between .91 and 1.09
  local almost = (math.random(91, 109))*.01

  -- saves health deduction
  local health_deduction = distance*(.88*almost)

  -- subtracts ~88% of distance traveled from player health
  local ouch = player.health-health_deduction

  -- checks if capsule is an enderpearl, then teleports player to pearl
  if event.effect_id == "ender_pearl_effect_id" then
    if valid_position then
      -- teleports player to ender pearl
      player.teleport(valid_position)
      -- if player health will be at or below zero then kill the them
		  if ( ouch <= 0 ) then
           game.play_sound{
             path = "fall-big", position = valid_position, volume_modifier = 1}
           player.die()
      -- otherwise subtract ~88% of distance traveled from player health
      else
			   player.health = ouch
         if ( health_deduction <= 16) then
           game.play_sound{
             path = "fall-small", position = valid_position, volume_modifier = 1}
         else
           game.play_sound{
             path = "fall-big", position = valid_position, volume_modifier = 1}
         end
		  end
    else
      -- player.player.print("No safe landing nearby")
      game.play_sound{
        path = "ender-pearl-failed-landing", position = player_position, volume_modifier = 1}
    end
  else
    return
  end

end)
