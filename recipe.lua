local enderPearlRecipe = {
    type = "recipe",
    name = "enderpearl-recipe",
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-b[remote]-a[enderpearl]",
    ingredients = {
        {"grenade",1},
        {"uranium-238",3},
        {"electronic-circuit",2}
    },
    energy_required = .5,
    result = "enderpearl",
    enabled = "false"
}

data:extend({
  enderPearlRecipe
})
