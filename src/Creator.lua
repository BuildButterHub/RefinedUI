local Icons = require("../Icons/Init.lua")
local Creator = {}

function Creator:Icon(Icon)
    local filePath = "WindUI/Assets/spritesheet-new.png"
    if not isfile(filePath) then
        local response = game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/Lucide/Icons/spritesheet-new.png")
        writefile(filePath, response)
    end
    return { getcustomasset(filePath), Icons[Icon] }
end
