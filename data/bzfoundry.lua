--Swap out my carbon for bz coke
local JamesOilRecipeCategories = {
	["james-oil-processing"] = true,
	["james-oil-cracking"] = true,
	["james-oil-reforming"] = true,
	["james-oil-treating"] = true
}
local JamesCarbonSwap = { }
for name, recipe in pairs(data.raw.recipe) do
	if recipe.category and JamesOilRecipeCategories[recipe.category] then
		table.insert(JamesCarbonSwap, recipe.name)
	end
end
for name, recipe in pairs(JamesCarbonSwap) do
	LSlib.recipe.editResult(recipe, "carbon", "coke", 1)
end


