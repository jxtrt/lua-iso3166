-- iso3166.lua

local M = {}

M.DATA_VERSION = "ISO-3166 2025-11"
M.LOOKUP_DATE = "2025-11-15"

local function Country(name, alpha2, alpha3, numeric)
    local private = {
        name = name,
        alpha2 = alpha2,
        alpha3 = alpha3,
        numeric = numeric
    }

    local proxy = {}
    setmetatable(proxy, {
        __index = private,
        __newindex = function()
            error("Country data is immutable.", 2)
        end,
        __metatable = false
    })

    return proxy
end

local raw_countries = require("data.countries")

-- countries table
local countries = {}

--indices
local _by_alpha2 = {}
local _by_alpha3 = {}
local _by_numeric = {}

--building base table and indices
for _, raw_c in pairs(raw_countries) do
    local country = Country(raw_c.name, raw_c.alpha2, raw_c.alpha3, raw_c.numeric)
    table.insert(countries, country)

    _by_alpha2[country.alpha2] = country
    _by_alpha3[country.alpha3] = country
    _by_numeric[country.numeric] = country
end


--public intface
function M.by_alpha2(code)
    code = string.upper(code)
    return _by_alpha2[code]
end

function M.by_alpha3(code)
    code = string.upper(code)
    return _by_alpha3[code]
end

function M.by_numeric(code)
    code = string.format("%03d", tonumber(code)) --leading zeros and int support
    return _by_numeric[code]
end

function M.list()
    local list = {}
    for _, country in pairs(countries) do
        table.insert(list, country)
    end
    return list
end

return M