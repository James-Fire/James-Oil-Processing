--Gets all the cracking recipes.

--Steam Cracking
data:extend({
	{
        type = "recipe",
        name = "VPE-steam-cracking-kerosene",
        category = "james-oil-cracking",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="VPE-kerosene", amount=100},
            {type="fluid", name="steam", amount=100},
        },
        results = {
 	    {type="fluid", name="light-oil", amount=50},
	    {type="fluid", name="VPE-olefines", amount=40},
		{type="fluid", name="petroleum-gas", amount=20},
           
        },
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/Recipe-Backing.png",
				icon_size = 64,
			},
			{
				icon = "__base__/graphics/icons/fluid/steam.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {4, 0},
			},
			{
				icon = "__James-Oil-Processing__/graphics/kerosene.png",
				icon_size = 32,
				scale = 12 / 16,
				shift = {-4, 0},
			},
		},
        subgroup = "oil-bb-cracking",
        order = "cdc",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
        type = "recipe",
        name = "VPE-steam-cracking-naphta",
        category = "james-oil-cracking",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="light-oil", amount=100},
            {type="fluid", name="steam", amount=100},
        },
        results = {
 	    {type="fluid", name="VPE-olefines", amount=50},
	    {type="fluid", name="VPE-pygas", amount=40},
		{type="fluid", name="petroleum-gas", amount=10},
           
        },
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/Recipe-Backing.png",
				icon_size = 64,
			},
			{
				icon = "__base__/graphics/icons/fluid/steam.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {4, 0},
			},
			{
				icon = "__James-Oil-Processing__/graphics/naphta.png",
				icon_size = 32,
				scale = 12 / 16,
				shift = {-4, 0},
			},
		},
        subgroup = "oil-bb-cracking",
        order = "ccc",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
        type = "recipe",
        name = "VPE-steam-cracking-petroleum-gas",
        category = "james-oil-cracking",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="petroleum-gas", amount=100},
            {type="fluid", name="steam", amount=100},
        },
        results = {
			{type="fluid", name="VPE-olefines", amount=90},
            {type="fluid", name="VPE-pygas", amount=10},
	    
        },
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/Recipe-Backing.png",
				icon_size = 64,
			},
			{
				icon = "__base__/graphics/icons/fluid/steam.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {4, -5},
			},
			{
				icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {-4, -6},
			},
			{
				icon = "__James-Oil-Processing__/graphics/pygas.png",
				icon_size = 32,
				scale = 10 / 16,
				shift = {9, 7},
			},
			{
				icon = "__James-Oil-Processing__/graphics/olefines.png",
				icon_size = 32,
				scale = 10 / 16,
				shift = {-9, 7},
			},
		},
        subgroup = "oil-bb-cracking",
        order = "bbb",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
		type = "recipe",
		name = "adamo-carbon-petroleum-gas-cracking",
		category = "james-oil-cracking",
		enabled = false,
		energy_required = 1,
		ingredients = {
			{
				type="fluid",
				name="steam",
				amount=15
			},
			{
				type="fluid",
				name="petroleum-gas",
				amount=10
			}
		},
		results = {
			{
				type="fluid",
				name="adamo-carbon-methane",
				amount=50
			}
		},
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/Recipe-Backing.png",
				icon_size = 64,
			},
			{
				icon = "__base__/graphics/icons/fluid/steam.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {4, -5},
			},
			{
				icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {-4, -6},
			},
			{
				icon = "__James-Oil-Processing__/graphics/icons/methane.png",
				icon_size = 32,
				scale = 10 / 16,
				shift = {0, 7},
			},
		},
		subgroup = "oil-bb-cracking",
		order = "aaa",
		crafting_machine_tint = {
			primary = methane_base_color,
			secondary = data.raw.fluid["petroleum-gas"].base_color,
			tertiary = data.raw.fluid["petroleum-gas"].flow_color,
			quaternary = methane_flow_color,
		}
	}
})

--Hydrocracking
data:extend({
	{
        type = "recipe",
        name = "VPE-hydrocracking-fuel-oil",
        category = "james-oil-cracking",
        enabled = false,
        energy_required = 3,
        ingredients = {
            {type="fluid", name="heavy-oil", amount=25}, --54
            {type="fluid", name="hydrogen", amount=5},
			 
        },
        results = {
			{type="fluid", name="VPE-kerosene", amount=10}, --18
			{type="fluid", name="light-oil", amount=30}, --19.2
			{type="fluid", name="petroleum-gas", amount=20}, --12
	    
        },
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/Recipe-Backing.png",
				icon_size = 64,
			},
			{
				icon = "__James-Oil-Processing__/graphics/icons/hydrogen.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {4, 0},
			},
			{
				icon = "__James-Oil-Processing__/graphics/fuel-oil.png",
				icon_size = 32,
				scale = 12 / 16,
				shift = {-4, 0},
			},
		},
        subgroup = "oil-bb-cracking",
        order = "ddd",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
})