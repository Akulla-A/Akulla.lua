-- j'ai yoink la lib string de gmod
require "deps/string_gmod"

-- Luvit lib pour lire les fichiers
local fs = require('fs')
local discordia = require('discordia')
local client = discordia.Client()
local token = ""

-- On charge les modules
local modules = {}
fs.readdir("modules/", function(_, files)
    for k,v in pairs(files) do
        local clean_name = string.Replace(v, ".lua", "")
        modules[clean_name] = require("modules/"..clean_name)
    end
end)

-- Bot Start
client:run("Bot "..token)

client:on('ready', function()
	client:setGame({
        name = "gg/avWae3Sw9t",
    })
end)

-- on messageCreate
client:on('messageCreate', function(msg)
    for k, v in pairs(modules) do 
        if v.type == "messageCreate" then
            v:Func(msg)
        end
    end
end)