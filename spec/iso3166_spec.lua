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

--test casing
local italy = iso3166.by_alpha2("it")
assert.is_not_nil(italy)
assert.are.equal(italy.name, "Italy")

--test numeric with leading zeros
local japan = iso3166.by_numeric("392")
assert.are.equal(japan.name, "Japan")
local zero_japan = iso3166.by_numeric("0392")
assert.are.equal(zero_japan.name, "Japan")
local int_japan = iso3166.by_numeric(392)
assert.are.equal(int_japan.name, "Japan")
local albania = iso3166.by_numeric("8") -- full code being 008
assert.are.equal(albania.name, "Albania")

print("Tests passed.")