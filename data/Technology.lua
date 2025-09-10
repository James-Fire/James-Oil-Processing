
--Just adding stuff to existing techs
LSlib.technology.addRecipeUnlock("rocket-fuel", "VPE-rocketfuel-from-kerosene")
LSlib.technology.addRecipeUnlock("rocket-fuel", "VPE-rocketfuel-from-hydrogen")
LSlib.technology.removeRecipeUnlock("rocket-fuel", "rocket-fuel")

LSlib.technology.addPrerequisite("coal-liquefaction", "basic-syngas-processing")
LSlib.technology.addRecipeUnlock("coal-liquefaction", "adamo-carbon-light-oil-from-syngas")
LSlib.technology.addRecipeUnlock("coal-liquefaction", "kerosene-from-syngas")
LSlib.technology.removeRecipeUnlock("coal-liquefaction", "coal-liquefaction")

data.raw.technology["sulfur-processing"].effects = {
	{
		type = "unlock-recipe",
		recipe = "sulfuric-acid"
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-hydrotreating-raw-naphta",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-hydrotreating-raw-kerosene",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-hydrotreating-raw-fuel-oil",
	},
	{
		type = "unlock-recipe",
		recipe = "clean-lubricant",
	},
	{
		type = "unlock-recipe",
		recipe = "sulfur-separation",
	},
}
if data.raw.fluid["bob-sour-gas"] then 
	data.raw.technology["sulfur-processing"].effects = {
		{
			type = "unlock-recipe",
			recipe = "sulfuric-acid"
		},
		{
			type = "unlock-recipe",
			recipe = "VPE-hydrotreating-raw-naphta",
		},
		{
			type = "unlock-recipe",
			recipe = "VPE-hydrotreating-raw-kerosene",
		},
		{
			type = "unlock-recipe",
			recipe = "VPE-hydrotreating-raw-fuel-oil",
		},
		{
			type = "unlock-recipe",
			recipe = "clean-lubricant",
		},
		{
			type = "unlock-recipe",
			recipe = "sulfur-separation",
		},
	}
else
	data.raw.technology["sulfur-processing"].effects = {
		{
			type = "unlock-recipe",
			recipe = "sulfuric-acid"
		},
		{
			type = "unlock-recipe",
			recipe = "petroleum-gas-sweetening",
		},
		{
			type = "unlock-recipe",
			recipe = "VPE-hydrotreating-raw-naphta",
		},
		{
			type = "unlock-recipe",
			recipe = "VPE-hydrotreating-raw-kerosene",
		},
		{
			type = "unlock-recipe",
			recipe = "VPE-hydrotreating-raw-fuel-oil",
		},
		{
			type = "unlock-recipe",
			recipe = "clean-lubricant",
		},
		{
			type = "unlock-recipe",
			recipe = "sulfur-separation",
		},
	}
end
data.raw.technology["oil-processing"].effects = {
	{
		type = "unlock-recipe",
		recipe = "electric-fractionator-1"
	},
	{
		type = "unlock-recipe",
		recipe = "heat-fractionator-1"
	},
	{
		type = "unlock-recipe",
		recipe = "fluid-fractionator-1"
	},
	{
		type = "unlock-recipe",
		recipe = "burner-fractionator-1"
	},
	{
		type = "unlock-recipe",
		recipe = "oil-refinery"
	},
	{
		type = "unlock-recipe",
		recipe = "chemical-plant"
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-steam-cracking-petroleum-gas",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-dehydrogenation-petroleum-gas",
	},
	{
		type = "unlock-recipe",
		recipe = "adamo-carbon-petroleum-gas-cracking",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-fractional-vacuum-rectification", 
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-hydrocracking-fuel-oil",
	},
	{
		type = "unlock-recipe",
		recipe = "blend-naphta-and-pygas",
	},
	{
		type = "unlock-recipe",
		recipe = "adamo-carbon-syngas-from-methane"
	},
	{
		type = "unlock-recipe",
		recipe = "solid-fuel-from-gasoline"
	},
}
data.raw.technology["advanced-oil-processing"].effects = {
	{
		type = "unlock-recipe",
		recipe = "VPE-steam-cracking-naphta",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-catalytic-reforming-naphta", 
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-steam-cracking-kerosene",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-steam-reforming-kerosene",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-extract-aromatics-from-reformate", 
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-convert-reformate-to-gasoline",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-btx-process", 
	},
}

--Actual Techs
data:extend({
	{
		type = "technology",
		name = "natural-gas-processing",
		icon_size = 132,
		icon = "__James-Oil-Processing__/graphics/technology/gas-processing.png",
		prerequisites = {"fluid-handling"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "adamo-carbon-gas-wellhead-1"
			},
			{
				type = "unlock-recipe",
				recipe = "natural-gas-processing"
			},
		},
		unit = {
			count = 50,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30,
		},
		order = "d-a",
	},
	{
		type = "technology",
		name = "crude-oil-processing",
		icon = "__base__/graphics/technology/oil-gathering.png",
		icon_size = 256, icon_mipmaps = 4,
		prerequisites = {"fluid-handling"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "basic-oil-processing"
			},
			{
				type = "unlock-recipe",
				recipe = "pumpjack"
			},
		},
		unit = {
			count = 50,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30,
		},
		order = "d-a",
	},
	{
		type = "technology",
		name = "tar-sand-processing",
		icon_size = 256,
		icon = "__James-Oil-Processing__/graphics/technology/tar-sand-processing.png",
		prerequisites = {"fluid-handling"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "VPE-conditioning",
			},
			{
				type = "unlock-recipe",
				recipe = "VPE-primary-separation",
			},
			{
				type = "unlock-recipe",
				recipe = "VPE-secondary-separation",
			},
			{
				type = "unlock-recipe",
				recipe = "bitumen-fractionation",
			},
			{
				type = "mining-with-fluid",
				modifier = true
			}
		},
		unit = {
			count = 50,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30,
		},
		order = "d-a",
	},
	{
		type = "technology",
		name = "basic-syngas-processing",
		icon_size = 256,
		icon = "__James-Oil-Processing__/graphics/technology/syngas.png",
		prerequisites = {"oil-processing"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "adamo-carbon-gasifier"
			},
			{
				type = "unlock-recipe",
				recipe = "adamo-carbon-gasifier-fluid"
			},
			{
				type = "unlock-recipe",
				recipe = "adamo-carbon-syngas-from-fuel"
			},
			{
				type = "unlock-recipe",
				recipe = "adamo-carbon-petroleum-gas-from-syngas"
			},
			{
				type = "unlock-recipe",
				recipe = "adamo-carbon-heavy-oil-from-syngas"
			},

		},
		unit = {
			count = 150,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30
		},
		order = "d-d"
	},
  --[[{
    type = "technology",
    name = "gas-fracking",
    icon_size = 64,
    icon = "__James-Oil-Processing__/graphics/technology/fracking.png",
    prerequisites = {"production-science-pack", "advanced-oil-processing"},
    effects =
    {
	   {
        type = "unlock-recipe",
        recipe = "VPE-gas-fracking",
      },
    },
    unit =
    {
      count = 200,
      ingredients =
      {
        {type="item", name="automation-science-pack", amount=1},
        {type="item", name="logistic-science-pack", amount=1},
        {type="item", name="chemical-science-pack", amount=1},
		{type="item", name="production-science-pack", amount=1}
      },
      time = 30
    },
    order = "d-b"
  },]]
})