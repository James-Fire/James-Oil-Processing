--Need a Fractionation Tower Building, input as power, solid and fluid burner, or heat. 5 fluid output, 1 input.
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
--local fracpoll = 
local fracpower = 500 --kw
local fracspeed = 1
local fraccraft = {"james-oil-processing"}

--Natural Gas Well
local natural_gas_wellhead_entity = table.deepcopy(data.raw["mining-drill"].pumpjack)
natural_gas_wellhead_entity.name = "adamo-carbon-gas-wellhead-1"
natural_gas_wellhead_entity.resource_categories = {"adamo-carbon-gas"}
natural_gas_wellhead_entity.energy_source.emissions_per_minute = { pollution = 6 }
natural_gas_wellhead_entity.energy_usage = "60kW"
natural_gas_wellhead_entity.icon_size = 32
natural_gas_wellhead_entity.icon = "__James-Oil-Processing__/graphics/icons/natural-gas-wellhead.png"
natural_gas_wellhead_entity.icon_mipmaps = nil
natural_gas_wellhead_entity.minable.result = "adamo-carbon-gas-wellhead-1"
natural_gas_wellhead_entity.resistances = {{
		type = "fire",
		percent = 70
}}
natural_gas_wellhead_entity.base_render_layer = "lower-object-above-shadow"
natural_gas_wellhead_entity.base_picture = {
      sheets =
      {
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
          priority = "extra-high",
          width = 131,
          height = 137,
          shift = util.by_pixel(-2.5, -4.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base.png",
            priority = "extra-high",
            width = 261,
            height = 273,
            shift = util.by_pixel(-2.25, -4.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 111,
          draw_as_shadow = true,
          shift = util.by_pixel(6, 0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base-shadow.png",
            width = 220,
            height = 220,
            scale = 0.5,
            draw_as_shadow = true,
            shift = util.by_pixel(6, 0.5)
          }
        }
      }
	}
natural_gas_wellhead_entity.animations = {
	frame_count = 1,
	filename = "__James-Oil-Processing__/graphics/blank.png",
	size = 32,
}

local natural_gas_wellhead_item = table.deepcopy(data.raw.item.pumpjack)
natural_gas_wellhead_item.name = "adamo-carbon-gas-wellhead-1"
natural_gas_wellhead_item.icon_size = 32
natural_gas_wellhead_item.icon = "__James-Oil-Processing__/graphics/icons/natural-gas-wellhead.png"
natural_gas_wellhead_item.order = "b[fluids]-b[adamo-carbon-gas-wellhead]"
natural_gas_wellhead_item.place_result = "adamo-carbon-gas-wellhead-1"
natural_gas_wellhead_item.stack_size = 50
data:extend({natural_gas_wellhead_entity, natural_gas_wellhead_item})

data:extend({
	{
		type = "recipe",
		name = "adamo-carbon-gas-wellhead-1",
		enabled = false,
		energy_required = 2,
		ingredients = {
			{type="item", name="electronic-circuit", amount=5},
			{type="item", name="iron-plate", amount=5},
			{type="item", name="pipe", amount=10},
			{type="item", name="steel-plate", amount=2},
			{type="item", name="pump", amount=1},
		},
		results = {{type="item", name="adamo-carbon-gas-wellhead-1", amount=1}}
	}
})


if settings.startup["higher-tier-gas-wellheads"].value then
	for i, Num in pairs({2,3,4,5}) do
		local natural_gas_wellhead_entity = table.deepcopy(data.raw["mining-drill"]["adamo-carbon-gas-wellhead-1"])
		natural_gas_wellhead_entity.minable.result = "adamo-carbon-gas-wellhead-"..tostring(Num)
		natural_gas_wellhead_entity.name = "adamo-carbon-gas-wellhead-"..tostring(Num)
		natural_gas_wellhead_entity.resource_categories = {"adamo-carbon-gas"}
		natural_gas_wellhead_entity.energy_usage = tostring(Num*60).."kW"
		natural_gas_wellhead_entity.mining_speed = data.raw["mining-drill"]["adamo-carbon-gas-wellhead-1"].mining_speed*Num
		natural_gas_wellhead_entity.module_slots = Num+1
		
		local natural_gas_wellhead_item = table.deepcopy(data.raw.item["adamo-carbon-gas-wellhead-1"])
		natural_gas_wellhead_item.name = "adamo-carbon-gas-wellhead-"..tostring(Num)
		natural_gas_wellhead_item.place_result = "adamo-carbon-gas-wellhead-"..tostring(Num)
		
		local natural_gas_wellhead_recipe = table.deepcopy(data.raw.recipe["adamo-carbon-gas-wellhead-1"])
		natural_gas_wellhead_recipe.name = "adamo-carbon-gas-wellhead-"..tostring(Num)
		data:extend({natural_gas_wellhead_entity,natural_gas_wellhead_item,natural_gas_wellhead_recipe})
		LSlib.recipe.addIngredient("adamo-carbon-gas-wellhead-"..tostring(Num), "adamo-carbon-gas-wellhead-"..tostring(Num-1), 1, "item")
		LSlib.recipe.editResult("adamo-carbon-gas-wellhead-"..tostring(Num), "adamo-carbon-gas-wellhead-1", "adamo-carbon-gas-wellhead-"..tostring(Num), 1)
		
		if Num == 3 then
			LSlib.recipe.editIngredient("adamo-carbon-gas-wellhead-"..tostring(Num), "electronic-circuit", "advanced-circuit", 1)
		elseif Num >= 4 then
			LSlib.recipe.editIngredient("adamo-carbon-gas-wellhead-"..tostring(Num), "electronic-circuit", "processing-unit", 1)
		end
	end
	data:extend({
		{
			type = "technology",
			name = "natural-gas-extraction-1",
			icon_size = 132,
			icon = "__James-Oil-Processing__/graphics/technology/gas-processing.png",
			prerequisites = {"natural-gas-processing"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "adamo-carbon-gas-wellhead-2"
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
			name = "natural-gas-extraction-2",
			icon_size = 132,
			icon = "__James-Oil-Processing__/graphics/technology/gas-processing.png",
			prerequisites = {"natural-gas-extraction-1"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "adamo-carbon-gas-wellhead-3"
				},
			},
			unit = {
				count = 50,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 30,
			},
			order = "d-a",
		},
		{
			type = "technology",
			name = "natural-gas-extraction-3",
			icon_size = 132,
			icon = "__James-Oil-Processing__/graphics/technology/gas-processing.png",
			prerequisites = {"natural-gas-extraction-2"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "adamo-carbon-gas-wellhead-4"
				},
			},
			unit = {
				count = 100,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 30,
			},
			order = "d-a",
		},
		{
			type = "technology",
			name = "natural-gas-extraction-4",
			icon_size = 132,
			icon = "__James-Oil-Processing__/graphics/technology/gas-processing.png",
			prerequisites = {"natural-gas-extraction-3"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "adamo-carbon-gas-wellhead-5"
				},
			},
			unit = {
				count = 100,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"production-science-pack", 1},
				},
				time = 30,
			},
			order = "d-a",
		},
	})
end

--Syngas Gasifier
data:extend({
	{
		type = "furnace",
		name = "adamo-carbon-gasifier",
		icon = "__James-Oil-Processing__/graphics/icons/gasifier.png",
		icon_size = 32,
		flags = {"placeable-neutral","player-creation"},
		minable = {
			mining_time = 1,
			result = "adamo-carbon-gasifier"
		},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		crafting_categories = {"adamo-carbon-gasification"},
		crafting_speed = 1,
		energy_usage = "12MW",
		energy_source = {
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 1,
			emissions_per_minute = { pollution = 1 },
			light_flicker = {
				minimum_intensity = 0.5,
				maximum_intensity = 1
			},
		},
		smoke = {{
				name = "adamo-carbon-gasifier-smoke",
				deviation = {0.1, 0.1},
				frequency = 15,
				north_position = {0.0, -4},
				south_position = {0.0, -4},
				east_position = {0.0, -4},
				west_position = {0.0, -4},
				starting_vertical_speed = 0.08,
				starting_frame_deviation = 60
		}},
		ingredient_count = 0,
		source_inventory_size = 0,
		result_inventory_size = 0,
		graphics_set =
		{
			animation = {
				filename =
					"__James-Oil-Processing__/graphics/entity/"
					.."gasifier.png",
				priority="high",
				width = 160,
				height = 160,
				frame_count = 1,
				shift = {1.5, -1.59375}
			},
			working_visualisations = {{
					animation = {
						filename =
							"__James-Oil-Processing__/graphics/entity/"
							.."gasifier-fumes.png",
						priority = "extra-high",
						frame_count = 29,
						width = 48,
						height = 105,
						shift = {-0.05, -5.65},
						animation_speed = 0.5,
						scale = 1.5,
						run_mode="backward"
					}
			}},
		},
		vehicle_impact_sound = {
		  filename = "__base__/sound/car-metal-impact.ogg",
		  volume = 0.65
		},
		working_sound = {
			sound = {
				filename = "__base__/sound/oil-refinery.ogg"
			},
			idle_sound = {
				filename = "__base__/sound/idle1.ogg", volume = 0.6
			},
			apparent_volume = 2,
		},
		fluid_boxes = {{
			production_type = "input",
			pipe_covers = pipecoverspictures(),
			volume = 1000,
			pipe_connections = {
				{flow_direction="input", direction = defines.direction.north, position = {0, -0.2} }
			}
		},
		{
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			volume = 1000,
			pipe_connections = { 
				{ flow_direction="output", direction = defines.direction.south, position = {0, 0.2} }
			}
		  }
		},
	},
	gasifier_smoke = {
		name = "adamo-carbon-gasifier-smoke",
		color = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
		duration = 150,
		spread_duration = 100,
		fade_away_duration = 100,
		start_scale = 0.4,
		end_scale = 1.5,
		affected_by_wind = true
	},
	{
		type = "item",
		name = "adamo-carbon-gasifier",
		icon = "__James-Oil-Processing__/graphics/icons/gasifier.png",
		icon_size = 32,
		subgroup = "smelting-machine",
		order = "d[adamo-carbon-gasifier]",
		place_result = "adamo-carbon-gasifier",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "adamo-carbon-gasifier",
		enabled = false,
		ingredients = {
			{type="item", name="stone-brick", amount=5},
			{type="item", name="pipe", amount=5},
			{type="item", name="pump", amount=2},
			{type="item", name="electronic-circuit", amount=2}
		},
		results = {{type="item", name="adamo-carbon-gasifier", amount=1}},
	},
	{
		type = "recipe",
		name = "adamo-carbon-gasifier-fluid",
		enabled = false,
		ingredients = {
			{type="item", name="stone-brick", amount=5},
			{type="item", name="pipe", amount=5},
			{type="item", name="pump", amount=2},
			{type="item", name="electronic-circuit", amount=2}
		},
		results = {{type="item", name="adamo-carbon-gasifier-fluid", amount=1}},
	}
})
local fluid_gasifier_item = table.deepcopy(data.raw.item["adamo-carbon-gasifier"])
fluid_gasifier_item.name = "adamo-carbon-gasifier-fluid"
fluid_gasifier_item.place_result = "adamo-carbon-gasifier-fluid"
local fluid_gasifier = table.deepcopy(data.raw["furnace"]["adamo-carbon-gasifier"])
fluid_gasifier.name = "adamo-carbon-gasifier-fluid"
fluid_gasifier.minable.result = "adamo-carbon-gasifier-fluid"
fluid_gasifier.energy_source = {
	type = "fluid",
	emissions_per_minute = { pollution = 1 },
	burns_fluid = true,
	scale_fluid_usage = true,
	fluid_box = {
		pipe_connections = {
			{
				flow_direction = "input-output",
				position = {-0.2,0},
				direction = defines.direction.west
			},
			{
				flow_direction = "input-output",
				position = {0.2,0},
				direction = defines.direction.east
			}
		},
		volume = 1000,
		pipe_covers = pipecoverspictures(),
		production_type = "input-output",
	},
}
data:extend({fluid_gasifier_item, fluid_gasifier})

--Fractionators
data:extend({
	{
		type = "item",
		name = "electric-fractionator-1",
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
				icon_size = 64,
			},
			{
				icon = "__core__/graphics/icons/tooltips/tooltip-category-electricity.png",
				icon_size = 32,
				scale = 1 / 2,
				shift = {-8, 0},
			},
		},
		icon_size = 64,
		subgroup = "production-machine",
		place_result = "electric-fractionator-1",
		order = "q",
		stack_size = 20
	},
	{
		type = "recipe",
		name = "electric-fractionator-1",
		enabled = false,
		energy_required = 3,
		ingredients = {
		  {type="item", name="steel-plate", amount=15},
		  {type="item", name="iron-gear-wheel", amount=10},
		  {type="item", name="stone-brick", amount=10},
		  {type="item", name="electronic-circuit", amount=10},
		  {type="item", name="pipe", amount=10}
		},
		results = {{type="item", name="electric-fractionator-1", amount=1}}
	},
	{
		type = "assembling-machine",
		name = "electric-fractionator-1",
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
				icon_size = 64,
			},
			{
				icon = "__core__/graphics/icons/tooltips/tooltip-category-electricity.png",
				icon_size = 32,
				scale = 1 / 2,
				shift = {-8, 0},
			},
		},
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 0.3, result = "electric-fractionator-1"},
		max_health = 300,
		corpse = "steam-turbine-remnants",
		dying_explosion = "steam-turbine-explosion",
		alert_icon_shift = util.by_pixel(0, -12),
		effectivity = 1,
		burns_fluid = false,
		crafting_categories = fraccraft,
		crafting_speed = fracspeed,
		source_inventory_size = 1,
		result_inventory_size = 5,
		resistances = {
			{
				type = "fire",
				percent = 70
			}
		},
		fast_replaceable_group = "fractionator",
		collision_box = {{-1.25, -2.35}, {1.25, 2.35}},
		selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
		damaged_trigger_effect = hit_effects.entity(),
		fluid_boxes =
		{
		  {
			production_type = "input",
			pipe_covers = pipecoverspictures(),
			pipe_picture = assembler2pipepictures(),
			volume = 1000,
			pipe_connections = {{ flow_direction="input", direction = defines.direction.west, position = {-1.15, 0} }}
		  },
		  {
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			pipe_picture = assembler2pipepictures(),
			volume = 1000,
			pipe_connections = {{ direction = defines.direction.east, position = {1.15, 2} }}
		  },
		  {
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			pipe_picture = assembler2pipepictures(),
			volume = 1000,
			pipe_connections = {{ direction = defines.direction.east, position = {1.15, 1} }}
		  },
		  {
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			pipe_picture = assembler2pipepictures(),
			volume = 1000,
			pipe_connections = {{ direction = defines.direction.east, position = {1.15, 0} }}
		  },
		  {
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			pipe_picture = assembler2pipepictures(),
			volume = 1000,
			pipe_connections = {{ direction = defines.direction.east, position = {1.15, -1} }}
		  },
		  {
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			pipe_picture = assembler2pipepictures(),
			volume = 1000,
			pipe_connections = {{ direction = defines.direction.east, position = {1.15, -2} }}
		  },
		},
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input"
		},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		module_specification = {
			module_slots = 2
		},
		energy_usage = tostring(fracpower).."kW",
		graphics_set =
		{
		animation =
		{
		  west = {
		  layers = {
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-H.png",
			  width = 160,
			  height = 123,
			  frame_count = 8,
			  line_length = 4,
			  shift = util.by_pixel(0, -2.5),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-H.png",
				width = 320,
				height = 245,
				frame_count = 8,
				line_length = 4,
				shift = util.by_pixel(0, -2.75),
				run_mode = "backward",
				scale = 0.5
			  }
			},
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-H-shadow.png",
			  width = 217,
			  height = 74,
			  repeat_count = 8,
			  frame_count = 1,
			  line_length = 1,
			  draw_as_shadow = true,
			  shift = util.by_pixel(28.75, 18),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-H-shadow.png",
				width = 435,
				height = 150,
				repeat_count = 8,
				frame_count = 1,
				line_length = 1,
				draw_as_shadow = true,
				shift = util.by_pixel(28.5, 18),
				run_mode = "backward",
				scale = 0.5
			  }
			}
		  }
		  },
		  east = {
		  layers = {
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-H.png",
			  width = 160,
			  height = 123,
			  frame_count = 8,
			  line_length = 4,
			  shift = util.by_pixel(0, -2.5),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-H.png",
				width = 320,
				height = 245,
				frame_count = 8,
				line_length = 4,
				shift = util.by_pixel(0, -2.75),
				run_mode = "backward",
				scale = 0.5
			  }
			},
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-H-shadow.png",
			  width = 217,
			  height = 74,
			  repeat_count = 8,
			  frame_count = 1,
			  line_length = 1,
			  draw_as_shadow = true,
			  shift = util.by_pixel(28.75, 18),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-H-shadow.png",
				width = 435,
				height = 150,
				repeat_count = 8,
				frame_count = 1,
				line_length = 1,
				draw_as_shadow = true,
				shift = util.by_pixel(28.5, 18),
				run_mode = "backward",
				scale = 0.5
			  }
			}
		  }
		  },
		  north =
		{
		 layers =
		 {
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-V.png",
			  width = 108,
			  height = 173,
			  frame_count = 8,
			  line_length = 4,
			  shift = util.by_pixel(5, 6.5),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-V.png",
				width = 217,
				height = 347,
				frame_count = 8,
				line_length = 4,
				shift = util.by_pixel(4.75, 6.75),
				run_mode = "backward",
				scale = 0.5
			  }
			},
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-V-shadow.png",
			  width = 151,
			  height = 131,
			  repeat_count = 8,
			  frame_count = 1,
			  line_length = 1,
			  draw_as_shadow = true,
			  shift = util.by_pixel(39.5, 24.5),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-V-shadow.png",
				width = 302,
				height = 260,
				repeat_count = 8,
				frame_count = 1,
				line_length = 1,
				draw_as_shadow = true,
				shift = util.by_pixel(39.5, 24.5),
				run_mode = "backward",
				scale = 0.5
			  }
			}
		  }
		},
		south =
		{
		 layers =
		 {
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-V.png",
			  width = 108,
			  height = 173,
			  frame_count = 8,
			  line_length = 4,
			  shift = util.by_pixel(5, 6.5),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-V.png",
				width = 217,
				height = 347,
				frame_count = 8,
				line_length = 4,
				shift = util.by_pixel(4.75, 6.75),
				run_mode = "backward",
				scale = 0.5
			  }
			},
			{
			  filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-V-shadow.png",
			  width = 151,
			  height = 131,
			  repeat_count = 8,
			  frame_count = 1,
			  line_length = 1,
			  draw_as_shadow = true,
			  shift = util.by_pixel(39.5, 24.5),
			  run_mode = "backward",
			  hr_version =
			  {
				filename = "__James-Oil-Processing__/graphics/entity/fractionator/hr-steam-turbine-V-shadow.png",
				width = 302,
				height = 260,
				repeat_count = 8,
				frame_count = 1,
				line_length = 1,
				draw_as_shadow = true,
				shift = util.by_pixel(39.5, 24.5),
				run_mode = "backward",
				scale = 0.5
			  }
			}
		  }
		},
		},
		},
		
		smoke =
		{
		  {
			name = "turbine-smoke",
			north_position = {0.0, -1.0},
			east_position = {0.75, -0.75},
			frequency = 10 / 32,
			starting_vertical_speed = 0.08,
			slow_down_factor = 1,
			starting_frame_deviation = 60
		  }
		},
		vehicle_impact_sound = sounds.generic_impact,
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,
		working_sound =
		{
		  sound =
		  {
			filename = "__base__/sound/steam-turbine.ogg",
			volume = 0.67
		  },
		  match_speed_to_activity = true,
		  audible_distance_modifier = 0.7,
		  max_sounds_per_type = 3,
		  fade_in_ticks = 4,
		  fade_out_ticks = 20
		},
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5,
		water_reflection =
		{
		  pictures =
		  {
			filename = "__James-Oil-Processing__/graphics/entity/fractionator/steam-turbine-reflection.png",
			priority = "extra-high",
			width = 40,
			height = 36,
			shift = util.by_pixel(0, 50),
			variation_count = 2,
			repeat_count = 2,
			scale = 5
		  },
		  rotate = false,
		  orientation_to_variation = true
		}
	},
})

local heat_fractionator = table.deepcopy(data.raw["assembling-machine"]["electric-fractionator-1"])
heat_fractionator.icons = {
	{
		icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
		icon_size = 64,
	},
	{
		icon = "__core__/graphics/icons/tooltips/tooltip-category-heat.png",
		icon_size = 32,
		scale = 1 / 2,
		shift = {-8, 0},
	},
}
heat_fractionator.name = "heat-fractionator-1"
heat_fractionator.minable.result = "heat-fractionator-1"
heat_fractionator.energy_source = {
	type = "heat",
	emissions_per_minute = { pollution = 0 },
	max_temperature = 500,
	specific_heat = "2MJ",
	max_transfer = "5GW",
	min_working_temperature = 200,
	connections = {
		{
		  position = {0,-2.25},
		  direction = defines.direction.north
		},
		{
		  position = {0,2.25},
		  direction = defines.direction.south
		},
	},
	pipe_covers =
        make_4way_animation_from_spritesheet(
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          width = 64,
          height = 64,
          direction_count = 4,
          scale = 0.5
        }),
      heat_pipe_covers =
        make_4way_animation_from_spritesheet(
        apply_heat_pipe_glow{
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          width = 64,
          height = 64,
          direction_count = 4,
          scale = 0.5
        }),
      heat_picture =
      {
        north = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
          priority = "extra-high",
          width = 44,
          height = 96,
          shift = util.by_pixel(-0.5, 8.5),
          scale = 0.5
        },
        east = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
          priority = "extra-high",
          width = 80,
          height = 80,
          shift = util.by_pixel(-21, -13),
          scale = 0.5
        },
        south = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
          priority = "extra-high",
          width = 28,
          height = 40,
          shift = util.by_pixel(-1, -30),
          scale = 0.5
        },
        west = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
          priority = "extra-high",
          width = 64,
          height = 76,
          shift = util.by_pixel(23, -13),
          scale = 0.5
        }
      },
}
	
local fluid_fractionator = table.deepcopy(data.raw["assembling-machine"]["electric-fractionator-1"])
fluid_fractionator.icons = {
	{
		icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
		icon_size = 64,
	},
	{
		icon = "__base__/graphics/icons/tooltips/tooltip-category-water.png",
		icon_size = 32,
		scale = 1 / 2,
		shift = {-8, 0},
	},
	{
		icon = "__base__/graphics/icons/tooltips/tooltip-category-chemical.png",
		icon_size = 32,
		scale = 1 / 2,
		shift = {0, 0},
	},
}
fluid_fractionator.name = "fluid-fractionator-1"
fluid_fractionator.minable.result = "fluid-fractionator-1"
fluid_fractionator.energy_source = {
	type = "fluid",
	emissions_per_minute = { pollution = 1 },
	burns_fluid = true,
	scale_fluid_usage = true,
	fluid_box = {
		pipe_connections = {
			{
				flow_direction = "input-output",
				position = {0,-2.25},
				direction = defines.direction.north, 
			},
			{
				flow_direction = "input-output",
				position = {0,2.25},
				direction = defines.direction.south, 
			}
		},
		volume = 2000,
		pipe_covers = pipecoverspictures(),
		pipe_picture = assembler2pipepictures(),
		production_type = "input-output",
	},
}
local burner_fractionator = table.deepcopy(data.raw["assembling-machine"]["electric-fractionator-1"])
burner_fractionator.icons = {
	{
		icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
		icon_size = 64,
	},
	{
		icon = "__base__/graphics/icons/tooltips/tooltip-category-chemical.png",
		icon_size = 32,
		scale = 1 / 2,
		shift = {-8, 0},
	},
}
burner_fractionator.name = "burner-fractionator-1"
burner_fractionator.minable.result = "burner-fractionator-1"
burner_fractionator.energy_source = {
	type = "burner",
	fuel_categories = { "chemical" },
	effectivity = 1,
	fuel_inventory_size = 1,
	emissions_per_minute = { pollution = 4 },
	smoke = {
		{
			name = "smoke",
			deviation = {0.1, 0.1},
			frequency = 4,
			position = {0.0, -0.5},
			starting_vertical_speed = 0.08,
			starting_frame_deviation = 60
		}
	}
}

data:extend({heat_fractionator,fluid_fractionator,burner_fractionator})

data:extend({
	{
		type = "item",
		name = "heat-fractionator-1",
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
				icon_size = 64,
			},
			{
				icon = "__core__/graphics/icons/tooltips/tooltip-category-heat.png",
				icon_size = 32,
				scale = 1 / 2,
				shift = {-8, 0},
			},
		},
		subgroup = "production-machine",
		place_result = "heat-fractionator-1",
		order = "q",
		stack_size = 20
	},
	{
		type = "recipe",
		name = "heat-fractionator-1",
		enabled = false,
		energy_required = 3,
		ingredients = {
		  {type="item", name="steel-plate", amount=15},
		  {type="item", name="iron-gear-wheel", amount=10},
		  {type="item", name="stone-brick", amount=10},
		  {type="item", name="electronic-circuit", amount=10},
		  {type="item", name="pipe", amount=10}
		},
		results = {{type="item", name="heat-fractionator-1", amount=1}}
	},
	{
		type = "item",
		name = "fluid-fractionator-1",
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
				icon_size = 64,
			},
			{
				icon = "__base__/graphics/icons/tooltips/tooltip-category-water.png",
				icon_size = 32,
				scale = 1 / 2,
				shift = {-8, 0},
			},
			{
				icon = "__base__/graphics/icons/tooltips/tooltip-category-chemical.png",
				icon_size = 32,
				scale = 1 / 2,
				shift = {0, 0},
			},
		},
		subgroup = "production-machine",
		place_result = "fluid-fractionator-1",
		order = "q",
		stack_size = 20
	},
	{
		type = "recipe",
		name = "fluid-fractionator-1",
		enabled = false,
		energy_required = 3,
		ingredients = {
		  {type="item", name="steel-plate", amount=15},
		  {type="item", name="iron-gear-wheel", amount=10},
		  {type="item", name="stone-brick", amount=10},
		  {type="item", name="electronic-circuit", amount=10},
		  {type="item", name="pipe", amount=10}
		},
		results = {{type="item", name="fluid-fractionator-1", amount=1}}
	},
	{
		type = "item",
		name = "burner-fractionator-1",
		icons = {
			{
				icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
				icon_size = 64,
			},
			{
				icon = "__base__/graphics/icons/tooltips/tooltip-category-chemical.png",
				icon_size = 32,
				scale = 1 / 2,
				shift = {-8, 0},
			},
		},
		subgroup = "production-machine",
		place_result = "burner-fractionator-1",
		order = "q",
		stack_size = 20
	},
	{
		type = "recipe",
		name = "burner-fractionator-1",
		enabled = false,
		energy_required = 3,
		ingredients = {
		  {type="item", name="steel-plate", amount=15},
		  {type="item", name="iron-gear-wheel", amount=10},
		  {type="item", name="stone-brick", amount=10},
		  {type="item", name="electronic-circuit", amount=10},
		  {type="item", name="pipe", amount=10}
		},
		results = {{type="item", name="burner-fractionator-1", amount=1}}
	},
})
local FracTable = { "electric-fractionator-1", "heat-fractionator-1", "fluid-fractionator-1", "burner-fractionator-1" }

if settings.startup["higher-tier-fractionators"].value then
	data:extend({
		{
			type = "technology",
			name = "advanced-fractionation-1",
			icons = {
				{
					icon = "__base__/graphics/technology/oil-gathering.png",
					icon_size = 256,
				},
				{
					icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
					scale = 2,
					icon_size = 64,
				},
			},
			prerequisites = {"oil-processing"},
			effects = {
			},
			unit = {
				count = 50,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 30,
			},
			order = "d-a",
		},
		{
			type = "technology",
			name = "advanced-fractionation-2",
			icons = {
				{
					icon = "__base__/graphics/technology/oil-gathering.png",
					icon_size = 256,
				},
				{
					icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
					scale = 2,
					icon_size = 64,
				},
			},
			prerequisites = {"advanced-fractionation-1"},
			effects = {
			},
			unit = {
				count = 50,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 30,
			},
			order = "d-a",
		},
		{
			type = "technology",
			name = "advanced-fractionation-3",
			icons = {
				{
					icon = "__base__/graphics/technology/oil-gathering.png",
					icon_size = 256,
				},
				{
					icon = "__James-Oil-Processing__/graphics/icons/fractionator.png",
					scale = 2,
					icon_size = 64,
				},
			},
			prerequisites = {"advanced-fractionation-2"},
			effects = {
			},
			unit = {
				count = 50,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"production-science-pack", 1},
				},
				time = 30,
			},
			order = "d-a",
		},
	})
	for h, Frac in pairs(FracTable) do
		for i, Num in pairs({2,3,4}) do
			local FracType = "electric"
			if Frac:find("electric", 1, true) then
				FracType = "electric"
			elseif Frac:find("burner", 1, true) then
				FracType = "burner"
			elseif Frac:find("fluid", 1, true) then
				FracType = "fluid"
			elseif Frac:find("heat", 1, true) then
				FracType = "heat"
			end
			
			local fractionator_entity = table.deepcopy(data.raw["assembling-machine"][Frac])
			fractionator_entity.name = FracType.."-fractionator-"..tostring(Num)
			fractionator_entity.minable.result = FracType.."-fractionator-"..tostring(Num)
			fractionator_entity.resource_categories = {"adamo-carbon-gas"}
			fractionator_entity.energy_usage = tostring(fracpower*Num).."kW"
			fractionator_entity.crafting_speed = data.raw["assembling-machine"][FracType.."-fractionator-"..tostring(Num-1)].crafting_speed*1.75
			fractionator_entity.module_specification.module_slots = Num+1

			local fractionator_item = table.deepcopy(data.raw.item[Frac])
			fractionator_item.name = FracType.."-fractionator-"..tostring(Num)
			fractionator_item.place_result = FracType.."-fractionator-"..tostring(Num)
			
			local fractionator_recipe = table.deepcopy(data.raw.recipe[Frac])
			fractionator_recipe.name = FracType.."-fractionator-"..tostring(Num)
			
			data:extend({fractionator_entity, fractionator_item, fractionator_recipe})
			if Num == 3 then
				LSlib.recipe.editIngredient(FracType.."-fractionator-"..tostring(Num), "electronic-circuit", "advanced-circuit", 1)
			elseif Num >= 4 then
				LSlib.recipe.editIngredient(FracType.."-fractionator-"..tostring(Num), "electronic-circuit", "processing-unit", 1)
			end
			LSlib.recipe.addIngredient(FracType.."-fractionator-"..tostring(Num), FracType.."-fractionator-"..tostring(Num-1), 1, "item")
			LSlib.recipe.editResult(FracType.."-fractionator-"..tostring(Num), FracType.."-fractionator-1", FracType.."-fractionator-"..tostring(Num), 1)
			LSlib.technology.addRecipeUnlock("advanced-fractionation-"..tostring(Num-1), FracType.."-fractionator-"..tostring(Num))
		end
	end
end