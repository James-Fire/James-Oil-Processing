--Treating Oil to remove impurities. Sulfur, mostly.


--Separation
if data.raw.fluid["bob-sour-gas"] then else
data:extend({
    {
      type = "recipe",
      name = "petroleum-gas-sweetening",
      category = "james-oil-treating",
      subgroup = "oil-dd-treating",
      order = "aaa",
      energy_required = 1,
      enabled = false,
      ingredients =
      {
        {type="fluid", name="sour-gas", amount=30}
      },
      results=
      {
        {type="fluid", name=Sulfide, amount=20},
        {type="fluid", name="petroleum-gas", amount=20},
      },
      main_product= "petroleum-gas",
      crafting_machine_tint =
      {
        primary = {r = 0.8, g = 0.2, b = 0.6},
        secondary = {r = 0.6, g = 0.2, b = 0.6},
        tertiary = {r = 0.7, g = 0.2, b = 0.6},
      }
    },
})
end

--Hydrotreating
data:extend({
	{
        type = "recipe",
        name = "VPE-hydrotreating-raw-naphta",
        category = "james-oil-treating",
        enabled = false,
        energy_required = 1,
        ingredients = {
            {type="fluid", name="VPE-naphta", amount=21},
            {type="fluid", name=Hydrogen, amount=8},
        },
        results = {
			{type="fluid", name="light-oil", amount=20},
			{type="fluid", name=Sulfide, amount=4},
        },
         icon = "__James-Oil-Processing__/graphics/naphta.png",
        icon_size = 32,
        subgroup = "oil-dd-treating",
        order = "bbb",
        crafting_machine_tint =
        {
          primary = {r = 0.198, g = 0.198, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
        type = "recipe",
        name = "VPE-hydrotreating-raw-kerosene",
        category = "james-oil-treating",
        enabled = false,
        energy_required = 1,
        ingredients = {
            {type="fluid", name="VPE-raw-kerosene", amount=21},
            {type="fluid", name=Hydrogen, amount=8},
        },
        results = {
			{type="fluid", name="VPE-kerosene", amount=20},
			{type="fluid", name=Sulfide, amount=4},
        },
         icon = "__James-Oil-Processing__/graphics/kerosene.png",
        icon_size = 32,
        subgroup = "oil-dd-treating",
        order = "ccc",
        crafting_machine_tint =
        {
          primary = {r = 0.198, g = 0.198, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
        type = "recipe",
        name = "VPE-hydrotreating-raw-fuel-oil",
        category = "james-oil-treating",
        enabled = false,
        energy_required = 1,
        ingredients = {
            {type="fluid", name="VPE-fuel-oil", amount=21},
            {type="fluid", name=Hydrogen, amount=8},
        },
        results = {
			{type="fluid", name="heavy-oil", amount=20},
			{type="fluid", name=Sulfide, amount=4},
        },
         icon = "__James-Oil-Processing__/graphics/fuel-oil.png",
        icon_size = 32,
        subgroup = "oil-dd-treating",
        order = "ddd",
        crafting_machine_tint =
        {
          primary = {r = 0.198, g = 0.198, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
})
