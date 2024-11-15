
local RunService = game:GetService("RunService")
local RenderStepped = RunService.Heartbeat
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Icons = require("../Icons/Init.lua")
local Creator = {}

function Creator:Icon(Icon)
    local filePath = "RefinedUI/Assets/spritesheet-new.png"
    if not isfile(filePath) then
        local response = game:HttpGet("https://raw.githubusercontent.com/BuildButterHub/RefinedUI/refs/heads/main/Icons/Init.lua")
        writefile(filePath, response)
    end
    return { getcustomasset(filePath), Icons[Icon] }
end
