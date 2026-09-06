--// Don't execute twice
-- if getgenv()._LoaderExecuted then warn("!") return end
-- getgenv()._LoaderExecuted = true

--// Safe Load Function (Stable)
local function LoadURL(url, retries)
    retries = retries or 2

    local function safeHttpGet(u)
        local ok, res = pcall(function()
            return game:HttpGet(u)
        end)
        return ok and res or nil
    end

    local function safeLoad(str)
        if not str then return nil end

        -- Fallback loadstring
        local ok, fn = pcall(function()
            local loader = loadstring or load
            return loader(str)
        end)

        return ok and fn or nil
    end

    --// Try load
    local source = safeHttpGet(url)
    local fn = safeLoad(source)

    if fn then
        task.spawn(fn)
        return true
    end

    --// Retry if fail
    if retries > 0 then
        task.wait(0.25)
        return LoadURL(url, retries - 1)
    end

    warn("[Loader] Failed to load:", url)
    return false
end


--// Loader Class
local Loader = {}
Loader.__index = Loader

function Loader.new()
    return setmetatable({Games = {}}, Loader)
end

function Loader:Add(name, gameIds, scriptUrls)
    self.Games[name] = {P = gameIds, S = scriptUrls}
end

function Loader:Get(gameId)
    for name, data in next, self.Games do
        if table.find(data.P, gameId) then
            return name, data.S
        end
    end
end

function Loader:Run(showNotif)
    local name, scripts = self:Get(game.GameId)
    if not scripts then
        warn("[Loader] No game matched current GameId")
        return
    end

    getgenv().Game = "BF"

    if showNotif then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Loader",
                Text = "Loading " .. name .. "\n(...Updating!!)",
                Icon = "rbxassetid://9709149431",
                Duration = 30
            })
        end)
    end

    for _, url in ipairs(scripts) do
        local ok = LoadURL(url, 3)
        if not ok then
            warn("[Loader] Could not load:", url)
        end
    end
end

--// Initialize
local L = Loader.new()

L:Add("Blox Fruits",
    {994732206},
    {"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/Loader.lua"}
)

L:Add("Grow A Garden",
    {7436755782},
    {"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/Loader.lua"}
)

L:Add("99 Nights in the Forest",
    {7326934954},
    {"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/Loader.lua"}
)
L:Run(true) -- true/false















