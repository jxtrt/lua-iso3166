-- test file for iso3166 module

local iso3166 = require("iso3166")
local assert = require("luassert")

-- test by_alpha2
local spain = iso3166.by_alpha2("ES")
assert.is_not_nil(spain)
assert.are.equal(spain.name, "Spain")

-- test by_alpha3
local france = iso3166.by_alpha3("FRA")
assert.is_not_nil(france)
assert.are.equal(france.name, "France")

-- test by_numeric
local portugal = iso3166.by_numeric("620")
assert.is_not_nil(portugal)
assert.are.equal(portugal.name, "Portugal")

-- test list
local countries = iso3166.list()
assert.is_table(countries)

-- test immutability
local germany = iso3166.by_alpha2("DE")
assert.has_error(function() germany.name = "foo" end, "Country data is immutable.")

print("Tests passed.")