require("__LSlib_James_Fork__/LSlib")


if data.raw.fluid["bob-hydrogen"] then
	Hydrogen = "bob-hydrogen"
elseif data.raw.fluid["kr-hydrogen"] then
	Hydrogen = "kr-hydrogen"
else
	Hydrogen = "hydrogen"
end
if data.raw.fluid["bob-hydrogen-sulfide"] then
	Sulfide = "bob-hydrogen-sulfide"
else
	Sulfide = "hydrogen-sulfide"
end

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





