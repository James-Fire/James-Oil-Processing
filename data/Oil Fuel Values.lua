
--Apply fuel values and pollution values to fluids
--Removing Sulfur reduces fuel value slighty, drastically reduces pollution value
--Higher chain fuels

--[[
	Methane
	Petroleum Gas Olefines Pygas Aromatics
	Naphtha Gasoline Reformate
	Kerosene
	Fuel Oil --Max Syngas
	Short Residue
	Long Residue
	Crude
	
		fuel_acceleration_multiplier = fluid.fuel_acceleration_multiplier,
		fuel_top_speed_multiplier = fluid.fuel_top_speed_multiplier
]]
local MethaneFuel = 120

data.raw.fluid["adamo-carbon-methane"].fuel_value = tostring(MethaneFuel).."kJ"
data.raw.fluid["adamo-carbon-methane"].emissions_multiplier = 0.5
data.raw.fluid["adamo-carbon-methane"].fuel_acceleration_multiplier = 2.5
data.raw.fluid["adamo-carbon-methane"].fuel_top_speed_multiplier = 1.2

data.raw.fluid["adamo-carbon-natural-gas"].fuel_value = tostring(MethaneFuel*3).."kJ"
data.raw.fluid["adamo-carbon-natural-gas"].emissions_multiplier = 1.5
data.raw.fluid["adamo-carbon-natural-gas"].fuel_acceleration_multiplier = 1.1
data.raw.fluid["adamo-carbon-natural-gas"].fuel_top_speed_multiplier = 1.1

data.raw.fluid["petroleum-gas"].fuel_value = tostring(MethaneFuel*5).."kJ"
data.raw.fluid["petroleum-gas"].emissions_multiplier = 0.8
data.raw.fluid["petroleum-gas"].fuel_acceleration_multiplier = 2.5
data.raw.fluid["petroleum-gas"].fuel_top_speed_multiplier = 1.1

data.raw.fluid["VPE-olefines"].fuel_value = tostring(MethaneFuel*5).."kJ"
data.raw.fluid["VPE-olefines"].emissions_multiplier = 1
data.raw.fluid["VPE-olefines"].fuel_acceleration_multiplier = 1
data.raw.fluid["VPE-olefines"].fuel_top_speed_multiplier = 1

data.raw.fluid["VPE-aromatics"].fuel_value = tostring(MethaneFuel*5).."kJ"
data.raw.fluid["VPE-aromatics"].emissions_multiplier = 1
data.raw.fluid["VPE-aromatics"].fuel_acceleration_multiplier = 1
data.raw.fluid["VPE-aromatics"].fuel_top_speed_multiplier = 1

data.raw.fluid["VPE-pygas"].fuel_value = tostring(MethaneFuel*5).."kJ"
data.raw.fluid["VPE-pygas"].emissions_multiplier = 1
data.raw.fluid["VPE-pygas"].fuel_acceleration_multiplier = 1
data.raw.fluid["VPE-pygas"].fuel_top_speed_multiplier = 1

data.raw.fluid["adamo-carbon-syngas"].fuel_value = tostring(MethaneFuel*2).."kJ"
data.raw.fluid["adamo-carbon-syngas"].emissions_multiplier = 0.5
data.raw.fluid["adamo-carbon-syngas"].fuel_acceleration_multiplier = 0.8
data.raw.fluid["adamo-carbon-syngas"].fuel_top_speed_multiplier = 0.8

data.raw.fluid["light-oil"].fuel_value = tostring(MethaneFuel*8).."kJ"
data.raw.fluid["light-oil"].emissions_multiplier = 1
data.raw.fluid["light-oil"].fuel_acceleration_multiplier = 1.8
data.raw.fluid["light-oil"].fuel_top_speed_multiplier = 1.5

data.raw.fluid["VPE-naphta"].fuel_value = tostring(MethaneFuel*10).."kJ"
data.raw.fluid["VPE-naphta"].emissions_multiplier = 1.5
data.raw.fluid["VPE-naphta"].fuel_acceleration_multiplier = 1.8
data.raw.fluid["VPE-naphta"].fuel_top_speed_multiplier = 1.5

data.raw.fluid["VPE-reformate"].fuel_value = tostring(MethaneFuel*10).."kJ"
data.raw.fluid["VPE-reformate"].emissions_multiplier = 1
data.raw.fluid["VPE-reformate"].fuel_acceleration_multiplier = 1.5
data.raw.fluid["VPE-reformate"].fuel_top_speed_multiplier = 1.5

data.raw.fluid["VPE-gasoline"].fuel_value = tostring(MethaneFuel*12).."kJ"
data.raw.fluid["VPE-gasoline"].emissions_multiplier = 0.9
data.raw.fluid["VPE-gasoline"].fuel_acceleration_multiplier = 2.25
data.raw.fluid["VPE-gasoline"].fuel_top_speed_multiplier = 1.75

data.raw.fluid["VPE-kerosene"].fuel_value = tostring(MethaneFuel*15).."kJ"
data.raw.fluid["VPE-kerosene"].emissions_multiplier = 1
data.raw.fluid["VPE-kerosene"].fuel_acceleration_multiplier = 2
data.raw.fluid["VPE-kerosene"].fuel_top_speed_multiplier = 1.5

data.raw.fluid["VPE-raw-kerosene"].fuel_value = tostring(MethaneFuel*18).."kJ"
data.raw.fluid["VPE-raw-kerosene"].emissions_multiplier = 1.5
data.raw.fluid["VPE-raw-kerosene"].fuel_acceleration_multiplier = 2
data.raw.fluid["VPE-raw-kerosene"].fuel_top_speed_multiplier = 1.5

data.raw.fluid["heavy-oil"].fuel_value = tostring(MethaneFuel*18).."kJ"
data.raw.fluid["heavy-oil"].emissions_multiplier = 1
data.raw.fluid["heavy-oil"].fuel_acceleration_multiplier = 1.2
data.raw.fluid["heavy-oil"].fuel_top_speed_multiplier = 1.5

data.raw.fluid["VPE-fuel-oil"].fuel_value = tostring(MethaneFuel*20).."kJ"
data.raw.fluid["VPE-fuel-oil"].emissions_multiplier = 1.5
data.raw.fluid["VPE-fuel-oil"].fuel_acceleration_multiplier = 1.2
data.raw.fluid["VPE-fuel-oil"].fuel_top_speed_multiplier = 1.5

data.raw.fluid["VPE-long-residue"].fuel_value = tostring(MethaneFuel*10).."kJ"
data.raw.fluid["VPE-long-residue"].emissions_multiplier = 5
data.raw.fluid["VPE-long-residue"].fuel_acceleration_multiplier = 0.8
data.raw.fluid["VPE-long-residue"].fuel_top_speed_multiplier = 0.8

data.raw.fluid["crude-oil"].fuel_value = tostring(MethaneFuel*20).."kJ"
data.raw.fluid["crude-oil"].emissions_multiplier = 3
data.raw.fluid["crude-oil"].fuel_acceleration_multiplier = 1.2
data.raw.fluid["crude-oil"].fuel_top_speed_multiplier = 1.2

data.raw.fluid["hydrogen-sulfide"].fuel_value = tostring(MethaneFuel*5).."kJ"
data.raw.fluid["hydrogen-sulfide"].emissions_multiplier = 10
data.raw.fluid["hydrogen-sulfide"].fuel_acceleration_multiplier = 1.1
data.raw.fluid["hydrogen-sulfide"].fuel_top_speed_multiplier = 1.1

--Remove Liquid Fuel, we got it covered
if (mods["bobplates"]) then
	LSlib.technology.removeRecipeUnlock("oil-processing", "liquid-fuel")
end