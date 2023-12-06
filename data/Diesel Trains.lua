local OilFluids = {
	data.raw["fluid"]["adamo-carbon-methane"],
	data.raw["fluid"]["adamo-carbon-syngas"],
	data.raw["fluid"]["adamo-carbon-natural-gas"],
	data.raw["fluid"]["petroleum-gas"],
	data.raw["fluid"]["VPE-olefines"],
	data.raw["fluid"]["VPE-aromatics"],
	data.raw["fluid"]["VPE-pygas"],
	data.raw["fluid"]["VPE-naphta"],
	data.raw["fluid"]["VPE-reformate"],
	data.raw["fluid"]["VPE-gasoline"],
	data.raw["fluid"]["VPE-kerosene"],
	data.raw["fluid"]["VPE-raw-kerosene"],
	data.raw["fluid"]["VPE-fuel-oil"],
	data.raw["fluid"]["VPE-long-residue"],
	data.raw["fluid"]["crude-oil"],
}
for _, fluid in pairs(OilFluids) do
	local proxy = {
		type = "item",
		icon = fluid.icon,
		icon_size = fluid.icon_size,
		icon_mipmaps = fluid.icon_mipmaps,
		icons = fluid.icons,
		stack_size = 1500,
		fuel_category = "Diesel-Locomotive-fluid",
		flags = {"hidden"},
		name = "Diesel-Locomotive-"..fluid.name,
		localised_name = {"", {fluid.name}},
		fuel_value = fluid.fuel_value,
	}
	data:extend({proxy})
end

data.raw.item["Diesel-Locomotive-adamo-carbon-methane"].fuel_acceleration_multiplier = 2.5
data.raw.item["Diesel-Locomotive-adamo-carbon-methane"].fuel_top_speed_multiplier = 1.2

data.raw.item["Diesel-Locomotive-adamo-carbon-natural-gas"].fuel_acceleration_multiplier = 1.1
data.raw.item["Diesel-Locomotive-adamo-carbon-natural-gas"].fuel_top_speed_multiplier = 1.1

data.raw.item["Diesel-Locomotive-petroleum-gas"].fuel_acceleration_multiplier = 2.5
data.raw.item["Diesel-Locomotive-petroleum-gas"].fuel_top_speed_multiplier = 1.1

data.raw.item["Diesel-Locomotive-VPE-olefines"].fuel_acceleration_multiplier = 1
data.raw.item["Diesel-Locomotive-VPE-olefines"].fuel_top_speed_multiplier = 1

data.raw.item["Diesel-Locomotive-VPE-aromatics"].fuel_acceleration_multiplier = 1
data.raw.item["Diesel-Locomotive-VPE-aromatics"].fuel_top_speed_multiplier = 1

data.raw.item["Diesel-Locomotive-VPE-pygas"].fuel_acceleration_multiplier = 1
data.raw.item["Diesel-Locomotive-VPE-pygas"].fuel_top_speed_multiplier = 1

data.raw.item["Diesel-Locomotive-adamo-carbon-syngas"].fuel_acceleration_multiplier = 0.8
data.raw.item["Diesel-Locomotive-adamo-carbon-syngas"].fuel_top_speed_multiplier = 0.8

data.raw.item["Diesel-Locomotive-light-oil"].fuel_acceleration_multiplier = 1.8
data.raw.item["Diesel-Locomotive-light-oil"].fuel_top_speed_multiplier = 1.5

data.raw.item["Diesel-Locomotive-VPE-naphta"].fuel_acceleration_multiplier = 1.8
data.raw.item["Diesel-Locomotive-VPE-naphta"].fuel_top_speed_multiplier = 1.5

data.raw.item["Diesel-Locomotive-VPE-reformate"].fuel_acceleration_multiplier = 1.5
data.raw.item["Diesel-Locomotive-VPE-reformate"].fuel_top_speed_multiplier = 1.5

data.raw.item["Diesel-Locomotive-VPE-gasoline"].fuel_acceleration_multiplier = 2.25
data.raw.item["Diesel-Locomotive-VPE-gasoline"].fuel_top_speed_multiplier = 1.75

data.raw.item["Diesel-Locomotive-VPE-kerosene"].fuel_acceleration_multiplier = 2
data.raw.item["Diesel-Locomotive-VPE-kerosene"].fuel_top_speed_multiplier = 1.5

data.raw.item["Diesel-Locomotive-VPE-raw-kerosene"].fuel_acceleration_multiplier = 2
data.raw.item["Diesel-Locomotive-VPE-raw-kerosene"].fuel_top_speed_multiplier = 1.5

data.raw.item["Diesel-Locomotive-heavy-oil"].fuel_acceleration_multiplier = 1.2
data.raw.item["Diesel-Locomotive-heavy-oil"].fuel_top_speed_multiplier = 1.5

data.raw.item["Diesel-Locomotive-VPE-fuel-oil"].fuel_acceleration_multiplier = 1.2
data.raw.item["Diesel-Locomotive-VPE-fuel-oil"].fuel_top_speed_multiplier = 1.5

data.raw.item["Diesel-Locomotive-VPE-long-residue"].fuel_acceleration_multiplier = 0.8
data.raw.item["Diesel-Locomotive-VPE-long-residue"].fuel_top_speed_multiplier = 0.8

data.raw.item["Diesel-Locomotive-crude-oil"].fuel_acceleration_multiplier = 1.2
data.raw.item["Diesel-Locomotive-crude-oil"].fuel_top_speed_multiplier = 1.2