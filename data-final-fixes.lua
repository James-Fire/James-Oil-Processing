LSlib.technology.addRecipeUnlock("advanced-oil-processing", "sulfur-plastic-bar-from-aromatics")

--Fix fulgora oil
if mods["space-age"] then
    -- Patch the shallow oil ocean
    local fuel_oil_ocean_shallow = data.raw.tile["oil-ocean-shallow"]
    if fuel_oil_ocean_shallow then
        fuel_oil_ocean_shallow.fluid = "VPE-fuel-oil"
    end
    -- Patch the deep oil ocean
    local fuel_oil_ocean_deep = data.raw.tile["oil-ocean-deep"]
    if fuel_oil_ocean_deep then
        fuel_oil_ocean_deep.fluid = "VPE-fuel-oil"
    end
end

--Reapply my oil processing
if mods["aai-industry"] then
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
	})
end

--Add my recipe categories to the appropriate things
for name, assembler in pairs(data.raw["assembling-machine"]) do
	local categories = assembler.crafting_categories or {}
	if LSlib.utils.table.hasValue(categories, "chemistry") and not LSlib.utils.table.hasValue(categories, "james-oil-treating") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-treating")
		--log("Adding james-oil-treating to "..name)
	end
	if LSlib.utils.table.hasValue(categories, "chemistry") and not LSlib.utils.table.hasValue(categories, "james-oil-reforming") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-reforming")
		--log("Adding james-oil-reforming to "..name)
	end
	if LSlib.utils.table.hasValue(categories, "oil-processing") and not LSlib.utils.table.hasValue(categories, "james-oil-reforming") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-reforming")
		--log("Adding james-oil-reforming to "..name)
	end
	if LSlib.utils.table.hasValue(categories, "oil-processing") and not LSlib.utils.table.hasValue(categories, "james-oil-cracking") then
		LSlib.entity.addCraftingCategory("assembling-machine", name, "james-oil-cracking")
		--log("Adding james-oil-cracking to "..name)
	end
end


--If Bob's is active, move recipes around.
if (mods["bobrevamp"]) then
	LSlib.recipe.setSubgroup("petroleum-gas-cracking", "oil-bb-cracking")
	LSlib.recipe.setSubgroup("petroleum-gas-sweetening", "oil-dd-treating")
end

--If Bob's is active, ensure his weird recipes don't get involved, maybe