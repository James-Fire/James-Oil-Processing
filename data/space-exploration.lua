--Swap out my carbon for bz Black Carbon
data:extend({
	{
		type = "recipe",
		name = "basic-oil-processing",
		category = "james-oil-processing",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type="fluid", name="crude-oil", amount=50},
		},
		results=
		{
		  {type="fluid", name="VPE-long-residue", amount=5},
		  {type="fluid", name="VPE-fuel-oil", amount=15},
		  {type="fluid", name="VPE-raw-kerosene", amount=5},
		  {type="fluid", name="VPE-naphta", amount=20},
		  {type="fluid", name="sour-gas", amount=5},
		  
		},
		icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
		icon_size = 64,
		subgroup = "oil-aa-processing",
		order = "aba",
		main_product = ""
	},
})

LSlib.recipe.editIngredient("VPE-fractional-vacuum-rectification", "carbon", "carbon-black", 1)
LSlib.recipe.editIngredient("adamo-carbon-syngas-from-methane", "carbon", "carbon-black", 1)


