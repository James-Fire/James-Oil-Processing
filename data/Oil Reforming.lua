--Reforming of Oil Products.
--Syngas

--Steam Reforming
data:extend({
	{
		type = "recipe",
		name = "adamo-carbon-syngas-from-methane",
		category = "james-oil-reforming",
		enabled = false,
		energy_required = 2.5,
		ingredients = {
			{
				type="fluid",
				name="steam",
				amount=20
			},
			{
				type="fluid",
				name="adamo-carbon-methane",
				amount=50
			},
		},
		results = {
			{
				type="fluid",
				name="hydrogen",
				amount=75
			},
			{
				type="item",
				name="carbon",
				amount=1
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
				icon = "__James-Oil-Processing__/graphics/icons/methane.png",
				icon_size = 32,
				scale = 12 / 16,
				shift = {-4, -6},
			},
			{
				icon = "__James-Oil-Processing__/graphics/icons/hydrogen.png",
				icon_size = 64,
				scale = 5 / 16,
				shift = {0, 7},
			},
		},
		crafting_machine_tint = {
			primary = {r=255,g=120, b=110},
			secondary = {r=127,g=127,b=127},
			tertiary = {r=204,g=204,b=204},
			quaternary = {},
		},
		subgroup = "oil-cc-reforming",
		order = "aaa",
		always_show_made_in = true,
	},
	{
        type = "recipe",
        name = "VPE-dehydrogenation-petroleum-gas",
        category = "james-oil-reforming",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="petroleum-gas", amount=100},
            
        },
        results = {
			{type="fluid", name="VPE-olefines", amount=70},
            {type="fluid", name="hydrogen", amount=30},
	    
        },
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/Recipe-Backing.png",
				icon_size = 64,
			},
			{
				icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
				icon_size = 64,
				scale = 6 / 16,
				shift = {0, -6},
			},
			{
				icon = "__James-Oil-Processing__/graphics/icons/hydrogen.png",
				icon_size = 64,
				scale = 5 / 16,
				shift = {9, 7},
			},
			{
				icon = "__James-Oil-Processing__/graphics/olefines.png",
				icon_size = 32,
				scale = 10 / 16,
				shift = {-9, 7},
			},
		},
        subgroup = "oil-cc-reforming",
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
        name = "VPE-btx-process",
        category = "james-oil-reforming",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="VPE-pygas", amount=100},
            {type="fluid", name="steam", amount=100},
        },
        results = {
			{type="fluid", name="VPE-aromatics", amount=60},
			{type="fluid", name="VPE-olefines", amount=30},
	    
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
				icon = "__James-Oil-Processing__/graphics/pygas.png",
				icon_size = 32,
				scale = 12 / 16,
				shift = {-4, -6},
			},
			{
				icon = "__James-Oil-Processing__/graphics/aromatics.png",
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
        subgroup = "oil-cc-reforming",
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
        name = "VPE-catalytic-reforming-naphta",
        category = "james-oil-reforming",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="light-oil", amount=100},
        },
        results = {
			{type="fluid", name="VPE-reformate", amount=80},
			{type="fluid", name="hydrogen", amount=30},
            {type="fluid", name="petroleum-gas", amount=20},
        },
        icon = "__James-Oil-Processing__/graphics/reformate.png",
        icon_size = 32,
        subgroup = "oil-cc-reforming",
        order = "ddd",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
        type = "recipe",
        name = "VPE-extract-aromatics-from-reformate",
        category = "james-oil-reforming",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="VPE-reformate", amount=100},
    
        },
        results = {
	    {type="fluid", name="VPE-gasoline", amount=30},
            {type="fluid", name="VPE-aromatics", amount=70},
        },
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/Recipe-Backing.png",
				icon_size = 64,
			},
			{
				icon = "__James-Oil-Processing__/graphics/reformate.png",
				icon_size = 32,
				scale = 12 / 16,
				shift = {0, -6},
			},
			{
				icon = "__James-Oil-Processing__/graphics/gasoline.png",
				icon_size = 32,
				scale = 10 / 16,
				shift = {9, 7},
			},
			{
				icon = "__James-Oil-Processing__/graphics/aromatics.png",
				icon_size = 32,
				scale = 10 / 16,
				shift = {-9, 7},
			},
		},
        subgroup = "oil-cc-reforming",
        order = "eee",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
        type = "recipe",
        name = "VPE-convert-reformate-to-gasoline",
        category = "james-oil-reforming",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="VPE-reformate", amount=100},
    
        },
        results = {
 	   
	    {type="fluid", name="VPE-gasoline", amount=100},
       
        },
		main_product= "VPE-gasoline",
        subgroup = "oil-cc-reforming",
        order = "fff",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
})

--Syngas Reforming
data:extend({
	{
		type = "recipe",
		name = "adamo-carbon-syngas-from-fuel",
		category = "adamo-carbon-gasification",
		enabled = false,
		energy_required = 0.2,
		ingredients = {{ 
			type = "fluid",
			name = "water",
			amount = 5
		}},
		results = {{
			type = "fluid",
			name = "adamo-carbon-syngas",
			amount = 5
		}},
		subgroup = "oil-ed-syngas",
		order = "aaa",
	},
{
	type = "recipe",
	name = "adamo-carbon-heavy-oil-from-syngas",
	category = "james-oil-reforming",
	enabled = false,
	energy_required = 10,
	ingredients = {{
		type="fluid",
		name="water",
		amount=100,
	},{
		type="fluid",
		name="adamo-carbon-syngas",
		amount=500, --120MJ of input
	},},
	results = { --Results have 10% less fuel value than the syngas used to make them. The primary product gets 60%, the other 2 get 20% each
	{
		type="fluid",
		name="heavy-oil",
		amount=30 --64.8 MJ
	},
	{
		type="fluid",
		name="VPE-kerosene",
		amount=13, --24 MJ
	},
	{
		type="fluid",
		name="light-oil",
		amount=25 --24 MJ
	},
	},
	main_product= "heavy-oil",
	subgroup = "oil-ed-syngas",
	order = "fff",
},
{
	type = "recipe",
	name = "kerosene-from-syngas",
	category = "james-oil-reforming",
	enabled = false,
	energy_required = 10,
	ingredients = {{
		type="fluid",
		name="water",
		amount=100,
	},{
		type="fluid",
		name="adamo-carbon-syngas",
		amount=500, --120MJ of input
	},},
	results = { --Results have 10% less fuel value than the syngas used to make them. The primary product gets 60%, the other 2 get 20% each
		{
		type="fluid",
		name="heavy-oil",
		amount=11 --24 MJ
	},
	{
		type="fluid",
		name="VPE-kerosene",
		amount=36, --64.8 MJ
	},
	{
		type="fluid",
		name="light-oil",
		amount=25 --24 MJ
	},
	},
	main_product= "VPE-kerosene",
	subgroup = "oil-ed-syngas",
	order = "eee",
},
{
	type = "recipe",
	name = "adamo-carbon-light-oil-from-syngas",
	category = "james-oil-reforming",
	enabled = false,
	energy_required = 10,
	ingredients = {{
		type="fluid",
		name="water",
		amount=100,
	},{
		type="fluid",
		name="adamo-carbon-syngas",
		amount=500, --120MJ of input
	},},
	results = { --Results have 10% less fuel value than the syngas used to make them. The primary product gets 60%, the other 2 get 20% each
		{
		type="fluid",
		name="VPE-kerosene",
		amount=13 --24 MJ
	},{
		type="fluid",
		name="light-oil",
		amount=68 --64.8 MJ
	},{
		type="fluid",
		name="petroleum-gas",
		amount=40, --24 MJ
	}},
	main_product= "light-oil",
	subgroup = "oil-ed-syngas",
	order = "ccc",
},
{
	type = "recipe",
	name = "adamo-carbon-petroleum-gas-from-syngas",
	category = "james-oil-reforming",
	enabled = false,
	energy_required = 10,
	ingredients = {
		{
			type="fluid",
			name="water",
			amount=100,
		},
		{
			type="fluid",
			name="adamo-carbon-syngas",
			amount=500, --120MJ of input
		},
	},
	results = { --Results have 10% less fuel value than the syngas used to make them. The primary product gets 60%, the other 2 get 20% each
		{
			type="fluid",
			name="VPE-kerosene",
			amount=13, --24 MJ
		},
		{
			type="fluid",
			name="light-oil",
			amount=25, --24 MJ
		},
		{
			type="fluid",
			name="petroleum-gas",
			amount=108, --64.8 MJ
		}
	},
	main_product= "petroleum-gas",
	subgroup = "oil-ed-syngas",
	order = "bbb",
}


})

--Will it blend?
data:extend({
	{
        type = "recipe",
        name = "blend-naphta-and-pygas",
        category = "james-oil-reforming",
        enabled = false,
        energy_required = 4,
        ingredients = {
            {type="fluid", name="VPE-pygas", amount=30},
            {type="fluid", name="light-oil", amount=70},
    
        },
        results = {
 	   
	    {type="fluid", name="VPE-gasoline", amount=100},
       
        },
		main_product= "VPE-gasoline",
        subgroup = "oil-cc-reforming",
        order = "fff",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },

})