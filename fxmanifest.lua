fx_version 'adamant'

game 'gta5'

client_scripts {
    '@es_extended/locale.lua',
    'locales/fr.lua',
    'config.lua',
    'cl_ammunation.lua',
    'menu.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'sv_ammunation.lua',
}



dependencies {
    'es_extended'
}
