require("data/Oil Fuel Values")
require("data/Technology Final Fixes")
if (mods["dieselTrains"]) then
	require("data/Diesel Trains")
end
if (mods["MoreScience"]) then
	require("data/More Science")
end
if (mods["bzfoundry"]) then
	require("data/bzfoundry")
end
if (mods["space-exploration"]) then
	require("data/space-exploration")
end

if data.raw.item["sand"] then
	LSlib.recipe.editResult("VPE-primary-separation", "stone", "sand", 2)
	LSlib.recipe.editResult("VPE-secondary-separation", "stone", "sand", 2)
elseif data.raw.item["silica"] then
	LSlib.recipe.editResult("VPE-primary-separation", "stone", "silica", 2)
	LSlib.recipe.editResult("VPE-secondary-separation", "stone", "silica", 2)
end

if (mods["space-age"]) then
	LSlib.recipe.editResult("simple-coal-liquefaction", "heavy-oil", "VPE-fuel-oil", 1)
end

local JamesOilRecipeCategories = {
	["james-oil-processing"] = true,
	["james-oil-cracking"] = true,
	["james-oil-reforming"] = true,
	["james-oil-treating"] = true
}
local JamesOilProductivity = {}

local function CheckTableValue(Value,Table,SubTableIndex)
	for i, v in pairs(Table) do
		if type(v) == "table" then
			if Value == v[SubTableIndex] then
				return true
			end
		else
			if Value == v then
				return true
			end
		end
	end
	return false
end

--Add all recipes in my recipe categories to the productivity list
for name, recipe in pairs(data.raw.recipe) do
	if recipe.category and JamesOilRecipeCategories[recipe.category] then
		table.insert(JamesOilProductivity, recipe.name)
	end
end

--Add my recipes to the productivity whitelist
for km, vm in pairs(data.raw.module) do
	if vm.effect.productivity and vm.limitation then
		for _, recipe in ipairs(JamesOilProductivity) do
			table.insert(vm.limitation, recipe)
		end
	end
end

