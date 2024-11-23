--Defining of any oil product recipes. Lubricant, Plastic, Acid, Rocket Fuel, Solid Fuel
local JamesOilProductivity = {}

--Lubricant
LSlib.recipe.duplicate("lubricant", "clean-lubricant")
LSlib.recipe.editIngredient("lubricant", "heavy-oil", "VPE-fuel-oil", 1)
LSlib.recipe.addIngredient("clean-lubricant", "sulfur", 1, "item")


table.insert(JamesOilProductivity, "clean-lubricant")

--Plastic
data:extend({
	{
		type = "recipe",
		name = "plastic-bar",
		category = "chemistry",
		energy_required = 2,
		subgroup = "oil-ee-plastics",
		enabled = false,
		ingredients =
		{
		  {type="fluid", name="VPE-olefines", amount=60},
		 
		},
		results=
		{
		  {type="item", name="plastic-bar", amount=2}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.498, g = 0.498, b = 0.498, a = 0.000}, -- #7f7f7f00
		  secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
		  tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
		}
	},
})
LSlib.recipe.duplicate("plastic-bar", "sulfur-plastic-bar")
LSlib.recipe.editIngredient("sulfur-plastic-bar", "VPE-olefines", "VPE-olefines", 1/2)
LSlib.recipe.addIngredient("sulfur-plastic-bar", "sulfur", 2, "item")
LSlib.technology.addRecipeUnlock("plastics", "sulfur-plastic-bar")

LSlib.recipe.duplicate("plastic-bar", "plastic-bar-from-aromatics")
LSlib.recipe.editIngredient("plastic-bar-from-aromatics", "VPE-olefines", "VPE-aromatics", 4/3)
LSlib.technology.addRecipeUnlock("advanced-oil-processing", "plastic-bar-from-aromatics")

LSlib.recipe.duplicate("plastic-bar", "sulfur-plastic-bar-from-aromatics")
LSlib.recipe.editIngredient("sulfur-plastic-bar-from-aromatics", "VPE-olefines", "VPE-aromatics", 2/3)
LSlib.recipe.addIngredient("sulfur-plastic-bar-from-aromatics", "sulfur", 2, "item")
LSlib.technology.addRecipeUnlock("advanced-oil-processing", "sulfur-plastic-bar-from-aromatics")

LSlib.recipe.duplicate("plastic-bar", "plastic-bar-from-syngas")
LSlib.recipe.editIngredient("plastic-bar-from-syngas", "VPE-olefines", "adamo-carbon-syngas", 1)
LSlib.technology.addRecipeUnlock("coal-liquefaction", "plastic-bar-from-syngas")

LSlib.recipe.duplicate("plastic-bar-from-syngas", "sulfur-plastic-bar-from-syngas")
LSlib.recipe.editIngredient("sulfur-plastic-bar-from-syngas", "adamo-carbon-syngas", "adamo-carbon-syngas", 1/2)
LSlib.recipe.addIngredient("sulfur-plastic-bar-from-syngas", "sulfur", 2, "item")
LSlib.technology.addRecipeUnlock("coal-liquefaction", "sulfur-plastic-bar-from-syngas")


table.insert(JamesOilProductivity, "plastic-bar")
table.insert(JamesOilProductivity, "sulfur-plastic-bar")
table.insert(JamesOilProductivity, "plastic-bar-from-aromatics")
table.insert(JamesOilProductivity, "sulfur-plastic-bar-from-aromatics")
table.insert(JamesOilProductivity, "plastic-bar-from-syngas")
table.insert(JamesOilProductivity, "sulfur-plastic-bar-from-syngas")

--Conditional Plastic Recipes
if (mods["bobplates"]) then
	LSlib.recipe.duplicate("plastic-bar", "chlorine-plastic-bar")
	LSlib.recipe.addIngredient("chlorine-plastic-bar", "chlorine", 15, "fluid")
	LSlib.recipe.editIngredient("chlorine-plastic-bar", "VPE-olefines", "VPE-olefines", 1/2)
	LSlib.technology.addRecipeUnlock("plastics", "chlorine-plastic-bar")
	
	LSlib.recipe.duplicate("plastic-bar-from-aromatics", "chlorine-aromatics-plastic-bar")
	LSlib.recipe.addIngredient("chlorine-aromatics-plastic-bar", "chlorine", 15, "fluid")
	LSlib.recipe.editIngredient("chlorine-aromatics-plastic-bar", "VPE-aromatics", "VPE-aromatics", 1/2)
	LSlib.technology.addRecipeUnlock("advanced-oil-processing", "chlorine-aromatics-plastic-bar")
	
	LSlib.recipe.duplicate("plastic-bar-from-syngas", "chlorine-syngas-plastic-bar")
	LSlib.recipe.addIngredient("chlorine-syngas-plastic-bar", "chlorine", 10, "fluid")
	LSlib.recipe.editIngredient("chlorine-syngas-plastic-bar", "adamo-carbon-syngas", "adamo-carbon-syngas", 1/2)
	LSlib.technology.addRecipeUnlock("coal-liquefaction", "chlorine-syngas-plastic-bar")
	
	table.insert(JamesOilProductivity, "chlorine-plastic-bar")
	table.insert(JamesOilProductivity, "chlorine-aromatics-plastic-bar")
	table.insert(JamesOilProductivity, "chlorine-syngas-plastic-bar")
end

--Rocket Fuel
data:extend({
	{
        type = "recipe",
        name = "VPE-rocketfuel-from-kerosene",
        category = "chemistry",
        enabled = false,
        energy_required = 8,
        ingredients = {
            {type="fluid", name="VPE-kerosene", amount=120},
    
        },
        results = {
 	    {type="item", name="rocket-fuel", amount=2},
	    
        },
         icon = "__James-Oil-Processing__/graphics/rocket-fuel.png",
        icon_size = 32,
        subgroup = "fluid-recipes",
        order = "a[oil-processing]-b[coke]",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
	{
        type = "recipe",
        name = "VPE-rocketfuel-from-hydrogen",
        category = "chemistry",
        enabled = false,
        energy_required = 15,
        ingredients = {
            {type="fluid", name="hydrogen", amount=150},
    
        },
        results = {
			{type="item", name="rocket-fuel", amount=1},
	    
        },
         icon = "__James-Oil-Processing__/graphics/rocket-fuel.png",
        icon_size = 32,
        subgroup = "fluid-recipes",
        order = "a[oil-processing]-b[coke]",
        crafting_machine_tint =
        {
          primary = {r = 0.698, g = 0.698, b = 0.698, a = 0.000}, -- #7f7f7f00
          secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
          tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
        }
    },
})

local methane_rocket_fuel_recipe = table.deepcopy(data.raw.recipe["VPE-rocketfuel-from-hydrogen"])
methane_rocket_fuel_recipe.name = "methane-rocket-fuel"
data:extend({methane_rocket_fuel_recipe})
LSlib.recipe.editIngredient("methane-rocket-fuel", "hydrogen", "adamo-carbon-methane", 1/2)
LSlib.recipe.addIngredient("methane-rocket-fuel", "water", 100, "fluid")
LSlib.technology.addRecipeUnlock("rocket-fuel", "methane-rocket-fuel")


table.insert(JamesOilProductivity, "VPE-rocketfuel-from-kerosene")
table.insert(JamesOilProductivity, "VPE-rocketfuel-from-hydrogen")
table.insert(JamesOilProductivity, "methane-rocket-fuel")



--Acids

--Solid Fuel
data:extend({
	{
		type = "recipe",
		name = "adamo-carbon-solid-fuel-from-methane",
		category = "chemistry",
		energy_required = 2,
		ingredients = {{
				type = "fluid",
				name = "adamo-carbon-methane",
				amount = 50
		}},
		results = {{type="item", name="solid-fuel", amount=1}},
		icon = "__James-Oil-Processing__/graphics/icons/solid-fuel-from-methane.png",
		icon_size = 32,
		subgroup = "fluid-recipes",
		enabled = false,
		order = 
			"b[fluid-chemistry]-"
			.."d[adamo-carbon-solid-fuel-from-methane]",
		crafting_machine_tint = {
			primary = {r=40,g=40,b=40},
			secondary = {r=127,g=127,b=127},
			tertiary = {r=204,g=204,b=204},
			quaternary = {},
		}
	}
})

for km, vm in pairs(data.raw.module) do
	if vm.effect.productivity and vm.limitation then
		for _, recipe in ipairs(JamesOilProductivity) do
			table.insert(vm.limitation, recipe)
		end
	end
end