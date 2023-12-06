local OilFluids = {
	"adamo-carbon-methane",
	"adamo-carbon-syngas",
	"adamo-carbon-natural-gas",
	"petroleum-gas",
	"VPE-olefines",
	"VPE-aromatics",
	"VPE-pygas",
	"VPE-naphta",
	"VPE-reformate",
	"VPE-gasoline",
	"VPE-kerosene",
	"VPE-raw-kerosene",
	"VPE-fuel-oil",
	"VPE-long-residue",
	"crude-oil",
}

if remote.interfaces["fluidTrains_hook"] then
	local function ON_INIT(fluid)
		remote.call("fluidTrains_hook", "addFluid", "Diesel-Locomotive-fluid", fluid, {{item = "Diesel-Locomotive-"..fluid}})
	end

	local function ON_INIT_FOR()
		for _, fluid in pairs(OilFluids) do
			ON_INIT(fluid)
		end
	end

	script.on_init(ON_INIT_FOR)
	script.on_configuration_changed(ON_INIT_FOR)
end