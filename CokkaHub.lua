--// Don't execute twice
if getgenv()._LoaderExecuted then warn("!") return end
getgenv()._LoaderExecuted = true

--// Silent Load Function
local function LoadURL(url, retries)
    retries = retries or 2

    local ok, fn = pcall(function()
        return loadstring(game:HttpGet(url))
    end)

    if ok and fn then
        task.spawn(fn)
        return
    end

    if retries > 0 then
        task.delay(0.25, function()
            LoadURL(url, retries - 1)
        end)
    end
end

--// Loader Class
local Loader = {}
Loader.__index = Loader

function Loader.new()
    return setmetatable({Games = {}}, Loader)
end

function Loader:Add(name, placeIds, scriptUrls)
    self.Games[name] = {P = placeIds, S = scriptUrls}
end

function Loader:Get(placeId)
    for name, data in next, self.Games do
        if table.find(data.P, placeId) then
            return name, data.S
        end
    end
end

function Loader:Run(showNotif)
    local name, scripts = self:Get(game.PlaceId)
    if not scripts then return end

    getgenv().Game = "BF" -- or name

    if showNotif then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                 Title = "Loader",
                 Text = "Loading " .. name .. "\n(...Wanna Update?!)",
                 Icon = "rbxassetid://9709149431",
                 Duration = 15
             })
        end)
    end

    for _, url in ipairs(scripts) do
        LoadURL(url, 2) -- Retry 2 times
    end
end

--// Initialize
local L = Loader.new()

L:Add("Blox Fruits",
    {7449423635, 2753915549, 4442272183},
    {"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/Loader.lua"}
)

L:Add("Grow A Garden",
    {126884695634066},
    {"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/Loader.lua"}
)

L:Run(true) -- true/false
