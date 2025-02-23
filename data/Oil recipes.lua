--Gets the Fractionation and other physical processing recipes.

--Need to edit the vanilla basic and advanced oil processing
  
data:extend({
	{
        type = "recipe",
        name = "water-electroloysis",
        category = "chemistry",
        enabled = true,
        energy_required = 10,
        ingredients = {
            {type="fluid", name="water", amount=5},
            
        },
        results = {
            {type="fluid", name="hydrogen", amount=10},
	    
        },
         icon = "__James-Oil-Processing__/graphics/hydrogen.png",
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

	-- Fracking
	
  
})


--[[
	Methane
	Petroleum Gas Olefines Pygas Aromatics
	Naphtha Gasoline
	Kerosene
	Fuel Oil --Max Syngas
	Short Residue
	Long Residue
]]
--Crack Kerosene, Gasoline "VPE-steam-cracking-naphta" "VPE-steam-cracking-petroleum-gas" "VPE-hydrocracking-fuel-oil"

LSlib.recipe.editResult("VPE-steam-cracking-naphta", "VPE-olefines", "VPE-olefines", 6/7)
LSlib.recipe.editResult("VPE-steam-cracking-naphta", "petroleum-gas",  "petroleum-gas", 2)

LSlib.recipe.duplicate("VPE-steam-cracking-naphta", "VPE-steam-cracking-kerosene")
LSlib.recipe.editIngredient("VPE-steam-cracking-kerosene", "VPE-naphta", "VPE-kerosene", 1)
LSlib.recipe.editResult("VPE-steam-cracking-kerosene", "VPE-pygas", "VPE-gasoline", 1)
LSlib.recipe.editResult("VPE-steam-cracking-kerosene", "VPE-olefines", "VPE-naphta", 5/7)
LSlib.recipe.editResult("VPE-steam-cracking-kerosene", "petroleum-gas",  "petroleum-gas", 3)
LSlib.recipe.enable("VPE-steam-cracking-kerosene")

LSlib.recipe.duplicate("VPE-steam-cracking-naphta", "VPE-steam-cracking-gasoline")
LSlib.recipe.editIngredient("VPE-steam-cracking-gasoline", "VPE-naphta", "VPE-gasoline", 1)
LSlib.recipe.editResult("VPE-steam-cracking-gasoline", "VPE-olefines", "VPE-olefines", 0.5)
LSlib.recipe.editResult("VPE-steam-cracking-gasoline", "petroleum-gas",  "petroleum-gas", 5)
LSlib.recipe.enable("VPE-steam-cracking-gasoline")




if (mods["KS_Power"]) then
	LSlib.recipe.editResult("diesel-fuel", "diesel-fuel", "VPE-gasoline", 1)
	LSlib.recipe.editIngredient("diesel-fuel", "light-oil", "VPE-naphta", 1)
end