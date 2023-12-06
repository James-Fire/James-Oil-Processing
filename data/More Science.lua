--Add More Science packs to my techs
LSlib.technology.addIngredient("gas-fracking", 1, "electric-power-science-pack")
LSlib.technology.addIngredient("gas-fracking", 1, "advanced-automation-science-pack")


--More Science adds a sulfur tech that isn't compatible with this oil overhaul. Remove it.
LSlib.technology.movePrerequisite("explosives", "sulfur", "sulfur-processing")
LSlib.technology.movePrerequisite("sulfur-processing", "sulfur", "oil-processing")
data.raw.technology["sulfur"] = nil