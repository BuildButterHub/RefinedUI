local Icons = require("../Icons/Init.lua")
local Creator = {}

function Creator:Icon(Icon)
    local filePath = "WindUI/Assets/spritesheet-new.png"
    if not isfile(filePath) then
        local response = game:HttpGet("https://raw.githubusercontent.com/BuildButterHub/RefinedUI/refs/heads/main/Icons/Init.lua")
        writefile(filePath, response)
    end
    return { getcustomasset(filePath), Icons[Icon] }
end
