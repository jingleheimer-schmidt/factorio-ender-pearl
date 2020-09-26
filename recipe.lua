local enderPearlRecipe = {
    type = "recipe",
    name = "ender-pearl",
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-b[remote]-a[enderpearl]",
    ingredients = {
        {"grenade",1},
        {"uranium-238",3},
        {"electronic-circuit",2}
    },
    energy_required = .5,
    result = "enderpearl",
    enabled = "true"
}

data:extend({
  enderPearlRecipe
})
