--Gets the Fractionation and other physical processing recipes.

--Vanilla recipe simple edits
LSlib.technology.removeRecipeUnlock("advanced-oil-processing", "advanced-oil-processing")


--Natural Gas
data:extend({
	{ --Gotta rework this to use fracking fluid
        type = "recipe",
        name = "VPE-gas-fracking",
        category = "james-oil-processing",
        hidden = true,
        enabled = false,
		auto_recycle = false,
        energy_required = 40,
		emissions_multiplier = 3.0,
        ingredients = {
            --{type="fluid", name="heavy-oil", amount=50},
            --{type="fluid", name="VPE-olefines", amount=25},
			--{type="item", name="sand", amount=30}, 
			--{type="item", name="sulfur", amount=5},
        },
        results = {
 	    	--{type="fluid", name="adamo-carbon-natural-gas", amount=400},
	    
        },
        icon = "__James-Oil-Processing__/graphics/petroleum-gas.png",
        icon_size = 32,
        subgroup = "oil-aa-processing",
        order = "hhh",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.500}, -- #7f7f7f00
          secondary = {r = 0.900, g = 0.100, b = 0.400, a = 0.400}, -- #66666600
          tertiary = {r = 0.605, g = 0.305, b = 0.305, a = 0.300}, -- #4d4d4d00
        }
    },
	{
		type = "recipe",
		name = "natural-gas-processing",
		category = "james-oil-processing",
		enabled = false,
		auto_recycle = false,
		icon = "__James-Oil-Processing__/graphics/icons/advanced-natural-gas-processing.png",
		icon_size = 32,
		subgroup = "oil-aa-processing",
		order = "aaa",
		energy_required = 1,
		emissions_multiplier = 0.5, -- sulfur removed
		ingredients = {
			{type="fluid", name="adamo-carbon-natural-gas", amount=50}
		},
		results= {
			{type="fluid", name="VPE-naphta", amount=2},
			{type="fluid", name="sour-gas", amount=5},
			{type="fluid", name="adamo-carbon-methane", amount=40},
			{type="fluid", name="hydrogen-sulfide", amount=20},
		},
	}
})

--Crude Oil
data:extend({
	{
		type = "recipe",
		name = "basic-oil-processing",
		category = "james-oil-processing",
		enabled = false,
		auto_recycle = false,
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
	{
        type = "recipe",
        name = "VPE-fractional-vacuum-rectification",
        category = "james-oil-processing",
        enabled = false,
		auto_recycle = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="VPE-long-residue", amount=60},
        },
        results = {
			{type="item", name="carbon", amount=1},
			{type="item", name="VPE-bitumen", amount=1},
            {type="fluid", name="VPE-fuel-oil", amount=40},
			{type="fluid", name="VPE-raw-kerosene", amount=10},
			{type="fluid", name="adamo-carbon-natural-gas", amount=20},
        },
        icon = "__James-Oil-Processing__/graphics/long-residue.png",
        icon_size = 32,
        subgroup = "oil-aa-processing",
        order = "ccc",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
})
--Tar Sand
data:extend({
	{
		type = "recipe",
		name = "VPE-conditioning",
		category = "james-oil-reforming",
		enabled = false,
		auto_recycle = false,
		energy_required = 12,
		ingredients =
		{
		  
		  {type="fluid", name="water", amount=200},
		  {type="item", name="VPE-tarsand", amount=30},
		},
		results=
		{
		  {type="fluid", name="VPE-tar-slurry", amount=300},
		  {type="item", name="stone", amount=5},
		  
		},
		icon_size = 32,
		subgroup = "oil-aa-processing",
		order = "ddd",
		main_product = "VPE-tar-slurry"
	},
	{
		type = "recipe",
		name = "VPE-primary-separation",
		category = "james-oil-reforming",
		enabled = false,
		auto_recycle = false,
		energy_required = 8,
		ingredients =
		{
		  {type="fluid", name="VPE-tar-slurry", amount=200},
		},
		results=
		{
		  {type="fluid", name="VPE-bitumen-froth", amount=160},
		  {type="fluid", name="water", amount=50},
		  {type="item", name="stone", amount=5},
		},
		icon_size = 32,
		subgroup = "oil-aa-processing",
		order = "eee",
		main_product = "VPE-bitumen-froth"
	},
	{
		type = "recipe",
		name = "VPE-secondary-separation",
		category = "james-oil-reforming",
		enabled = false,
		auto_recycle = false,
		energy_required = 6,
		ingredients =
		{
		  
		  {type="fluid", name="VPE-bitumen-froth", amount=120},
		  
		},
		results=
		{
		  {type="item", name="VPE-bitumen", amount=12},
		  {type="fluid", name="water", amount=50},
		  {type="item", name="stone", amount=5},
		  
		},
		icon_size = 32,
		subgroup = "oil-aa-processing",
		order = "fff",
		main_product = "VPE-bitumen"
	},
	{ --Might add a Bitumen with Crude fractionation
		type = "recipe",
		name = "bitumen-fractionation",
		category = "james-oil-processing",
		enabled = false,
		auto_recycle = false,
		energy_required = 3,
		ingredients =
		{
		  {type="item", name="VPE-bitumen", amount=2},
		},
		results=
		{
		  {type="fluid", name="VPE-long-residue", amount=5},
		  {type="fluid", name="VPE-fuel-oil", amount=10},
		  {type="fluid", name="VPE-raw-kerosene", amount=5},
		},
		--icon = "__James-Oil-Processing__/graphics/crude-oil.png",
		icon_size = 32,
		subgroup = "oil-aa-processing",
		order = "ggg",
		main_product = "VPE-fuel-oil"
	},
})