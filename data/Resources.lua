local resource_autoplace = require("resource-autoplace")
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["VPE-tarsand"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["VPE-tarsand"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["adamo-carbon-natural-gas"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["adamo-carbon-natural-gas"] = {}
resource_autoplace.initialize_patch_set("VPE-tarsand", true)
resource_autoplace.initialize_patch_set("adamo-carbon-natural-gas", false)

data:extend({
	{
		type = "autoplace-control",
		name = "VPE-tarsand",
		richness = true,
		order = "b-e",
		category = "resource",
	},
	{
		type = "autoplace-control",
		name = "adamo-carbon-natural-gas",
		richness = true,
		order = "b-g",
		category = "resource",
	},
	{
		type = "resource",
		name = "VPE-tarsand",
		icon = "__James-Oil-Processing__/graphics/coal.png",
		icon_size = 32,
		flags = {"placeable-neutral"},
		order="a-b-e",
		tree_removal_probability = 0,
		tree_removal_max_distance = 62 * 62,
		minable =
		{
		  hardness = 0.8,
		  mining_particle = "stone-particle",
		  mining_time = 2,
		  results = {{type="item", name="VPE-tarsand", amount=1}},
		  fluid_amount = 20,
		  required_fluid = "steam"
		},
		collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
		autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "VPE-tarsand",
			order = "z",
			base_density = 1,
			base_spots_per_km2 = 400,
			candidate_spot_count = 100,
			frequency_multiplier = 120,
			has_starting_area_placement = true,
			size_multiplier = 300,
			starting_rq_factor = 50,
			regular_rq_factor = 50,
		},
			
		stage_counts = {2600, 1800, 1200, 800, 400, 320, 160, 80},
		stages =
		{
		  sheet =
		  {
			filename = "__James-Oil-Processing__/graphics/coal-tile.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			frame_count = 8,
			variation_count = 8,
			
		  }
		},
	   
		effect_animation_period = 5,
		effect_animation_period_deviation = 1,
		effect_darkness_multiplier = 3.6,
		min_effect_alpha = 0.2,
		max_effect_alpha = 0.3,
		map_color = {r=0.7, g=0.37, b=0.58}
	},
	{
		type = "resource",
		name = "adamo-carbon-natural-gas",
		icon = "__James-Oil-Processing__/graphics/icons/natural-gas.png",
		icon_size = 32,
		flags = {"placeable-neutral"},
		category = "adamo-carbon-gas",
		order="a-b-b",
		infinite = true,
		highlight = true,
		minimum = 150000,
		normal = 1000000,
		infinite_depletion_amount = 30,
		resource_patch_search_radius = 12,
		tree_removal_probability = 0.7,
		tree_removal_max_distance = 32 * 32,
		minable = {
			mining_time = 1,
			results = {
				{
					type = "fluid",
					name = "adamo-carbon-natural-gas",
					amount_min = 30,
					amount_max = 30,
					probability = 1
				}
			}
		},
		collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
		autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "adamo-carbon-natural-gas",
			order = "d",
			base_density = 10,
			base_spots_per_km2 = 2,
			random_probability = 1/42,
			random_spot_size_minimum = 1,
			random_spot_size_maximum = 1,
			additional_richness = 220000,
			has_starting_area_placement = false,
			regular_rq_factor_multiplier = 1,
		},
		stage_counts = {0},
		stages = {
			sheet = {
				filename =
					"__James-Oil-Processing__/graphics/entity/natural-gas.png",
				priority = "extra-high",
				width = 148,
				height = 120,
				frame_count = 4,
				variation_count = 1
		}},
		map_color = {r=1, g=80/255, b=80/255},
		map_grid = false
	},
})
