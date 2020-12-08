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
    player.die("neutral", player)
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

-- TRY WHAT'S THERE ALREADY, JUST USE THIS FOR REFERENCE IF SAVE/LOAD DOESN'T WORK. THIS IS PROBABLY BROKEN AND SHOULDN'T BE NEEDED IF DISCORD WAS RIGHT AND SOURCE ENTITY IS PERSISTENT THROUGH SAVE/LOAD
-- -- runs when a script is triggered
-- script.on_event(defines.events.on_script_trigger_effect, function(event)
--   -- checks if script is triggered by an enderpearl
--   if event.effect_id == "ender_pearl_effect_id" then
    
--     -- adds the ender pearl target position as a variable
--     local enderpearl_position = event.target_position
    
--     -- adds the player and source position as a variables, gets info from global storage in necessary
--     local player = {}
--     local player_position = {}
--     if event.source_entity then 
--       player = event.source_entity
--       player_posiiton = event.source_position
--     elseif global[enderpearl_position] then
--       player = game.get_player(global[enderpearl_position].player_index)
--       player_position = global[enderpearl_position].source_position
--     else
--       return
--     end
--     -- finds a non-colliding position within 2 tiles of target
--     local valid_position = find_valid_position(player, enderpearl_position)
--     if valid_position then
--       -- teleports player to ender pearl
--       player.teleport(valid_position)
--       run_damage_logic(player_position, valid_position, player)
--       if global[enderpearl_position] then
--         global[enderpearl_position] = nil
--       end
--     else
--       -- player.player.print("No safe landing nearby")
--       game.play_sound{
--         path = "ender-pearl-failed-landing", position = player_position, volume_modifier = 1}
--     end
--   else
--     return
--   end
-- end)

-- script.on_event(defines.events.on_player_used_capsule, function(event)
--   -- when player uses an ender pearl, save the info in global so things work right through save/load
--   if event.item.name == "enderpearl" then
--     local player_index = event.player_index
--     local item = event.item
--     local target_position = event.position
--     local source_position = game.get_player(player_index).position
--     global.target_position = {player_index, item, target_position, source_position}
--   end
-- end)

