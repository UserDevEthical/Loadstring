repeat task.wait() until game:IsLoaded()
local TablePlace = {7449423635,2753915549,4442272183}
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Read", -- Required
	Text = "I'm updating, Wait me ~", -- Required
	Icon = "rbxassetid://9709149431", -- Optional
	Duration = 5
})
if table.find(TablePlace,game.PlaceId) then
    _G.Game = "BF"
    _G.Key = "Xzt7M9IAfF"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/BF-New.lua"))()
else
    game.Players.LocalPlayer:Kick("not Support")
end
