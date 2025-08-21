repeat task.wait() until game:IsLoaded()

-- Don't execute twice
if getgenv()._LoaderExecuted then
    warn("!")
    return
end
getgenv()._LoaderExecuted = true

local Loader = {}
Loader.__index = Loader

local function LoadS(url, retries)
    retries = retries or 2
    local ok, fn = pcall(function() return loadstring(game:HttpGet(url)) end)
    if ok and fn then
        task.spawn(fn)
    elseif retries > 0 then
        task.delay(0.25 + math.random() * 0.1, function() LoadS(url, retries - 1) end)
    end
end

function Loader.new()
    local self = setmetatable({G = {}}, Loader)
    function self:add(name, P, S)
        self.G[name] = {P = P, S = S}
    end
    function self:get(placeId)
        for name, info in pairs(self.G) do
            if table.find(info.P, placeId) then return name, info end
        end
    end
    function self:run(showNotif)
        local name, info = self:get(game.PlaceId)
        if not info then
            game.Players.LocalPlayer:Kick("Game not supported")
            return
        end

        getgenv().Game = "BF" -- or name
        if showNotif then
            pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Loader",
                    Text = "Loading " .. name .. "\n(Ty for using!)",
                    Icon = "rbxassetid://9709149431",
                    Duration = 15
                })
            end)
        end

        for _, url in ipairs(info.S) do
            LoadS(url)
        end
    end
    return self
end

local Load = Loader.new()

Load:add("Blox Fruits", {7449423635, 2753915549, 4442272183}, {"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/Loader.lua"})
Load:add("Grow A Garden", {126884695634066}, {"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/Loader.lua"})

Load:run(true) -- true & false
