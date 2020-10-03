local enderpearlProjectile = {
    type = "projectile",
    name = "enderpearl-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        -- creates the projectile particles when enderpearl is thrown:
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              particle_name = "poison-capsule-metal-particle",
              repeat_count = 8,
              initial_height = 1,
              initial_vertical_speed = 0.1,
              initial_vertical_speed_deviation = 0.05,
              offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.01
            }
          }
        }
      },
      {
        -- runs the teleport script when projectile lands:
        type = "direct",
        action_delivery =
        {
          {
            type = "instant",
            target_effects = {
              type = "script",
              effect_id = "ender_pearl_effect_id"
              }
          }
        }
      }
      -- {
      --   -- runs the landed sound script when enderpearl lands:
      --   type = "direct",
      --   action_delivery =
      --   {
      --     {
      --       type = "instant",
      --       target_effects = {
      --         type = "script",
      --         effect_id = "ender_pearl_landed"
      --         }
      --     }
      --   }
      -- },
      -- {
      --   -- runs the failed sound script when enderpearl fails:
      --   type = "direct",
      --   action_delivery =
      --   {
      --     {
      --       type = "instant",
      --       target_effects = {
      --         type = "script",
      --         effect_id = "ender_pearl_failed"
      --         }
      --     }
      --   }
      -- }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__factorio-ender-pearl__/graphics/projectile/ender-pearl-capsule.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 29,
      height = 29,
      shift = util.by_pixel(1, 0.5),
      priority = "high",
      hr_version =
      {
        filename = "__factorio-ender-pearl__/graphics/projectile/hr-ender-pearl-capsule.png",
        frame_count = 16,
        line_length = 8,
        animation_speed = 0.250,
        width = 58,
        height = 59,
        shift = util.by_pixel(1, 0.5),
        priority = "high",
        scale = 0.5
      }

    },
    shadow =
    {
      filename = "__base__/graphics/entity/poison-capsule/poison-capsule-shadow.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 27,
      height = 21,
      shift = util.by_pixel(1, 2),
      priority = "high",
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/poison-capsule/hr-poison-capsule-shadow.png",
        frame_count = 16,
        line_length = 8,
        animation_speed = 0.250,
        width = 54,
        height = 42,
        shift = util.by_pixel(1, 2),
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5
      }
    },
    smoke =
    {
      {
        name = "poison-capsule-smoke",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed_deviation = 5
      }
    }
  }

data:extend({
  enderpearlProjectile
})
