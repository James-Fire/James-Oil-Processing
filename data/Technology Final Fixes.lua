LSlib.technology.addRecipeUnlock("sulfur-processing", "clean-lubricant")

data.raw.technology["advanced-oil-processing"].icon_size = 256 
data.raw.technology["advanced-oil-processing"].icon_mipmaps = 4
data.raw.technology["advanced-oil-processing"].icon = "__James-Oil-Processing__/graphics/technology/advanced-oil-processing.png"
data.raw.technology["advanced-oil-processing"].effects = {
	{
		type = "unlock-recipe",
		recipe = "VPE-steam-cracking-naphta",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-catalytic-reforming-naphta", 
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-steam-cracking-kerosene",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-extract-aromatics-from-reformate", 
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-convert-reformate-to-gasoline",
	},
	{
		type = "unlock-recipe",
		recipe = "VPE-btx-process", 
	},
	{
		type = "unlock-recipe",
		recipe = "plastic-bar-from-aromatics",
	},
}
if (mods["bobplates"]) then
	LSlib.technology.addRecipeUnlock("advanced-oil-processing", "chlorine-aromatics-plastic-bar")
end

--Sulfur
if not (mods["bobplates"]) then
	data:extend({
		{
			type = "recipe",
			name = "sulfur-separation",
			category = "chemistry",
			subgroup = "fluid-recipes",
			order = "f[sulfur]",
			energy_required = 1,
			enabled = false,
			main_product= "sulfur",
			ingredients = {
				{type = "fluid", name = "hydrogen-sulfide", amount = 20},
				{type="fluid", name="steam", amount=10},
			},
			results = {
				{type="item", name="sulfur", amount=2},
				{type="fluid", name="water", amount=15},
			},
			crafting_machine_tint = {
				primary = {r = 1.000, g = 0.659, b = 0.000},
				secondary = {r = 1.0, g = 0.000, b = 0.000},
				tertiary = {r = 0.960, g = 0.806, b = 0.000},
			},
			allow_decomposition = false
		},
	})
	LSlib.technology.addRecipeUnlock("sulfur-processing", "sulfur-separation")
end

for km, vm in pairs(data.raw.module) do
	if vm.effect.productivity and vm.limitation then
		table.insert(vm.limitation, "sulfur-separation")
	end
end