fx_version 'cerulean'

author 'Ace-Purp'
version '1.0.1'
description 'Givecash to player near you'

game 'gta5'

files {
    'config.lua',
    'client/main.lua',
    'server/main.lua'
}

shared_scripts {
	'@es_extended/imports.lua',
    'config.lua'
}

client_script 'client/main.lua'

server_script 'server/main.lua'
