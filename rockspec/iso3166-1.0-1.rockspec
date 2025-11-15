package = "iso3166"
version = "1.0-1"
source = {
    url = "https://github.com/jxtrt/lua-iso3166/archive/refs/tags/v1.0.tar.gz",
    tag = "v1.0"
}
description = {
    summary = "ISO 3166 reference library for Lua",
    detailed = [[
        Small reference library providing ISO 3166 A1, A2 and numeric country codes.
    ]],
    homepage = "https://github.com/jxtrt/lua-iso3166",
    license = "MIT"
}
dependencies = {}
build = {
    type = "builtin",
    modules = {
        ["iso3166"] = "iso3166.lua",
        ["data.countries"] = "data/countries.lua"
    }
}
