fx_version 'bodacious'
games {'gta5'}

description 'Striez Mechanics'
version '1.0.0'

client_scripts {
    "@fyx/client/lib.js",
    "@str-lib/client/cl_ui.js",
    "@str-lib/client/cl_ui.lua",
    "@str-lib/client/cl_rpcs.js",
    "@str-lib/client/cl_rpcs.lua",
    'client/cl_*.js',
    'client/cl_*.lua',
}

shared_scripts {
    "shared/sh_*.lua",
}

server_scripts {
    "@fyx/server/lib.js",
    "@str-lib/server/sv_rpcs.js",
    "@str-lib/server/sv_rpcs.lua",
    'server/sv_*.js',
    'server/sv_*.lua',
}