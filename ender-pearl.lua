local enderPearl = {
  -- type = "capsule",
  -- name = "ender-pearl",
  -- capsule_action = {
  --   type = "throw"},
  -- icon = "__factorio-ender-pearl__/graphics/Ender_Pearl_JE3_BE2.png",
  -- icon_size = 160,
  -- stack_size = 16


  type = "capsule",
  name = "enderpearl",
  icon = "__factorio-ender-pearl__/graphics/Ender_Pearl_JE3_BE2.png",
  icon_size = 160,
  capsule_action =
  {
    type = "throw",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "capsule",
      cooldown = 30,
      projectile_creation_distance = 0.6,
      range = 75,
      ammo_type =
      {
        category = "capsule",
        target_type = "position",
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "poison-capsule",
              starting_speed = 0.3
            }
          },
          -- {
          --   type = "direct",
          --   action_delivery =
          --   {
          --     type = "instant",
          --     target_effects =
          --     {
          --       {
          --         type = "play-sound",
          --         sound = sounds.throw_projectile,
          --       },
          --     }
          --   }
          -- }
        }
      }
    }
  },
  subgroup = "capsule",
  order = "b[poison-capsule]",
  stack_size = 16
}

data:extend({
  enderPearl
})
