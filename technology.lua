local enderPearlTechnology = {
  type = "technology",
  name = "enderpearl-technology",
  icon = "__factorio-ender-pearl__/graphics/Ender_Pearl_JE3_BE2_technology-icon.png",
  icon_size = 160,
  unit = {
    count = 150,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"military-science-pack", 1}
    },
    time = 30
  },
  prerequisites = {"uranium-processing", "military-2"},
  effects = {
    {
      type  = "unlock-recipe",
      recipe = "enderpearl-recipe"
    }
  }
}

data:extend({
  enderPearlTechnology
})
