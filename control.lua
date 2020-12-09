
function find_valid_position(player, enderpearl_position)
  local valid_position = player.surface.find_non_colliding_position("character", enderpearl_position, 2, 1)
  return valid_position
end

function calculate_ouch(player_position, valid_position)
  local distance = math.floor(((player_position.x - valid_position.x) ^ 2 + (player_position.y - valid_position.y) ^ 2) ^ 0.5)
  local almost = (math.random(91, 109))*.01
  local ouch = distance*(.88*almost)
  return ouch
end

function run_damage_logic(player_position, valid_position, player)
  local ouch = calculate_ouch(player_position, valid_position)
  if ( (player.health - ouch) <= 0 ) then
    game.play_sound{
      path = "fall-big", position = valid_position, volume_modifier = 1}
    player.die("neutral", player)
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

script.on_event(defines.events.on_script_trigger_effect, function(event)
  if event.effect_id == "ender_pearl_effect_id" then
    if not event.source_entity then
      return
    end
    local enderpearl_position = event.target_position
    local player = event.source_entity
    local player_position = event.source_position
    local valid_position = find_valid_position(player, enderpearl_position)
    if valid_position then
      player.teleport(valid_position)
      run_damage_logic(player_position, valid_position, player)
    else
      game.play_sound{
        path = "ender-pearl-failed-landing", position = player_position, volume_modifier = 1}
    end
  else
    return
  end
end)
