local enderPearl = {
  type = "capsule",
  name = "enderpearl",
  icon = "__factorio-ender-pearl__/graphics/Ender_Pearl_JE3_BE2.png",
  subgroup = "transport",
  order = "b[personal-transport]-c[spidertron]-b[remote]-a[enderpearl]",
  icon_size = 160,
  capsule_action =
  {
    type = "throw",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "capsule",
      cooldown = 33,
      projectile_creation_distance = 0.6,
      -- min_range = 1,
      range = 50,
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
              {
                type = "projectile",
                projectile = "enderpearl-projectile",
                starting_speed = 0.3
              },
            }
          } --,
          -- {
          --   type = "direct",
          --   action_delivery =
          --   {
          --     type = "instant",
          --     target_effects =
          --     {
          --       {
          --         type = "play-sound",
          --         sound = "__factorio-ender-pearl__/sounds/enderpearl-launched.ogg"
          --       }
          --     }
          --   }
          -- }
        }
      }
    }
  },
  stack_size = 16
}

data:extend({
  enderPearl
})
