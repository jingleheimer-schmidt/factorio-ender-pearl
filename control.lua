-- finds a non-colliding position within 2 tiles of target
function find_valid_position(player, enderpearl_position)
  -- check if player can fit within 2 tiles of ender pearl position
  local valid_position = player.surface.find_non_colliding_position("character", enderpearl_position, 2, 1)
  return valid_position
end

-- calculate ouch factor
function calculate_ouch(player_position, valid_position)
  -- calculates distance between player and valid_position
  local distance = math.floor(((player_position.x - valid_position.x) ^ 2 + (player_position.y - valid_position.y) ^ 2) ^ 0.5)
  -- calculates a random variable between .91 and 1.09
  local almost = (math.random(91, 109))*.01
  -- sets ouch as ~88% of distance traveled
  local ouch = distance*(.88*almost)
  return ouch
end

-- damage logic and sounds
function run_damage_logic(player_position, valid_position, player)
  -- calculate ouch factor
  local ouch = calculate_ouch(player_position, valid_position)
  -- if player health will be at or below zero then kill the them
  if ( (player.health - ouch) <= 0 ) then
    game.play_sound{
      path = "fall-big", position = valid_position, volume_modifier = 1}
    player.die()
  -- otherwise subtract ~88% of distance traveled from player health
  else
     player.health = player.health - ouch
     if ( ouch <= 16) then
       game.play_sound{
         path = "fall-small", position = valid_position, volume_modifier = 1}
     else
       game.play_sound{
         path = "fall-big", position = valid_position, volume_modifier = 1}
     end
  end
end

-- runs when a script is triggered
script.on_event(defines.events.on_script_trigger_effect, function(event)
  -- checks if script is triggered by an enderpearl
  if event.effect_id == "ender_pearl_effect_id" then
    -- adds the ender pearl target position as a variable
    local enderpearl_position = event.target_position
    -- adds the player as a variable
    local player = event.source_entity
    -- adds player position as a variable
    local player_position = event.source_position
    -- finds a non-colliding position within 2 tiles of target
    local valid_position = find_valid_position(player, enderpearl_position)
    if valid_position then
      -- teleports player to ender pearl
      player.teleport(valid_position)
      run_damage_logic(player_position, valid_position, player)
    else
      -- player.player.print("No safe landing nearby")
      game.play_sound{
        path = "ender-pearl-failed-landing", position = player_position, volume_modifier = 1}
    end
  else
    return
  end
end)
