require("__LSlib_James_Fork__/LSlib")



require("data/Oil Buildings")
require("data/Oil Processing")
require("data/Oil Cracking")
require("data/Oil Reforming")
require("data/Oil Treating")
require("data/Oil Products")
require("data/Resources")
require("data/Technology")
require("data/Items")
require("data/item-groups")


--Add my recipe categories to the appropriate things
for name, assembler in pairs(data.raw["assembling-machine"]) do
	local categories = assembler.crafting_categories or {}
	if LSlib.utils.table.hasValue(categories, "chemistry") and not LSlib.utils.table.hasValue(categories, "james-oil-treating") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-treating")
	end
	if LSlib.utils.table.hasValue(categories, "chemistry") and not LSlib.utils.table.hasValue(categories, "james-oil-reforming") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-reforming")
	end
	if LSlib.utils.table.hasValue(categories, "oil-processing") and not LSlib.utils.table.hasValue(categories, "james-oil-reforming") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-reforming")
	end
	if LSlib.utils.table.hasValue(categories, "oil-processing") and not LSlib.utils.table.hasValue(categories, "james-oil-cracking") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-cracking")
	end
end


--If Bob's is active, move recipes around.
if (mods["bobrevamp"]) then
	LSlib.recipe.setSubgroup("petroleum-gas-cracking", "oil-bb-cracking")
	LSlib.recipe.setSubgroup("petroleum-gas-sweetening", "oil-dd-treating")
end

--If Bob's is active, ensure his weird recipes don't get involved, maybe



