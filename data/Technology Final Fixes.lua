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


		